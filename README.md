# TUGAS INDIVIDU FLUTTER
**Nama:** M Naufal Zhafran Rabiul Batara  
**NPM:** 2406361694  
**Kelas:** F  

---

<details>
<summary>Tugas 7: Elemen Dasar Flutter</summary>
<details>
<summary>1. Jelaskan apa itu <i>widget tree</i> pada Flutter dan bagaimana hubungan parent–child (induk–anak) bekerja antar widget.</summary>

Widget tree itu struktur hierarki yang menggambarkan bagaimana widget saling bersarang satu sama lain. Setiap widget bisa punya anak (child), dan semuanya disusun dari atas ke bawah mulai dari root (biasanya `MaterialApp`).  
Hubungan parent–child berarti widget induk mengatur tampilan dan posisi widget anak. Misalnya `Scaffold` adalah parent, dan di dalamnya ada child seperti `AppBar`, `Body`, `FloatingActionButton`, dsb.  
Jadi, setiap elemen di layar sebenarnya adalah bagian dari satu pohon besar yang saling terhubung lewat parent dan child.

</details>

<details>
<summary>2. Sebutkan semua <i>widget</i> yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.</summary>

Widget yang saya gunakan:
- **MaterialApp** → jadi root aplikasi, ngatur tema dan navigasi.  
- **Scaffold** → struktur dasar tampilan (appbar, body, dsb).  
- **AppBar** → menampilkan judul di bagian atas aplikasi.  
- **Text** → menampilkan teks di layar.  
- **Icon** → menampilkan ikon bawaan Flutter.  
- **Column** dan **Row** → untuk menyusun widget secara vertikal atau horizontal.  
- **Container** → membungkus widget lain biar bisa diatur padding, margin, warna, dll.  
- **Padding** dan **Center** → ngatur posisi dan spasi widget biar rapi.  
- **GridView** → buat menampilkan item dalam bentuk grid.  

</details>

<details>
<summary>3. Apa fungsi dari widget <code>MaterialApp</code>? Jelaskan mengapa widget ini sering digunakan sebagai widget root.</summary>

`MaterialApp` berfungsi sebagai pembungkus utama yang menyediakan struktur dasar aplikasi berbasis Material Design (tema, warna, navigasi, dsb).  
Widget ini sering jadi root karena dia yang ngatur keseluruhan tampilan aplikasi, termasuk route ke halaman lain, title, theme, dan debug banner.  
Tanpa `MaterialApp`, fitur-fitur seperti `Scaffold` dan `AppBar` nggak akan berfungsi maksimal.

</details>

<details>
<summary>4. Jelaskan perbedaan antara <code>StatelessWidget</code> dan <code>StatefulWidget</code>. Kapan kamu memilih salah satunya?</summary>

`StatelessWidget` digunakan kalau isi tampilan nggak berubah selama aplikasi berjalan (misalnya teks statis atau icon).  
`StatefulWidget` digunakan kalau tampilan bisa berubah karena interaksi pengguna (seperti tombol klik, input form, atau data dari API).  
Saya pakai `StatelessWidget` untuk tampilan yang tetap, dan `StatefulWidget` kalau butuh update tampilan saat ada event atau state baru.

</details>

<details>
<summary>5. Apa itu <code>BuildContext</code> dan mengapa penting di Flutter? Bagaimana penggunaannya di metode <code>build</code>?</summary>

`BuildContext` adalah objek yang nyimpen posisi widget di dalam widget tree.  
Dia penting karena dipakai buat ngakses informasi tentang lokasi widget, misalnya untuk ambil tema, navigasi ke halaman lain, atau komunikasi antar widget.  
Di dalam metode `build`, kita pakai `context` buat nentuin gaya, warna, atau ambil parent widget-nya.

</details>

<details>
<summary>6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".</summary>

**Hot reload** memperbarui kode aplikasi tanpa menghapus state yang sedang berjalan, jadi perubahan UI bisa langsung dilihat tanpa reset data.  
**Hot restart** ngulang ulang aplikasi dari awal dan menghapus seluruh state.  
Biasanya saya pakai hot reload buat debugging cepat tampilan, dan hot restart kalau perubahan besar seperti struktur widget atau inisialisasi ulang variable global.

</details>



</details>

<details>
