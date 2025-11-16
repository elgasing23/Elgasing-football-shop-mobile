# TUGAS INDIVIDU FLUTTER
**Nama:** M Naufal Zhafran Rabiul Batara  
**NPM:** 2406361694  
**Kelas:** F  

---

<details>
<summary>Tugas 7: Elemen Dasar Flutter</summary>
<details>
<summary>1. Jelaskan apa itu <i>widget tree</i> pada Flutter dan bagaimana hubungan parent–child (induk–anak) bekerja antar widget.</summary>

Widget tree itu struktur hierarki yang menggambarkan bagaimana widget saling bersarang satu sama lain. Setiap widget bisa punya anak (child), dan semuanya disusun dari atas ke bawah mulai dari root (biasanya `MaterialApp`). Hubungan parent–child berarti widget induk mengatur tampilan dan posisi widget anak. Misalnya `Scaffold` adalah parent, dan di dalamnya ada child seperti `AppBar`, `Body`, `FloatingActionButton`, dsb. Jadi, setiap elemen di layar sebenarnya adalah bagian dari satu pohon besar yang saling terhubung lewat parent dan child.

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

`MaterialApp` berfungsi sebagai pembungkus utama yang menyediakan struktur dasar aplikasi berbasis Material Design (tema, warna, navigasi, dsb). Widget ini sering jadi root karena dia yang ngatur keseluruhan tampilan aplikasi, termasuk route ke halaman lain, title, theme, dan debug banner. Tanpa `MaterialApp`, fitur-fitur seperti `Scaffold` dan `AppBar` nggak akan berfungsi maksimal.

</details>

<details>
<summary>4. Jelaskan perbedaan antara <code>StatelessWidget</code> dan <code>StatefulWidget</code>. Kapan kamu memilih salah satunya?</summary>

`StatelessWidget` digunakan kalau isi tampilan nggak berubah selama aplikasi berjalan (misalnya teks statis atau icon). `StatefulWidget` digunakan kalau tampilan bisa berubah karena interaksi pengguna (seperti tombol klik, input form, atau data dari API). Saya pakai `StatelessWidget` untuk tampilan yang tetap, dan `StatefulWidget` kalau butuh update tampilan saat ada event atau state baru.

</details>

<details>
<summary>5. Apa itu <code>BuildContext</code> dan mengapa penting di Flutter? Bagaimana penggunaannya di metode <code>build</code>?</summary>

`BuildContext` adalah objek yang nyimpen posisi widget di dalam widget tree. Dia penting karena dipakai buat ngakses informasi tentang lokasi widget, misalnya untuk ambil tema, navigasi ke halaman lain, atau komunikasi antar widget. Di dalam metode `build`, kita pakai `context` buat nentuin gaya, warna, atau ambil parent widget-nya.

</details>

<details>
<summary>6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".</summary>

**Hot reload** memperbarui kode aplikasi tanpa menghapus state yang sedang berjalan, jadi perubahan UI bisa langsung dilihat tanpa reset data. **Hot restart** ngulang ulang aplikasi dari awal dan menghapus seluruh state. Biasanya saya pakai hot reload buat debugging cepat tampilan, dan hot restart kalau perubahan besar seperti struktur widget atau inisialisasi ulang variable global.

</details>

</details>

<details>
<summary>Tugas 8: Navigasi, Form, dan Layout</summary>

<details>
<summary>1. Jelaskan perbedaan antara <code>Navigator.push()</code> dan <code>Navigator.pushReplacement()</code> pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?</summary>

`Navigator.push()` digunakan untuk menambahkan halaman baru ke atas stack navigasi tanpa menghapus halaman sebelumnya. Biasanya digunakan ketika pengguna masih bisa kembali ke halaman sebelumnya menggunakan tombol back.  
Sedangkan `Navigator.pushReplacement()` mengganti halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari stack.  
Dalam konteks aplikasi Football Shop, `Navigator.push()` sebaiknya digunakan ketika pengguna ingin membuka halaman form atau detail produk agar bisa kembali ke halaman utama. Sementara `Navigator.pushReplacement()` cocok untuk kasus seperti login dan logout, agar pengguna tidak bisa kembali ke halaman sebelumnya setelah berpindah.

</details>

<details>
<summary>2. Bagaimana kamu memanfaatkan <i>hierarchy widget</i> seperti <code>Scaffold</code>, <code>AppBar</code>, dan <code>Drawer</code> untuk membangun struktur halaman yang konsisten di seluruh aplikasi?</summary>

Saya menggunakan `Scaffold` sebagai struktur utama di setiap halaman karena menyediakan layout dasar seperti `AppBar`, `body`, dan `Drawer`.  
`AppBar` saya gunakan untuk menampilkan judul dan identitas halaman, sedangkan `Drawer` saya gunakan untuk navigasi antar halaman agar pengguna bisa berpindah dengan mudah tanpa tombol tambahan di layar. Dengan cara ini, seluruh halaman dalam aplikasi memiliki tampilan yang konsisten dan mudah digunakan.

</details>

<details>
<summary>3. Dalam konteks desain antarmuka, apa kelebihan menggunakan <i>layout widget</i> seperti <code>Padding</code>, <code>SingleChildScrollView</code>, dan <code>ListView</code> saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.</summary>

Widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` membantu menjaga tampilan form tetap rapi dan mudah diakses di berbagai ukuran layar.  
- `Padding` memberi jarak antar elemen agar tampilan form tidak terlalu rapat dan nyaman dilihat.  
- `SingleChildScrollView` mencegah overflow dengan membuat konten form bisa di-scroll jika terlalu panjang.  
- `ListView` berguna jika elemen form banyak dan bersifat dinamis.  

Di aplikasi Football Shop, saya menggunakan `SingleChildScrollView` agar form tambah produk tetap bisa digulir di layar kecil dan menambahkan `Padding` di setiap input field agar lebih rapi.

</details>

<details>
<summary>4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?</summary>

Saya menggunakan `ThemeData` di `MaterialApp` dengan `ColorScheme.fromSeed(seedColor: Colors.indigo)` agar seluruh komponen aplikasi seperti `AppBar`, tombol, dan elemen interaktif memiliki nuansa warna yang sama.  
Dengan cara ini, warna utama Football Shop konsisten di semua halaman dan mendukung identitas visual brand yang profesional dan mudah dikenali pengguna.

</details>

</details>


<details> <summary>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</summary> <details> <summary>1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan <code>Map&lt;String, dynamic&gt;</code> tanpa model?</summary>

Membuat model Dart itu penting supaya data yang diterima dari Django punya struktur yang konsisten dan tipe yang jelas. Dengan model, parsing JSON jadi lebih aman karena setiap field tervalidasi dan ada jaminan null-safety. Selain itu, maintainability juga jauh lebih baik karena kode lebih rapi dan mudah diperbarui ketika backend berubah.
Kalau langsung pakai Map<String, dynamic> tanpa model, aplikasi rawan error runtime, misalnya salah tipe, field tidak ditemukan, atau typo. Kode juga jadi berantakan dan sulit dirawat, terutama saat jumlah data makin banyak atau struktur JSON berubah.

</details> <details> <summary>2. Apa fungsi package <code>http</code> dan <code>CookieRequest</code> dalam tugas ini? Jelaskan perbedaan peran <code>http</code> vs <code>CookieRequest</code>.</summary>

Package http berfungsi sebagai library dasar untuk melakukan request GET dan POST biasa tanpa menyimpan informasi autentikasi. Cocok untuk endpoint yang tidak membutuhkan session atau login.
Sedangkan CookieRequest adalah request handler khusus yang menyimpan cookie session Django otomatis. Semua request yang membutuhkan autentikasi seperti login, logout, dan akses endpoint yang butuh sesi wajib memakai CookieRequest.
Perbedaannya: http tidak menyimpan session, sementara CookieRequest memelihara session dan mengirim cookie secara otomatis pada setiap request.

</details> <details> <summary>3. Jelaskan mengapa instance <code>CookieRequest</code> perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</summary>

Instance CookieRequest menyimpan cookie session Django, jadi semua halaman harus memakai instance yang sama agar status login tidak hilang. Jika setiap halaman membuat instance baru, session akan ter-reset dan Django menganggap pengguna sudah logout. Dengan membagikan instance melalui Provider, seluruh halaman bisa mengakses session yang sama secara konsisten tanpa perlu login ulang setiap kali navigasi.

</details> <details> <summary>4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada <code>ALLOWED_HOSTS</code>, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?</summary>

Flutter (khususnya emulator Android) terhubung ke server Django melalui 10.0.2.2, jadi alamat ini wajib ditambahkan pada ALLOWED_HOSTS agar Django mengizinkan request tersebut. CORS juga perlu diaktifkan supaya Django menerima request dari aplikasi Flutter yang berjalan sebagai aplikasi terpisah.
Pengaturan cookie seperti SameSite dan CSRF harus diperbarui agar session dapat dikirim dan diterima dengan benar oleh Flutter. Di sisi Android, permission internet wajib ada agar aplikasi bisa mengakses jaringan.
Jika salah satu konfigurasi salah, maka request bisa ditolak, cookie tidak tersimpan, session hilang, atau Flutter gagal berkomunikasi dengan Django sama sekali.

</details> <details> <summary>5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.</summary>

Pengguna mengisi data pada form Flutter, lalu data tersebut dikumpulkan dari controller dan dikirim ke Django melalui CookieRequest.post(). Django menerima data, memvalidasi, menyimpannya ke database, lalu mengembalikan JSON sebagai respons. Flutter kemudian mem-parsing respons tersebut ke dalam model Dart dan menampilkan data terbaru di UI.
Proses ini memastikan data selalu tersimpan di server dan tetap sinkron dengan tampilan aplikasi.

</details> <details> <summary>6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</summary>

Saat login, Flutter mengirim username dan password ke Django melalui CookieRequest.login(). Django memverifikasi data, lalu membuat session dan mengembalikan cookie yang otomatis disimpan oleh CookieRequest. Setelah itu, halaman Flutter bisa mengakses endpoint yang membutuhkan autentikasi.
Register dilakukan dengan mengirim data akun baru ke endpoint Django, dan setelah akun berhasil dibuat, pengguna tetap harus login.
Logout menghapus session di Django dan membersihkan cookie pada Flutter sehingga pengguna keluar sepenuhnya dari aplikasi.

</details> <details> <summary>7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya mengikuti tutorial).</summary>

Pertama, saya membuat semua endpoint Django termasuk login, register, logout, dan endpoint JSON untuk data produk. Setelah itu saya mengaktifkan CORS, menambahkan 10.0.2.2 ke ALLOWED_HOSTS, dan mengatur cookie supaya bisa dibaca Flutter.
Di sisi Flutter, saya membuat model Dart untuk memetakan JSON secara aman. Lalu saya menambahkan Provider agar instance CookieRequest bisa digunakan oleh seluruh widget. Saya membuat halaman login, register, dan halaman daftar produk yang mengambil data dari Django.
Saya juga membuat form tambah produk yang mengirim data ke Django melalui POST. Setelah semuanya selesai, saya melakukan testing manual alur login, tambah produk, membaca data dari Django, hingga logout untuk memastikan konektivitas berjalan lancar.

</details> </details>
