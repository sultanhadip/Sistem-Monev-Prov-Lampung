<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Montify</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link
        href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }}"
        rel="stylesheet" />
    <link
        href="{{ asset('assets/vendor/bootstrap-icons/bootstrap-icons.css') }}"
        rel="stylesheet" />
    <link href="{{ asset('assets/vendor/boxicons/css/boxicons.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/vendor/quill/quill.snow.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/vendor/quill/quill.bubble.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/vendor/remixicon/remixicon.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/vendor/simple-datatables/style.css') }}" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
    <!-- ======= Header ======= -->
    @include('layouts.header')

    <!-- ======= Sidebar ======= -->
    @include('layouts.sidebar')

    @php
    $currentUser = Auth::user();
    $isAdminSatker = $currentUser && $currentUser->role === 'Admin Satuan Kerja';
    $isAdminProvinsi = $currentUser && $currentUser->role === 'Admin Provinsi';
    @endphp

    <main id="main" class="main">
        <div class="pagetitle">
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('kelola-user') }}" style="font-size: 18px;">Kelola User</a></li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h5 class="card-title mb-0">Data Pengguna</h5>
                                <div>
                                    <button class="btn btn-primary d-flex align-items-center mt-3" data-bs-toggle="modal" data-bs-target="#addModal">
                                        <i class="bi bi-plus me-1 text-white"></i> Tambah
                                    </button>
                                </div>
                            </div>

                            <!-- Alert messages -->
                            <div id="alert-container">
                                @if(session('success'))
                                <div class="alert alert-success alert-dismissible fade show" role="alert" style="font-size: 0.9rem;">
                                    {{ session('success') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                @endif

                                @if(session('error'))
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    {{ session('error') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                @endif

                                @if(session('duplicate_errors'))
                                <div class="alert alert-warning alert-dismissible fade show" role="alert" style="white-space: pre-line; line-height: 1; font-size: 0.9rem;">
                                    <strong class="mb-0 d-block" style="margin-bottom: 0;">Username sudah ada</strong>
                                    <span style="display: block; margin-top: 0.1rem;">{!! nl2br(e(session('duplicate_errors'))) !!}</span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                @endif

                                @if($errors->has('username'))
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    Pengguna dengan username tersebut sudah ditambahkan
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                @endif
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                                <!-- Pencarian Pengguna -->
                                <input type="text" class="form-control w-50" id="searchInput" placeholder="Masukkan kata kunci pencarian" value="{{ request('search') }}">

                                <!-- Filter Satuan Kerja -->
                                <select class="form-select w-25 ms-3" id="filterSatuanKerja">
                                    <option value="">Pilih Satuan Kerja</option>
                                    @foreach($satuanKerja as $satuan)
                                    <option value="{{ $satuan->id }}" {{ request('satuan_kerja') == $satuan->id ? 'selected' : '' }}>
                                        {{ $satuan->nama_satuan_kerja }}
                                    </option>
                                    @endforeach
                                </select>

                                <select class="form-select w-25 ms-3" id="filterTimKerja">
                                    <option value="">Pilih Tim Kerja</option>
                                    @foreach($timKerja as $kerja)
                                    <option value="{{ $kerja->id }}" {{ request('tim_kerja') == $kerja->id ? 'selected' : '' }}>
                                        {{ $kerja->nama_tim }}
                                    </option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Table with hoverable rows -->
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered text-center mb-4" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nomor</th>
                                            <th scope="col">Nama</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Satuan Kerja</th>
                                            <th scope="col">Tim Kerja</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @include('kelolauser.table')
                                    </tbody>
                                </table>

                                <!-- Records per page and Pagination -->
                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- Showing Text -->
                                    <div class="me-3">
                                        <span id="showingText">Showing {{ $kelolauser->firstItem() }}-{{ $kelolauser->lastItem() }} of {{ $kelolauser->total() }} records</span>
                                    </div>

                                    <!-- Records Per Page Dropdown and Pagination at the right -->
                                    <div class="d-flex align-items-center ms-auto">
                                        <!-- Records per page -->
                                        <div class="me-3 d-flex align-items-center">
                                            <span class="me-2">Records per page</span>
                                            <select class="form-select w-auto" aria-label="Records per page" id="recordsPerPage" onchange="updatePageSize()">
                                                <option value="10" {{ request('recordsPerPage') == 10 ? 'selected' : '' }}>10</option>
                                                <option value="15" {{ request('recordsPerPage') == 15 ? 'selected' : '' }}>15</option>
                                                <option value="20" {{ request('recordsPerPage') == 20 ? 'selected' : '' }}>20</option>
                                            </select>
                                        </div>

                                        <!-- Pagination -->
                                        <div id="paginationContainer">
                                            @include('kelolauser.pagination', ['kelolauser' => $kelolauser])
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal Tambah Data User dan Import Data -->
                                <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content shadow-lg rounded-1">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="addModalLabel">Tambah Data User</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Tab navigation -->
                                                <ul class="nav nav-pills mb-3" id="addModalTab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <a class="nav-link active" id="manual-tab" data-bs-toggle="pill" href="#manual" role="tab" aria-controls="manual" aria-selected="true">
                                                            Tambah Manual
                                                        </a>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <a class="nav-link" id="excel-tab" data-bs-toggle="pill" href="#excel" role="tab" aria-controls="excel" aria-selected="false">
                                                            Import Excel
                                                        </a>
                                                    </li>
                                                </ul>

                                                <!-- Tab content -->
                                                <div class="tab-content" id="addModalTabContent">
                                                    <!-- Tambah Manual Form -->
                                                    <div class="tab-pane fade show active" id="manual" role="tabpanel" aria-labelledby="manual-tab">
                                                        <form action="{{ route('kelolauser.store') }}" method="POST">
                                                            @csrf
                                                            <div class="mb-4">
                                                                <label for="nama" class="form-label">Nama</label>
                                                                <input type="text" class="form-control" id="nama" name="nama" required>
                                                            </div>
                                                            <div class="mb-4">
                                                                <label for="username" class="form-label">Username</label>
                                                                <input type="text" class="form-control" id="username" name="username" required>
                                                            </div>
                                                            <div class="mb-4">
                                                                <label for="password" class="form-label">Password</label>
                                                                <input type="text" class="form-control" id="password" name="password" required>
                                                            </div>
                                                            <!-- Role -->
                                                            <div class="mb-4">
                                                                <label for="role" class="form-label">Role</label>
                                                                <select class="form-control" name="role" id="roleSelect" {{ $isAdminSatker ? 'disabled' : '' }} required>
                                                                    @if($isAdminSatker || $isAdminProvinsi)
                                                                    <option value="Operator" selected>Operator</option>
                                                                    @else
                                                                    <option value="Kepala BPS" {{ old('role') == 'Kepala BPS' ? 'selected' : '' }}>Kepala BPS</option>
                                                                    <option value="Admin" {{ old('role') == 'Admin' ? 'selected' : '' }}>Admin</option>
                                                                    <option value="Admin Provinsi" {{ old('role') == 'Admin Provinsi' ? 'selected' : '' }}>Admin Provinsi</option>
                                                                    <option value="Operator" {{ old('role') == 'Operator' ? 'selected' : '' }}>Operator</option>
                                                                    @endif
                                                                </select>
                                                                @if($isAdminSatker)
                                                                <input type="hidden" name="role" value="Operator" />
                                                                @endif
                                                            </div>

                                                            <!-- Satuan Kerja -->
                                                            <div class="mb-3">
                                                                <label for="kode_satuan_kerja" class="form-label">Satuan Kerja</label>
                                                                <select class="form-control" name="kode_satuan_kerja" id="satuanKerjaSelect" {{ $isAdminSatker ? 'disabled' : '' }} required>
                                                                    @foreach($satuanKerja as $satuan)
                                                                    <option value="{{ $satuan->id }}"
                                                                        {{ ($isAdminSatker && $satuan->id == $currentUser->kode_satuan_kerja) ? 'selected' : (old('kode_satuan_kerja') == $satuan->id ? 'selected' : '') }}>
                                                                        {{ $satuan->nama_satuan_kerja }}
                                                                    </option>
                                                                    @endforeach
                                                                </select>
                                                                @if($isAdminSatker)
                                                                <input type="hidden" name="kode_satuan_kerja" value="{{ $currentUser->kode_satuan_kerja }}" />
                                                                @endif
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="kode_tim" class="form-label">Tim Kerja</label>
                                                                <select class="form-control" name="kode_tim" id="timKerjaSelect" {{ $isAdminProvinsi ? 'disabled' : '' }} required>
                                                                    @foreach($timKerja as $kerja)
                                                                    <option value="{{ $kerja->id }}"
                                                                        {{ ($isAdminProvinsi && $kerja->id == $currentUser->kode_tim) ? 'selected' : (old('kode_tim') == $kerja->id ? 'selected' : '') }}>
                                                                        {{ $kerja->nama_tim }}
                                                                    </option>
                                                                    @endforeach
                                                                </select>
                                                                @if($isAdminProvinsi)
                                                                <input type="hidden" name="kode_tim" value="{{ $currentUser->kode_tim }}" />
                                                                @endif
                                                            </div>
                                                            <!-- Tombol Simpan dan Cancel -->
                                                            <div class="d-flex justify-content-end mt-3">
                                                                <!-- Button Batal -->
                                                                <button type="button" class="btn text-white me-2" style="background-color: rgb(250, 82, 82);" data-bs-dismiss="modal" aria-label="Close">
                                                                    Batal
                                                                </button>

                                                                <!-- Button Simpan -->
                                                                <button type="submit" class="btn btn-primary text-white">
                                                                    Simpan
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                    <!-- Import Excel Form -->
                                                    <div class="tab-pane fade" id="excel" role="tabpanel" aria-labelledby="excel-tab">
                                                        <form action="{{ route('kelolauser.import') }}" method="POST" enctype="multipart/form-data">
                                                            @csrf
                                                            <!-- Download Format Excel Link -->
                                                            <div class="mt-3">
                                                                <label class="form-label">Download Format Excel</label><br>
                                                                <a href="{{ route('kelolauser.download-format') }}" class="btn btn-link text-primary">
                                                                    Download Format Excel
                                                                </a>
                                                            </div>
                                                            <!-- Upload Excel File -->
                                                            <div class="mt-3">
                                                                <label for="excel_file" class="form-label">Pilih File Excel</label>
                                                                <input type="file" class="form-control" id="excel_file" name="excel_file" accept=".xls,.xlsx" required>
                                                            </div>

                                                            <div class="d-flex justify-content-end mt-3">
                                                                <button type="button" class="btn text-white me-2" style="background-color: rgb(250, 82, 82);" data-bs-dismiss="modal" aria-label="Close">
                                                                    Batal
                                                                </button>
                                                                <button type="submit" class="btn btn-primary text-white">
                                                                    Import
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Modal Tambah Data User dan Import Data -->

                                <!-- Edit Modal -->
                                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content rounded-1">
                                            <form action="{{ route('kelolauser.update', ':id') }}" method="POST">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editModalLabel">Edit Data Pengguna</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- Nama -->
                                                    <div class="mb-4">
                                                        <label for="nama" class="form-label">Nama</label>
                                                        <input type="text" class="form-control" name="nama" id="nama" required>
                                                    </div>
                                                    <!-- Username -->
                                                    <div class="mb-4">
                                                        <label for="username" class="form-label">Username</label>
                                                        <input type="text" class="form-control" name="username" id="username" required>
                                                    </div>
                                                    <!-- Password -->
                                                    <div class="mb-4">
                                                        <label for="password" class="form-label">Password</label>
                                                        <input type="password" class="form-control" name="password" id="password">
                                                    </div>
                                                    <!-- Role -->
                                                    <div class="mb-4">
                                                        <label for="role" class="form-label">Role</label>
                                                        <select class="form-control" name="role" id="role" required>
                                                            <option value="Kepala BPS">Kepala BPS</option>
                                                            <option value="Admin">Admin</option>
                                                            <option value="Admin Provinsi">Admin Provinsi</option>
                                                            <option value="Operator">Operator</option>
                                                        </select>
                                                    </div>
                                                    <!-- Satuan Kerja -->
                                                    <div class="mb-4">
                                                        <label for="kode_satuan_kerja" class="form-label">Satuan Kerja</label>
                                                        <select class="form-control" name="kode_satuan_kerja" id="kode_satuan_kerja" required>
                                                            @foreach($satuanKerja as $satuan)
                                                            <option value="{{ $satuan->id }}">{{ $satuan->nama_satuan_kerja }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <!-- Tim Kerja -->
                                                    <div class="mb-4">
                                                        <label for="kode_tim" class="form-label">Tim Kerja</label>
                                                        <select class="form-control" name="kode_tim" id="kode_tim" required>
                                                            @foreach($timKerja as $kerja)
                                                            <option value="{{ $kerja->id }}">{{ $kerja->nama_tim }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer border-0">
                                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Batal</button>
                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal Konfirmasi Hapus -->
                                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content rounded-1">
                                            <div class="modal-header p-2">
                                                <h5 class="modal-title" id="deleteModalLabel">Konfirmasi Penghapusan</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body p-3">
                                                <p>Apakah Anda yakin ingin menghapus data ini?</p>
                                            </div>
                                            <div class="modal-footer border-0 p-2">
                                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Batal</button>
                                                <form id="deleteForm" method="POST" action="" style="display: inline;">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-primary">Ya</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end modal -->

                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </main>

    @include('layouts.footer')

    <a
        href="#"
        class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <script src="{{ asset('assets/js/kelola-user.js') }}"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <span id="ajax-url" data-url="{{ route('kelolauser.index') }}" style="display: none;"></span>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            var currentPage = 1;

            function applyFilters(page = 1) {
                const search = document.getElementById("searchInput").value;
                const satuanKerja = document.getElementById("filterSatuanKerja").value;
                const timKerja = document.getElementById("filterTimKerja").value;
                const PerPageSelect = document.getElementById("recordsPerPage");
                const perPage = PerPageSelect ? PerPageSelect.value : '{{ request("recordsPerPage",10) }}';

                $.ajax({
                    url: "{{ route('kelola-user') }}",
                    method: 'GET',
                    data: {
                        search: search,
                        filterSatuanKerja: satuanKerja,
                        filterTimKerja: timKerja,
                        recordsPerPage: perPage,
                        page: page
                    },
                    success: function(response) {
                        const tbody = document.querySelector("#dataTable tbody");
                        if (tbody) {
                            tbody.innerHTML = response.table;
                        }
                        document.getElementById("paginationContainer").innerHTML = response.paginationHtml;
                        const showingTextElem = document.getElementById('showingText');
                        if (showingTextElem) {
                            showingTextElem.textContent = response.showingText;
                        }
                        currentPage = page;
                    },
                    error: function(xhr) {
                        console.error('Gagal memuat data:', xhr);
                    }
                });
            }

            let debounceTimeout;
            document.getElementById("searchInput").addEventListener("keyup", function() {
                clearTimeout(debounceTimeout);
                debounceTimeout = setTimeout(() => {
                    applyFilters(1);
                }, 300);
            });

            document.getElementById("filterSatuanKerja").addEventListener("change", function() {
                applyFilters(1);
            });

            document.getElementById("filterTimKerja").addEventListener("change", function() {
                applyFilters(1);
            });

            const perPageSelect = document.getElementById("recordsPerPage");
            if (perPageSelect) {
                perPageSelect.addEventListener("change", function() {
                    applyFilters(1);
                });
            }

            document.getElementById('paginationContainer').addEventListener('click', function(e) {
                if (e.target.classList.contains('page-link')) {
                    e.preventDefault();
                    const page = e.target.getAttribute('data-page');
                    if (page && page != currentPage) {
                        applyFilters(parseInt(page));
                    }
                }
            });

            applyFilters(currentPage);
        });
    </script>

    <script>
        $('#editModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var modal = $(this);

            // Ambil data dari tombol edit dan isi form
            var id = button.data('id');
            var nama = button.data('nama');
            var username = button.data('username');
            var password = button.data('password');
            var role = button.data('role');
            var kode_satuan_kerja = button.data('kode_satuan_kerja');
            var kode_tim = button.data('kode_tim');

            // Set form action URL
            var formAction = '{{ route("kelolauser.update", ":id") }}';
            formAction = formAction.replace(':id', id);
            modal.find('form').attr('action', formAction);

            // Isi field dengan data yang dipilih
            modal.find('#nama').val(nama);
            modal.find('#username').val(username);
            modal.find('#password').val(password);
            modal.find('#role').val(role);
            modal.find('#kode_satuan_kerja').val(kode_satuan_kerja);
            modal.find('#kode_tim').val(kode_tim);
        });
    </script>

    <script>
        $('#editModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var url = button.data('url');
            var modal = $(this);
            modal.find('#editForm').attr('action', url);
        });
    </script>

    <script>
        $('#deleteModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var url = button.data('url');
            var modal = $(this);
            modal.find('#deleteForm').attr('action', url);
        });
    </script>

    <script>
        window.routes = {
            pendingVerifikasi: "{{ route('notifications.pending-verifikasi') }}"
        };
    </script>

    <script>
        setTimeout(() => {
            const alertNode = document.querySelector('#alert-container .alert');
            if (alertNode) {
                let alert = new bootstrap.Alert(alertNode);
                alert.close();
            }
        }, 4000);
    </script>

    <!-- Vendor JS Files -->
    <script src="{{ asset('assets/vendor/apexcharts/apexcharts.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/chart.js/chart.umd.js') }}"></script>
    <script src="{{ asset('assets/vendor/echarts/echarts.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/quill/quill.js') }}"></script>
    <script src="{{ asset('assets/vendor/simple-datatables/simple-datatables.js') }}"></script>
    <script src="{{ asset('assets/vendor/tinymce/tinymce.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/php-email-form/validate.js') }}"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <script src="{{ asset('assets/js/notification.js') }}"></script>
</body>

</html>