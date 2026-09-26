void main() {
  print('=== 1. EXPLICIT TYPING & MUTABILITY ===');
  // Variabel kostum tema inventaris/parabot
  String namaBarang = 'Sapu Ijuk Premium';
  int stokBarang = 45;
  double hargaBarang = 25000.0;
  bool isTersedia = true;

  print('Nama Barang: $namaBarang');
  print('Stok Awal: $stokBarang unit');
  print('Harga Satuan: Rp$hargaBarang');
  print('Status Tersedia: $isTersedia');

  // Perubahan nilai variabel (mutable)
  stokBarang = 60;
  print('Stok Setelah Penambahan: $stokBarang unit\n');

  print('=== 2. SOUND NULL SAFETY ===');
  // Non-nullable variable
  String namaGudang = 'Gudang Pusat Parabot';
  
  // Nullable variable (?)
  String? catatanPengiriman;
  
  // Null-aware operator (??) untuk nilai default
  String cetakCatatan = catatanPengiriman ?? 'Tidak ada catatan pengiriman';
  print('Lokasi: $namaGudang');
  print('Catatan Awal: $cetakCatatan');

  // Mengisi data nullable
  catatanPengiriman = 'Kirim sebelum jam 4 sore, bungkus bubble wrap';
  cetakCatatan = catatanPengiriman ?? 'Tidak ada catatan pengiriman';
  print('Catatan Diperbarui: $cetakCatatan\n');

  print('=== 3. IMMUTABILITY (final vs const) ===');
  final DateTime waktuInput = DateTime.now(); // Runtime constant
  const double diskonMember = 0.05; // Compile-time constant (5%)

  print('Waktu Transaksi: $waktuInput');
  print('Besar Diskon Member: ${diskonMember * 100}%');

  double totalHarga = hargaBarang - (hargaBarang * diskonMember);
  print('Total Harga Setelah Diskon: Rp$totalHarga\n');

  print('=== 4. LIST & STRING INTERPOLATION ===');
  List<String> daftarKategori = ['Peralatan Dapur', 'Peralatan Kebersihan', 'Pertukangan'];
  
  // Menambahkan item baru ke List
  daftarKategori.add('Elektronik Rumah');

  print('Daftar Kategori Produk (${daftarKategori.length} item):');
  for (int i = 0; i < daftarKategori.length; i++) {
    print('${i + 1}. ${daftarKategori[i]}');
  }
}