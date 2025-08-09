<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">

        <!-- Dashboard -->
        <li class="nav-item">
            <a class="nav-link {{ Request::routeIs('dashboard') ? 'active' : 'collapsed' }}" href="{{ route('dashboard') }}">
                <i class="bi bi-bar-chart-line"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <!-- Beranda -->
        <!-- <li class="nav-item">
            <a class="nav-link {{ Request::routeIs('index') ? 'active' : 'collapsed' }}" href="{{ route('index') }}">
                <i class="bi bi-house-door"></i>
                <span>Beranda</span>
            </a>
        </li> -->

        <!-- Master Data (Submenu) -->
        <li class="nav-item">
            @canany(['isAdmin', 'isAdminProv']) <!-- Hanya bisa diakses oleh isAdmin atau isAdminProv -->
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#components-nav">
                <i class="bi bi-database"></i><span>Master Data</span>
                <i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse {{ Request::routeIs('tim-kerja') || Request::routeIs('satuan-kerja') || Request::routeIs('data-kegiatan') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">

                @can('isAdmin') <!-- Admin has access to all -->
                <li>
                    <a class="nav-link {{ Request::routeIs('tim-kerja') ? 'active' : 'collapsed' }}" href="{{ route('tim-kerja') }}">
                        <i class="bi bi-person-lines-fill fs-6"></i><span class="ps-6">Tim Kerja</span>
                    </a>
                </li>
                <li>
                    <a class="nav-link {{ Request::routeIs('satuan-kerja') ? 'active' : 'collapsed' }}" href="{{ route('satuan-kerja') }}">
                        <i class="bi bi-building fs-6"></i><span>Satuan Kerja</span>
                    </a>
                </li>
                @endcan

                @canany(['isAdmin', 'isAdminProv']) <!-- AdminProv only has access to Kegiatan Survei -->
                <li>
                    <a class="nav-link {{ Request::routeIs('data-kegiatan') ? 'active' : 'collapsed' }}" href="{{ route('data-kegiatan') }}">
                        <i class="bi bi-file-earmark-bar-graph fs-6"></i><span>Kegiatan</span>
                    </a>
                </li>
                @endcanany
            </ul>
            @endcanany
        </li>

        <!-- Monitoring -->
        <li class="nav-item">
            <a class="nav-link {{ Request::routeIs('monitoring-kegiatan', 'detail-monitoring-kegiatan') ? 'active' : 'collapsed' }}" href="{{ route('monitoring-kegiatan') }}">
                <i class="bi bi-graph-up"></i>
                <span>Monitoring</span>
            </a>
        </li>

        <!-- Penilaian -->
        <li class="nav-item">
            <a class="nav-link {{ Request::routeIs('penilaian') ? 'active' : 'collapsed' }}" href="{{ route('penilaian') }}">
                <i class="bi bi-clipboard-check"></i>
                <span>Penilaian</span>
            </a>
        </li>

        <li class="nav-item">
            @canany(['isAdmin']) <!-- Hanya bisa diakses oleh isAdmin -->
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#sertifikat-nav">
                <i class="bi bi-archive"></i><span>Sertifikat</span>
                <i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="sertifikat-nav" class="nav-content collapse {{ Request::routeIs('edit-sertifikat.edit') || Request::routeIs('sertifikat') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">

                @can('isAdmin')
                <li class="nav-item">
                    <a class="nav-link {{ Request::routeIs('edit-sertifikat.edit') ? 'active' : 'collapsed' }}" href="{{ route('edit-sertifikat.edit') }}">
                        <i class="bi bi-file-earmark-text fs-6"></i>
                        <span>Template</span>
                    </a>
                </li>
                @endcan

                @can('isAdmin')
                <li class="nav-item">
                    <a class="nav-link {{ Request::routeIs('sertifikat') ? 'active' : 'collapsed' }}" href="{{ route('sertifikat') }}">
                        <i class="bi bi-award fs-6"></i>
                        <span>Data Sertifikat</span>
                    </a>
                </li>
                @endcan
            </ul>
            @endcanany
        </li>


        <!-- Kelola User -->
        @canany(['isAdmin', 'isAdminProv', 'isAdminSatker'])
        <li>
            <a class="nav-link {{ Request::routeIs('kelola-user') ? 'active' : 'collapsed' }}" href="{{ route('kelola-user') }}">
                <i class="bi bi-person-circle fs-6"></i><span class="ps-6">Kelola Pengguna</span>
            </a>
        </li>
        @endcanany
    </ul>
</aside>