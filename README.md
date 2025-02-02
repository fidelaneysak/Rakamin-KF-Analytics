# Big Data Analytics Intern - Kimia Farma Project

Repository ini berisi query SQL untuk menganalisis transaksi dan kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023 menggunakan BigQuery. Proyek ini menggabungkan data dari beberapa tabel untuk menganalisis berbagai metrik terkait transaksi, cabang, dan produk.

## 🔍 Deskripsi Proyek
Proyek ini menggunakan dataset yang mencakup data transaksi, cabang, dan produk dari Kimia Farma. Tujuan analisis ini adalah untuk menghitung laba bersih dan menganalisis penilaian cabang dan transaksi berdasarkan harga dan diskon produk. Sebagai bagian dari proyek ini, dataset berikut telah diimpor ke dalam BigQuery untuk dianalisis:

1. **kf_final_transaction.csv** - Data transaksi final.
2. **kf_inventory.csv** - Data inventaris produk.
3. **kf_kantor_cabang.csv** - Data cabang Kimia Farma.
4. **kf_product.csv** - Data produk obat.

Tabel-tabel tersebut telah diimpor ke BigQuery dengan nama tabel yang sesuai tanpa ekstensi `.csv`.

## 📊 Tabel Analisa
Query ini menggabungkan data dari tabel transaksi (`kf_final_transaction`), cabang (`kf_kantor_cabang`), dan produk (`kf_product`). Hasilnya adalah tabel `analisa_transaksi` yang mencakup informasi berikut:

- **transaction_id** : Kode ID transaksi.
- **date** : Tanggal transaksi.
- **branch_id** : Kode ID cabang Kimia Farma.
- **branch_name** : Nama cabang Kimia Farma.
- **kota** : Kota cabang.
- **provinsi** : Provinsi cabang.
- **rating_cabang** : Penilaian konsumen terhadap cabang.
- **customer_name** : Nama customer yang melakukan transaksi.
- **product_id** : Kode produk obat.
- **product_name** : Nama obat.
- **actual_price** : Harga obat.
- **discount_percentage** : Persentase diskon pada obat.
- **persentase_gross_laba** : Persentase laba yang diperoleh berdasarkan harga obat.
- **nett_sales** : Harga setelah diskon.
- **nett_profit** : Keuntungan yang diperoleh Kimia Farma.
- **rating_transaksi** : Penilaian konsumen terhadap transaksi.

## 🛠 Teknologi yang Digunakan
- Google BigQuery
- SQL
