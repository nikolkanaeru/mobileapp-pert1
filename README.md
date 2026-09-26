# Tugas Pertemuan 1 - Dasar Dart

NIM: 1124160154  
NAMA: MUHAMAD AZMI MA'MUN  

---

```dart
void main() {
  print('=== DATA INVENTARIS TOKO ===');
  String nama = 'Ahyeon';
  int umur = 21;
  double tinggi = 1.50;

  print(nama);
  print(umur);
  print(tinggi);

  String? retired;
  retired = 'sudah';
  retired = null;

  String status = retired ?? 'masih aktif';

  print(status.toUpperCase());

  final String userID = "PRBT994";
  final DateTime userIDTime = DateTime.now();

  print(userID);
  print(userIDTime);

  const double panjangKabel = 2.50;
  const String namaKabel = "Kabel Type-C USB";

  print(panjangKabel);
  print(namaKabel);

  bool isActive = true;
  bool isVerified = true;

  print(isActive);
  print(isVerified);

  List<String> namaProduk = [
    'Sapu Ijuk',
    'Ember Plastik',
    'Cangkul Baja'
  ];

  print(namaProduk);
  print(namaProduk[0]);
  print(namaProduk[2]);

  Set<String> pakaianPria = {};

  pakaianPria.add('Rompi Safety');
  pakaianPria.add('Helm Proyek');
  pakaianPria.add('Sarung Tangan');

  print(pakaianPria);

  Map<String, dynamic> customer = {
    'nama' : 'Budi Santoso',
    'umur' : 40,
    'status' : 'lunas'
  };

  print(customer['nama']);
  print(customer['umur']);
  print(customer['status']);  

  Object data = 'Budi Santoso';
  data = 40;
  data = true;

  if (data is String){
    print(data.toLowerCase());
  }
}