-- 1. Total Penjualan per Cabang + Kota
SELECT 
    mc.nama_cabang,
    mk.nama_kota,
    SUM(tp.jumlah_pembelian) AS total_penjualan,
    ROUND(
        100.0 * SUM(tp.jumlah_pembelian) / SUM(SUM(tp.jumlah_pembelian)) OVER(), 
        2
    ) AS persentase_penjualan
FROM tr_penjualan tp
JOIN ms_cabang mc ON tp.kode_cabang = mc.kode_cabang
JOIN ms_kota mk ON mc.kode_kota = mk.kode_kota
GROUP BY mc.nama_cabang, mk.nama_kota
ORDER BY total_penjualan DESC;

-- 2. Top 10 Produk Terlaris + Kategori
SELECT 
    mp.nama_produk,
    mkat.nama_kategori,
    SUM(tp.jumlah_pembelian) AS total_terjual
FROM tr_penjualan tp
JOIN ms_produk mp ON tp.kode_produk = mp.kode_produk
JOIN ms_kategori mkat ON mp.kode_kategori = mkat.kode_kategori
GROUP BY mp.nama_produk, mkat.nama_kategori
ORDER BY total_terjual DESC
LIMIT 10;

-- 3. Revenue per Cabang (Harga Berlaku)
WITH penjualan_agg AS (
    SELECT 
        tp.kode_produk,
        tp.kode_cabang,
        tp.tgl_transaksi,
        SUM(tp.jumlah_pembelian) AS total_item
    FROM tr_penjualan tp
    GROUP BY tp.kode_produk, tp.kode_cabang, tp.tgl_transaksi
)
SELECT 
    mc.nama_cabang,
    SUM(p.total_item * mh.harga_berlaku_cabang) AS total_revenue
FROM penjualan_agg p
JOIN ms_harga_harian mh 
    ON p.kode_produk = mh.kode_produk 
   AND p.kode_cabang = mh.kode_cabang
   AND p.tgl_transaksi = mh.tgl_berlaku   -- penting: match harga di tanggal transaksi
JOIN ms_cabang mc ON p.kode_cabang = mc.kode_cabang
GROUP BY mc.nama_cabang
ORDER BY total_revenue DESC;

-- 4. Margin Laba per Produk
WITH penjualan_agg AS (
    SELECT 
        tp.kode_produk,
        tp.kode_cabang,
        tp.tgl_transaksi,
        SUM(tp.jumlah_pembelian) AS total_item
    FROM tr_penjualan tp
    GROUP BY tp.kode_produk, tp.kode_cabang, tp.tgl_transaksi
)
SELECT 
    mp.nama_produk,
    SUM(p.total_item * 
        (mh.harga_berlaku_cabang - mh.modal_cabang - mh.biaya_cabang)
    ) AS total_laba
FROM penjualan_agg p
JOIN ms_harga_harian mh 
    ON p.kode_produk = mh.kode_produk 
   AND p.kode_cabang = mh.kode_cabang
   AND p.tgl_transaksi = mh.tgl_berlaku   -- harga sesuai hari transaksi
JOIN ms_produk mp ON p.kode_produk = mp.kode_produk
GROUP BY mp.nama_produk
ORDER BY total_laba DESC
LIMIT 10;

-- 5. Performa Kasir
SELECT 
    mk.nama_depan, mk.nama_belakang,
    mc.nama_cabang,
    COUNT(DISTINCT tp.kode_transaksi) AS jumlah_transaksi,
    SUM(tp.jumlah_pembelian) AS total_item
FROM tr_penjualan tp
JOIN ms_karyawan mk ON tp.kode_kasir = mk.kode_karyawan
JOIN ms_cabang mc ON mk.kode_cabang = mc.kode_cabang
GROUP BY mk.nama_depan, mk.nama_belakang, mc.nama_cabang
ORDER BY jumlah_transaksi DESC;

-- 6. Penjualan per Provinsi
SELECT 
    mp.nama_propinsi,
    SUM(tp.jumlah_pembelian) AS total_penjualan
FROM tr_penjualan tp
JOIN ms_cabang mc ON tp.kode_cabang = mc.kode_cabang
JOIN ms_kota mk ON mc.kode_kota = mk.kode_kota
JOIN ms_propinsi mp ON mk.kode_propinsi = mp.kode_propinsi
GROUP BY mp.nama_propinsi
ORDER BY total_penjualan DESC;
