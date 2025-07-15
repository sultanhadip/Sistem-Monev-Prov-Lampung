@foreach ($monitoringKegiatan as $index => $item)
<tr>
    <td scope="row">{{ $monitoringKegiatan->firstItem() + $index }}</td>
    <td>{{ $item->timkerja->nama_tim ?? 'N/A' }}</td> <!-- Nama Tim Kerja -->
    <td>
        <a href="{{ route('detail-monitoring-kegiatan', ['id' => $item->id]) }}">
            {{ $item->datakegiatan->nama_kegiatan }}
        </a>
    </td>
    <td>{{ $item->periode_kegiatan ?? '-' }}</td> <!-- Menampilkan Periode -->
    <td>{{ $item->target ?? '0' }}</td>
    <td>{{ $item->realisasi ?? '0' }}</td>
    <td>{{ $item->persentase }}</td>
    <td>{{ $item->waktu_kegiatan ?? '-' }}</td>
    <td>
        @if ($item->status === 'SELESAI')
        <span class="badge bg-success text-white">{{ $item->status }}</span>
        @elseif ($item->status === 'BELUM DIMULAI')
        <span class="badge bg-danger text-white">{{ $item->status }}</span>
        @elseif ($item->status === 'ON PROGRESS')
        <span class="badge bg-warning text-white">{{ $item->status }}</span>
        @else
        <span class="badge bg-secondary text-white">{{ $item->status }}</span>
        @endif
    </td>
    @if ($canAccessVerifikasi)
    <td>
        <!-- Container for the buttons -->
        <div class="d-flex">
            <!-- Edit Button -->
            <!-- Edit Button -->
            <button
                class="btn btn-sm btn-icon btn-white text-primary border-0"
                data-bs-toggle="modal"
                data-bs-target="#editModal"
                data-id="{{ $item->id }}"
                data-kode_tim="{{ $item->kode_tim }}"
                data-kode_kegiatan="{{ $item->kode_kegiatan }}"
                data-waktu_mulai="{{ $item->waktu_mulai }}"
                data-waktu_selesai="{{ $item->waktu_selesai }}"
                data-target_sampel="{{ json_encode($item->target_sampel) }}">
                <i class="bi bi-pencil-square fs-6"></i>
            </button>


            <!-- Delete Button -->
            <button
                class="btn btn-sm btn-icon btn-white text-danger border-0"
                data-bs-toggle="modal"
                data-bs-target="#deleteModal"
                data-url="{{ route('monitoringkegiatan.destroy', $item->id) }}">
                <i class="bi bi-trash fs-6"></i>
            </button>

        </div>
    </td>
    @endif
</tr>
@endforeach