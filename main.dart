void main() {
  print('=== 1. EXPLICIT TYPING & MUTABILITY ===');
  String productName = 'Kopi Susu Gula Aren';
  int stock = 25;
  double price = 18000.0;
  bool isAvailable = true;

  print('Produk: $productName');
  print('Stok Awal: $stock');
  print('Harga: Rp$price');
  print('Tersedia: $isAvailable');

  // Mengubah nilai variabel mutable
  stock = 30;
  print('Stok Setelah Update: $stock\n');

  print('=== 2. SOUND NULL SAFETY ===');
  // Non-nullable variable
  String storeName = 'Kedai Kopi Digital';
  
  // Nullable variable (?)
  String? customerNote;
  
  // Null-aware operator (??) untuk nilai alternatif
  String noteToPrint = customerNote ?? 'Tidak ada catatan khusus';
  print('Toko: $storeName');
  print('Catatan Pelanggan: $noteToPrint');

  // Mengisi data nullable
  customerNote = 'Less ice, extra espresso';
  noteToPrint = customerNote ?? 'Tidak ada catatan khusus';
  print('Catatan Diperbarui: $noteToPrint\n');

  print('=== 3. IMMUTABILITY (final vs const) ===');
  final DateTime orderTime = DateTime.now(); 
  const double taxRate = 0.11; 

  print('Waktu Transaksi: $orderTime');
  print('Pajak (PPN 11%): ${taxRate * 100}%');

  double totalPrice = price + (price * taxRate);
  print('Total Bayar: Rp$totalPrice\n');

  print('=== 4. LIST & STRING INTERPOLATION ===');
  List<String> menuItems = ['Kopi Hitam', 'Kopi Susu', 'Teh Tarik'];
  
  // Menambahkan item ke List
  menuItems.add('Matcha Latte');

  print('Daftar Menu Kopi (${menuItems.length} item):');
  for (int i = 0; i < menuItems.length; i++) {
    print('${i + 1}. ${menuItems[i]}');
  }
}