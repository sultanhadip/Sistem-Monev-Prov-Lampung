<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\EditSertifikat;
use App\Models\Sertifikat;
use App\Models\Penilaian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use setasign\Fpdi\Fpdi;

class SertifikatController extends Controller
{
    public function index(Request $request)
    {
        // Ambil filter bulan dan tahun dari query string
        $filterBulan = $request->input('filter_bulan');
        $filterTahun = $request->input('filter_tahun');
        $recordsPerPage = $request->input('recordsPerPage', 10); // Default 10 records per page

        // ambil 4 karakter terakhir dari periode_kinerja, cast ke integer, lalu unik & urutkan
        $years = Penilaian::selectRaw(
            "DISTINCT CAST(RIGHT(periode_kinerja, 4) AS UNSIGNED) AS year"
        )
            ->orderByDesc('year')
            ->pluck('year');

        // Bangun query untuk filter berdasarkan bulan dan tahun
        $sertifikat = Sertifikat::with('penilaian.satuanKerja')  // Pastikan relasi dimuat
            ->when($filterBulan, function ($query) use ($filterBulan) {
                // Mengambil nama bulan dari angka bulan
                $monthName = \Carbon\Carbon::createFromFormat('m', $filterBulan)->locale('id')->monthName;
                // Filter berdasarkan bulan
                $query->whereHas('penilaian', function ($query) use ($monthName) {
                    $query->where('periode_kinerja', 'like', "%$monthName%");
                });
            })
            ->when($filterTahun, function ($query) use ($filterTahun) {
                // Jika ada filter tahun, tambahkan kondisi tahun
                $query->whereHas('penilaian', function ($query) use ($filterTahun) {
                    $query->where('periode_kinerja', 'like', "%$filterTahun%");
                });
            })
            ->paginate($recordsPerPage);

        // Kirim data ke view
        return view('sertifikat', compact('sertifikat', 'filterBulan', 'filterTahun', 'years'));
    }

    public function generateCertificate($sertifikatId, $download = false)
    {
        // Mengambil data sertifikat berdasarkan ID
        $sertifikat = Sertifikat::with('penilaian.satuanKerja') // Memuat penilaian dan satuanKerja
            ->find($sertifikatId);

        if (!$sertifikat) {
            // Jika sertifikat tidak ditemukan, beri response atau throw error
            return response()->json(['error' => 'Sertifikat tidak ditemukan'], 404);
        }

        // Ambil data kepala BPS & jabatan dari database (tabel edit_sertifikats)
        $kepalaData = EditSertifikat::first();
        $namaKepala = $kepalaData->nama ?? 'Atas Parlindungan Lubis';
        $jabatanKepala = $kepalaData->jabatan ?? 'Kepala Badan Pusat Statistik';

        // Ambil data dari objek sertifikat dan relasi penilaian
        $nomor_sertifikat = $sertifikat->nomor_sertifikat;
        $penilaian = $sertifikat->penilaian; // Relasi penilaian
        $nama_satuan_kerja = $penilaian->satuanKerja->nama_satuan_kerja; // Relasi satuan kerja
        $peringkat = $penilaian->peringkat;
        $periode_kinerja = $penilaian->periode_kinerja;

        // Membuat instance PDF
        $pdf = new Fpdi();

        // Menambahkan halaman kosong berwarna putih dengan ukuran A4
        $pdf->AddPage('L', 'A4');  // 'P' untuk Portrait, 'A4' untuk ukuran A4

        // Menambahkan logo pertama di pojok kiri atas
        $pdf->Image('assets/img/bps.png', 10, 10, 45); // Ganti dengan path logo Anda

        // Menambahkan logo kedua di pojok kanan atas
        $pdf->Image('assets/img/logoberakhlak.png', 197, 10, 45); // Ganti dengan path logo Anda

        // Menambahkan logo ketiga di pojok kanan atas
        $pdf->Image('assets/img/logomelayani.png', 245, 12, 30); // Path ke file logo, X, Y, ukuran (45mm lebar)

        $pdf->SetFont('Arial', 'BI', 12);
        $pdf->SetXY(47, 18); // Posisi X disesuaikan agar tulisan rapat dengan logo
        $pdf->Cell(0, 5, 'BADAN PUSAT STATISTIK', 0, 1, 'L');

        $pdf->SetFont('Arial', 'BI', 12);
        $pdf->SetX(47); // Mengatur posisi X tetap rapat dengan logo
        $pdf->Cell(0, 7, 'PROVINSI LAMPUNG', 0, 1, 'L');

        $pdf->Ln(10); // Jarak antar elemen setelah header

        // Konten Tengah
        $pdf->Ln(8); // Memberikan jarak dari header
        $pdf->SetFont('Arial', 'B', 30);
        $pdf->Cell(0, 12, 'SERTIFIKAT', 0, 1, 'C');
        $pdf->Ln(1.5); // Jarak antar elemen
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->MultiCell(0, 12, "Nomor: $nomor_sertifikat", 0, 'C');
        $pdf->Ln(1.5); // Jarak antar elemen sekitar 1.5
        $pdf->SetFont('Arial', '', 12);
        $pdf->Cell(0, 6, 'Diberikan Kepada', 0, 1, 'C');
        $pdf->Ln(1.5); // Jarak antar elemen sekitar 1.5
        $pdf->SetFont('Arial', 'B', 16);
        $pdf->Cell(0, 10, $nama_satuan_kerja, 0, 1, 'C');
        $pdf->Ln(1.5); // Jarak untuk paragraf berikutnya
        $pdf->SetFont('Arial', '', 12);
        $pdf->MultiCell(0, 7, "Sebagai Satuan Kerja dengan Kinerja Terbaik $peringkat pada periode $periode_kinerja", 0, 'C'); // Mengambil keterangan dari database
        $pdf->Ln(1.5); // Jarak untuk paragraf berikutnya
        $pdf->MultiCell(0, 7, "di Lingkungan Badan Pusat Statistik Provinsi Lampung", 0, 'C');
        $pdf->Ln(1.5); // Jarak untuk paragraf berikutnya

        // Mendapatkan tanggal dalam format Indonesia
        $dateIndo = \Carbon\Carbon::now()->locale('id')->translatedFormat('d F Y'); // Example: "10 Maret 2025"
        // Menggunakan tanggal yang sudah diformat
        $pdf->Cell(0, 30, 'Bandar Lampung, ' . $dateIndo, 0, 1, 'C');
        $pdf->Ln(15);

        // Footer
        $pdf->SetY(-80); // Posisi naik sedikit
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->Cell(0, 6, $jabatanKepala, 0, 1, 'C');
        $pdf->Cell(0, 6, 'Provinsi Lampung', 0, 1, 'C');
        $pdf->Ln(25);
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->Cell(0, 6, $namaKepala, 0, 1, 'C');

        // Menambahkan ornamen besar yang menutupi seluruh pojok sertifikat
        $pdf->Image('assets/img/ornamen.png', 0, 0, 297, 210); // Menutupi seluruh halaman A4, landscape mode

        // Menentukan apakah kita akan mendownload atau menampilkan PDF
        if ($download) {
            // Jika $download true, maka PDF diunduh
            return $pdf->Output('D', 'sertifikat_' . $nomor_sertifikat . '.pdf');
        } else {
            // Jika $download false, maka PDF ditampilkan
            return $pdf->Output('I', 'Sertifikat_' . $nomor_sertifikat . '.pdf');
        }
    }

