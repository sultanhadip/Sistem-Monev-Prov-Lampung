@foreach($timkerja as $key => $tim)
<tr>
    <td>{{ $timkerja->perPage() * ($timkerja->currentPage() - 1) + $key + 1 }}</td>
    <td>{{ $tim->nama_tim }}</td>
    <td>
        <!-- Edit Button -->
        <button
            class="btn btn-sm btn-icon btn-white text-primary border-0"
            data-bs-toggle="modal"
            data-bs-target="#editModal"
            data-id="{{ $tim->id }}"
            data-nama_tim="{{ $tim->nama_tim }}">
            <i class="bi bi-pencil-square fs-6"></i>
        </button>

        <!-- Delete Button -->
        <button
            class="btn btn-sm btn-icon btn-white text-danger border-0"
            data-bs-toggle="modal"
            data-bs-target="#deleteModal"
            data-url="{{ route('timkerja.destroy', $tim->id) }}">
            <i class="bi bi-trash fs-6"></i>
        </button>

    </td>
</tr>

@endforeach