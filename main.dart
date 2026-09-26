void main() {
  print('=== INVENTARIS TOKO ===');
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

  final String userID = "PRBT001";
  final DateTime userIDTime = DateTime.now();

  print(userID);
  print(userIDTime);

  const double panjangKabel = 1.00;
  const String namaKabel = "Kabel Type-C";

  print(panjangKabel);
  print(namaKabel);

  bool isActive = true;
  bool isVerified = true;

  print(isActive);
  print(isVerified);

  List<String> namaProduk = [
    'Sapu Lidi',
    'Ember Plastik',
    'Cangkul'
  ];

  print(namaProduk);
  print(namaProduk[0]);
  print(namaProduk[2]);

  Set<String> pakaianPria = {};

  pakaianPria.add('Hoodie CHMB');
  pakaianPria.add('Baju Chambre de la vain');
  pakaianPria.add('Celana Baggy CHMB');

  print(pakaianPria);

  Map<String, dynamic> customer = {
    'nama' : 'Park Jonggun',
    'umur' : 25,
    'status' : 'lunas'
  };

  print(customer['nama']);
  print(customer['umur']);
  print(customer['status']);  

  Object data = 'Park Jonggun';
  data = 25;
  data = true;

  if (data is String){
    print(data.toLowerCase());
  }
}