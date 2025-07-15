@foreach($satuankerja as $key => $tim)
<tr>
    <td scope="row">{{ $satuankerja->perPage() * ($satuankerja->currentPage() - 1) + $key + 1 }}</td>
    <td>{{ $tim->nama_satuan_kerja }}</td>
    <td>{{ $tim->kode_satuan_kerja }}</td>
    <td>
        <!-- Edit Button -->
        <button
            class="btn btn-sm btn-icon btn-white text-primary border-0"
            data-bs-toggle="modal"
            data-bs-target="#editModal"
            data-id="{{ $tim->id }}"
            data-kode_satuan_kerja="{{ $tim->kode_satuan_kerja }}"
            data-nama_satuan_kerja="{{ $tim->nama_satuan_kerja }}">
            <i class="bi bi-pencil-square fs-6"></i>
        </button>

        <!-- Delete Button -->
        <button
            class="btn btn-sm btn-icon btn-white text-danger border-0"
            data-bs-toggle="modal"
            data-bs-target="#deleteModal"
            data-url="{{ route('satuankerja.destroy', $tim->id) }}">
            <i class="bi bi-trash fs-6"></i>
        </button>

    </td>
</tr>

@endforeach