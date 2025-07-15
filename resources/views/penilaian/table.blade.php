@foreach($penilaian as $key => $nilai)
<tr>
    <td>
        {{ $nilai->satuanKerja ? "[{$nilai->satuanKerja->kode_satuan_kerja}] {$nilai->satuanKerja->nama_satuan_kerja}" : 'N/A' }}
    </td>
    <td>{{ $nilai->periode_kinerja }}</td>
    <td>{{ $nilai->nilai_kinerja }}</td>
</tr>
@endforeach