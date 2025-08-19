# Minimart-SQL-Analysis
Source : Tetris 3 (DQLab 2023)
N/B : File .sql utk database ada di dalam .zip dikarenakan sizenya melebihi 25mb.

## 📌 Deskripsi

Proyek ini berisi eksplorasi database Minimart menggunakan SQL untuk menjawab pertanyaan bisnis seputar penjualan, produk, cabang, kasir, dan wilayah.
Database terdiri dari tabel transaksi (tr_penjualan) serta tabel referensi seperti produk, cabang, kota, provinsi, kategori, harga harian, dan karyawan.

Tujuan:

Melatih keterampilan SQL Querying

Menunjukkan kemampuan dalam data analysis berbasis SQL

Mendapatkan insight bisnis dari data transaksi minimarket

## 📂 Struktur Database

1. tr_penjualan → data transaksi penjualan

2. ms_cabang → informasi cabang

3. ms_kota & ms_propinsi → data lokasi

4. ms_produk & ms_kategori → informasi produk

5. ms_harga_harian → harga, modal, dan biaya per cabang

6. ms_karyawan → data karyawan/kasir

## 🔍 Pertanyaan Bisnis yang Dijawab

1. Cabang mana yang paling banyak penjualannya?

2. Produk dan kategori apa yang paling laku?

3. Revenue dan margin laba tiap cabang/produk?

4. Kasir mana yang paling aktif?

5. Wilayah (kota/propinsi) mana yang paling tinggi penjualannya?

## 📈 Insight Sementara

1. Cabang dengan penjualan terbesar adalah PHI Mini Market - Surabaya 01 di kota Surabaya, dengan total penjualan mencapai **1.538.807 unit (33,44% dari total nasional)**. Namun, hasil analisis juga menunjukkan bahwa dua cabang lainnya memiliki kontribusi yang hampir sama besar, yaitu masing-masing **33,28%**, sehingga **distribusi penjualan di ketiga cabang relatif merata**.

2. Kategori **Makanan & Minuman** menjadi yang paling laku. Produk terlaris adalah **Jus Kesehatan 600 ml**, terjual sebanyak **115.061 unit**.

3. Revenue tertinggi berasal dari cabang **PHI Mini Market - Surabaya 01**, mencapai **Rp 21.866.860.670**. Margin laba tertinggi berasal dari produk Mie **Instant 1 kotak (40 bungkus)** dengan estimasi laba **Rp 430.675.570**.

4. **Natali Menawan (kasir di cabang PHI Mini Market - Surabaya 01)** mencatat jumlah transaksi terbanyak, yaitu **29.240 transaksi** dalam periode analisis.

5. **Provinsi Jawa Timur** menjadi kontributor utama dalam penjualan, dengan total penjualan lebih tinggi dibanding provinsi lain.
