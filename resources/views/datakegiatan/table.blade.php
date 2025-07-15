@foreach($datakegiatan as $key => $tim)
<tr>
    <td scope="row">{{ $datakegiatan->perPage() * ($datakegiatan->currentPage() - 1) + $key + 1 }}</td>
    <td>{{ $tim->nama_kegiatan }}</td>
    <td>{{ $tim->timkerja->nama_tim ?? 'Tidak ada tim' }}</td>
    <td>{{ $tim->objek_kegiatan }}</td>
    <td>{{ $tim->periode_kegiatan }}</td>
    <td>
        <!-- Edit Button -->
        <button
            class="btn btn-sm btn-icon btn-white text-primary border-0"
            data-bs-toggle="modal"
            data-bs-target="#editModal"
            data-id="{{ $tim->id }}"
            data-nama_kegiatan="{{ $tim->nama_kegiatan }}"
            data-objek_kegiatan="{{ $tim->objek_kegiatan }}"
            data-periode_kegiatan="{{ $tim->periode_kegiatan }}"
            data-kode_tim="{{ $tim->timkerja->id ?? '' }}">
            <i class="bi bi-pencil-square fs-6"></i>
        </button>

        <!-- Delete Button -->
        <button
            class="btn btn-sm btn-icon btn-white text-danger border-0"
            data-bs-toggle="modal"
            data-bs-target="#deleteModal"
            data-url="{{ route('datakegiatan.destroy', $tim->id) }}">
            <i class="bi bi-trash fs-6"></i>
        </button>
    </td>
</tr>
@endforeach