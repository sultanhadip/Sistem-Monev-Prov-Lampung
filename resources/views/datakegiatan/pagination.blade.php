<nav>
    <ul class="pagination m-0">
        {{-- Previous --}}
        @if($datakegiatan->onFirstPage())
        <li class="page-item disabled"><span class="page-link">Prev</span></li>
        @else
        <li class="page-item">
            <a class="page-link" href="#" data-page="{{ $datakegiatan->currentPage() - 1 }}">Prev</a>
        </li>
        @endif

        {{-- Numbered links --}}
        @foreach($datakegiatan->getUrlRange(1, $datakegiatan->lastPage()) as $page => $url)
        <li class="page-item {{ $datakegiatan->currentPage()==$page ? 'active':'' }}">
            <a class="page-link" href="#" data-page="{{ $page }}">{{ $page }}</a>
        </li>
        @endforeach

        {{-- Next --}}
        @if($datakegiatan->hasMorePages())
        <li class="page-item">
            <a class="page-link" href="#" data-page="{{ $datakegiatan->currentPage() + 1 }}">Next</a>
        </li>
        @else
        <li class="page-item disabled"><span class="page-link">Next</span></li>
        @endif
    </ul>
</nav>