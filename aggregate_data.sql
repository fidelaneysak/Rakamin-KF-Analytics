-- Membuat tabel baru untuk analisis transaksi
CREATE OR REPLACE TABLE rakamin-kf-analytics-449502.kimia_farma.analisa_transaksi AS
SELECT 
  -- Mengambil informasi transaksi dari tabel transaksi
  ft.transaction_id,
  ft.date,
  
  -- Mengambil informasi cabang dari tabel transaksi dan kantor cabang
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  
  -- Mengambil informasi customer dan produk dari tabel transaksi dan produk
  ft.customer_name,
  ft.product_id,
  p.product_name,
  
  -- Menghitung harga asli produk
  ft.price AS actual_price,
  
  -- Mengambil persentase diskon dari tabel transaksi
  ft.discount_percentage,
  
  -- Menghitung persentase laba kotor berdasarkan harga produk
  CASE
    WHEN ft.price <= 50000 THEN 0.1
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.2
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    ELSE 0.3
  END AS persentase_gross_laba,

  -- Menghitung penjualan bersih setelah diskon
  (ft.price - (ft.discount_percentage * ft.price)) AS nett_sales,

  -- Menghitung keuntungan bersih setelah diskon
  (ft.price - (ft.discount_percentage * ft.price)) *
  CASE
    WHEN ft.price <= 50000 THEN 0.1
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.2
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    ELSE 0.3
  END AS nett_profit,

  -- Mengambil rating transaksi dari tabel transaksi
  ft.rating AS rating_transaksi
FROM `rakamin-kf-analytics-449502.kimia_farma.kf_final_transaction` ft -- Sumber data transaksi
JOIN `rakamin-kf-analytics-449502.kimia_farma.kf_kantor_cabang` kc -- Menggabungkan dengan tabel kantor cabang
  ON ft.branch_id = kc.branch_id -- Menggunakan ID cabang untuk menyocokkan data
JOIN `rakamin-kf-analytics-449502.kimia_farma.kf_product` p -- Menggabungkan dengan tabel produk
  ON ft.product_id = p.product_id -- Menyocokkan ID produk
  AND ft.price = p.price; -- Menyocokkan harga produk