    public function generate()
    {
        // Mendapatkan bulan dan tahun saat ini
        $currentMonth = now()->format('m');  // Mendapatkan bulan saat ini
        $currentYear = now()->format('Y');   // Mendapatkan tahun saat ini

        // Menggunakan Carbon untuk mengubah format bulan menjadi nama bulan
        $bulanNama = now()->monthName; // Carbon menghasilkan nama bulan dalam bahasa Inggris

        // Array untuk mengubah bulan dari bahasa Inggris ke bahasa Indonesia
        $bulanIndo = [
            'January' => 'Januari',
            'February' => 'Februari',
            'March' => 'Maret',
            'April' => 'April',
            'May' => 'Mei',
            'June' => 'Juni',
            'July' => 'Juli',
            'August' => 'Agustus',
            'September' => 'September',
            'October' => 'Oktober',
            'November' => 'November',
            'December' => 'Desember'
        ];

        // Mengubah nama bulan dalam bahasa Inggris menjadi bahasa Indonesia
        $bulanNamaIndo = $bulanIndo[$bulanNama] ?? $bulanNama; // Jika bulan tidak ditemukan, tetap gunakan nama bulan aslinya

        $currentPeriod = $bulanNamaIndo . ' ' . $currentYear; // Format menjadi "Maret 2025"

        // Menentukan bulan dalam angka Romawi
        $romawiMonths = [
            '01' => 'I',
            '02' => 'II',
            '03' => 'III',
            '04' => 'IV',
            '05' => 'V',
            '06' => 'VI',
            '07' => 'VII',
            '08' => 'VIII',
            '09' => 'IX',
            '10' => 'X',
            '11' => 'XI',
            '12' => 'XII'
        ];
        $monthInRoman = $romawiMonths[$currentMonth];

        // Mengambil nomor sertifikat tertinggi untuk periode yang sama (bulan dan tahun)
        $lastSertifikat = Sertifikat::whereHas('penilaian', function ($query) use ($currentYear, $currentMonth) {
            $query->where('periode_kinerja', $currentMonth . '-' . $currentYear);
        })
            ->selectRaw('MAX(CAST(SUBSTRING_INDEX(nomor_sertifikat, \'/\', 1) AS UNSIGNED)) as last_number')
            ->first();

        // Menentukan nomor sertifikat berikutnya
        // Jika tidak ada sertifikat sebelumnya, mulai dari 0, jika ada, lanjutkan dari nomor tertinggi
        $startingIndex = $lastSertifikat && $lastSertifikat->last_number ? $lastSertifikat->last_number : 0;

        // Mengambil data penilaian peringkat 1, 2, dan 3
        $topThreePenilaian = Penilaian::where('periode_kinerja', $currentPeriod)
            ->whereIn('peringkat', [1, 2, 3])
            ->orderBy('peringkat', 'asc')
            ->get();

        // Generate sertifikat untuk peringkat 1, 2, dan 3
        foreach ($topThreePenilaian as $index => $item) {
            // Membuat nomor sertifikat sesuai format
            $nomorSertifikat = ($startingIndex + $index + 1) . '/BPS/KINERJA/' . $monthInRoman . '/' . $currentYear;

            // Cek apakah sertifikat sudah ada
            $existingCertificate = Sertifikat::where('id_penilaian', $item->id)->first();
            if ($existingCertificate) {
                // Jika sertifikat sudah ada, update nomor sertifikatnya
                $existingCertificate->update(['nomor_sertifikat' => $nomorSertifikat]);
            } else {
                // Jika sertifikat belum ada, buat sertifikat baru
                Sertifikat::create([
                    'id_penilaian' => $item->id,
                    'nomor_sertifikat' => $nomorSertifikat,
                ]);
            }
        }

        return response()->json(['message' => 'Sertifikat berhasil digenerate']);
    }
}
