$(document).ready(function () {
    // Menangani form submit untuk menambahkan data tim kerja
    $("#addModal form").on("submit", function (e) {
        e.preventDefault();

        // Ambil data dari form
        var formData = $(this).serialize();

        // Mengirim data dengan AJAX
        $.ajax({
            url: "{{ route('timkerja.store') }}",
            method: "POST",
            data: formData,
            success: function (response) {
                // Menutup modal setelah data berhasil ditambahkan
                $("#addModal").modal("hide");

                // Tampilkan pesan sukses
                alert(response.message);

                // Tambahkan data tim kerja ke tabel tanpa reload halaman
                var newRow =
                    "</td><td>" +
                    response.data.nama_tim +
                    '</td><td><button class="btn btn-warning">Edit</button></td></tr>';
                $("table tbody").append(newRow);
            },
            error: function (response) {
                // Tampilkan pesan error jika ada masalah
                alert("Terjadi kesalahan. Silakan coba lagi.");
            },
        });
    });
});
