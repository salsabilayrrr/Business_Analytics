# Business_Analytics
Business Analytics Internship project - Customer Churn Prediction (EDA, SQL, Machine Learning)

# Business Analytics Internship — Codveda Technology

Repositori ini berisi 3 proyek yang diselesaikan selama program **Business Analytics Internship** di [Codveda Technology](https://www.codveda.com), menggunakan studi kasus **Customer Churn Prediction** pada dataset Telco (BigML).

---

## 📋 Daftar Isi

- [Tentang Proyek](#tentang-proyek)
- [Dataset](#dataset)
- [Task 1: Exploratory Data Analysis](#task-1-exploratory-data-analysis-level-1)
- [Task 2: SQL for Business Analytics](#task-2-sql-for-business-analytics-level-2)
- [Task 3: Predictive Analytics & Machine Learning](#task-3-predictive-analytics--machine-learning-level-3)
- [Kesimpulan Utama](#kesimpulan-utama)
- [Tools & Teknologi](#tools--teknologi)
- [Cara Menjalankan](#cara-menjalankan)

---

## Tentang Proyek

Tujuan proyek ini adalah menganalisis perilaku pelanggan perusahaan telekomunikasi untuk memahami **faktor-faktor yang mendorong customer churn** (pelanggan berhenti berlangganan), mulai dari eksplorasi data dasar, analisis di level database, hingga membangun model prediktif menggunakan machine learning.

## Dataset

Dataset yang digunakan adalah **Telco Customer Churn Dataset (BigML)**, terdiri dari:
- `churn-bigml-80.csv` — 2.667 baris, digunakan sebagai data training
- `churn-bigml-20.csv` — 667 baris, digunakan sebagai data testing

Setiap baris merepresentasikan satu pelanggan, dengan 20 kolom meliputi informasi akun (lama berlangganan, negara bagian), paket (international plan, voicemail plan), pola pemakaian (menit & biaya telepon siang/sore/malam/internasional), jumlah panggilan ke customer service, dan status churn (True/False).

---

## Task 1: Exploratory Data Analysis (Level 1)

**Tools:** Python (Pandas, Matplotlib, Seaborn) di Google Colab

**Yang dilakukan:**
- Ringkasan statistik deskriptif (mean, median, std) untuk seluruh variabel numerik
- Analisis proporsi churn (distribusi target)
- Visualisasi distribusi (histogram), perbandingan antar grup (boxplot), dan korelasi antar variabel (heatmap)

**Insight utama:**
- Proporsi churn sebesar **14.55%** — dataset tergolong *imbalanced*
- Pelanggan dengan **International Plan aktif** memiliki tingkat churn **43.7%**, jauh lebih tinggi dibanding pelanggan tanpa paket ini (**11.3%**)
- Pelanggan dengan jumlah **customer service calls** yang tinggi cenderung lebih banyak churn
- `Total day minutes` dan `Total day charge` memiliki korelasi mendekati sempurna (charge dihitung langsung dari minutes)

📁 File: `Task1_EDA.ipynb` (atau `.py`)

---

## Task 2: SQL for Business Analytics (Level 2)

**Tools:** PostgreSQL, pgAdmin 4

**Yang dilakukan:**
- Membuat database `codveda_churn` dengan 2 tabel terpisah: `churn_data` (training) dan `churn_data_test` (testing)
- Query dasar (`SELECT`, `WHERE`) dan agregasi (`COUNT`, `AVG`, `SUM`, `GROUP BY`)
- `JOIN` dan `UNION ALL` untuk menggabungkan/menghubungkan data antar tabel
- Optimasi query menggunakan `EXPLAIN ANALYZE`

**Insight utama:**
- Rata-rata `customer_service_calls` pada pelanggan yang churn lebih tinggi dibanding yang tidak churn
- Query agregasi per `state` menunjukkan variasi pola pemakaian antar wilayah

📁 File: `Task2_SQL_Queries.sql`

---

## Task 3: Predictive Analytics & Machine Learning (Level 3)

**Tools:** Python (Scikit-learn, Pandas) di Google Colab

**Yang dilakukan:**
- Encoding variabel kategorikal (`International plan`, `Voice mail plan`, `Churn`) menjadi numerik
- Melatih model **Random Forest Classifier** menggunakan data training, diuji pada data testing terpisah
- Evaluasi model menggunakan Accuracy, Precision, **Recall**, dan Confusion Matrix
- Analisis **Feature Importance** untuk mengidentifikasi variabel paling berpengaruh
- Perbandingan dengan model **Logistic Regression** sebagai baseline

**Hasil model:**

| Model | Accuracy | Precision | Recall |
|---|---|---|---|
| Random Forest | 95.4% | 95.7% | **70.5%** |
| Logistic Regression | 85.3% | – | 15.8% |

**Fitur paling berpengaruh:** `Total day minutes`, `Customer service calls`, `Total day charge`, `International plan`

📁 File: `Task3_Predictive_ML.ipynb` (atau `.py`)

---

## Kesimpulan Utama

1. **Recall lebih penting daripada Accuracy** untuk kasus churn prediction, karena data bersifat imbalanced (~14.5% churn). Model dengan accuracy tinggi belum tentu efektif mendeteksi pelanggan yang benar-benar berisiko churn — terbukti dari perbandingan Random Forest vs Logistic Regression di atas.
2. Insight dari **EDA murni-visual (Task 1)** konsisten dengan hasil **Feature Importance model ML (Task 3)** — kedua pendekatan sama-sama mengidentifikasi `Customer service calls` dan `International plan` sebagai indikator kuat churn.
3. **Rekomendasi bisnis:** perusahaan dapat memprioritaskan program retensi pelanggan pada dua segmen utama — pelanggan dengan jumlah panggilan customer service yang tinggi, dan pengguna International Plan — karena keduanya terbukti memiliki risiko churn signifikan lebih tinggi.

---

## Tools & Teknologi

- **Python**: Pandas, Matplotlib, Seaborn, Scikit-learn
- **Database**: PostgreSQL, pgAdmin 4
- **Environment**: Google Colab

---

## Cara Menjalankan

1. Clone repositori ini
2. Untuk Task 1 & 3: buka file `.ipynb` di Google Colab, upload `churn-bigml-80.csv` dan `churn-bigml-20.csv`, jalankan cell secara berurutan
3. Untuk Task 2: buat database PostgreSQL baru, jalankan `Task2_SQL_Queries.sql` di Query Tool pgAdmin, lalu import kedua file CSV ke tabel yang sesuai

---

## Kontak

Proyek ini dikerjakan sebagai bagian dari **Codveda Technology Internship Program**.

🔗 LinkedIn: linkedin.com/in/salsabila-yufli/
📧 Email: salsabilayufliramadhani15@gmail.com
