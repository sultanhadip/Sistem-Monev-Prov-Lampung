@foreach($kelolauser as $key => $tim)
<tr>
    <td scope="row">{{ $kelolauser->perPage() * ($kelolauser->currentPage() - 1) + $key + 1}}</td>
    <td>{{ $tim->nama }}</td>
    <td>{{ $tim->username }}</td>
    <td>{{ $tim->role }}</td>
    <td>{{ $tim->satuanKerja->nama_satuan_kerja ?? 'Tidak ada' }}</td> <!-- Correct access to related model -->
    <td>{{ $tim->timKerja->nama_tim ?? 'Tidak ada' }}</td>

    <td>
        <div class="d-flex justify-content-center">
            <button
                class="btn btn-sm btn-icon btn-white text-primary border-0 me-0"
                data-bs-toggle="modal"
                data-bs-target="#editModal"
                data-id="{{ $tim->id }}"
                data-nama="{{ $tim->nama }}"
                data-username="{{ $tim->username }}"
                data-password="{{ $tim->password }}"
                data-role="{{ $tim->role }}"
                data-kode_satuan_kerja="{{ $tim->satuankerja->id ?? '' }}"
                data-kode_tim="{{ $tim->timkerja->id ?? '' }}">
                <i class="bi bi-pencil-square fs-6"></i>
            </button>

            <button
                class="btn btn-sm btn-icon btn-white text-danger border-0"
                data-bs-toggle="modal"
                data-bs-target="#deleteModal"
                data-url="{{ route('kelolauser.destroy', $tim->id) }}">
                <i class="bi bi-trash fs-6"></i>
            </button>

        </div>
    </td>
</tr>
@endforeach