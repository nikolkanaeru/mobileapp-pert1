// =============================================
// HW 2 - Aplikasi Kasir Laundry
// Nama : Muhamad Azmi Ma'mun
// NIM  : 1124160154
// =============================================

// ---------- ABSTRACTION ----------

enum TipeLayanan {
  reguler,
  express,
}

enum StatusProses {
  berhasildiproses,
  beratBermasalah,
}

class PesananLaundry {
  final String namaPelanggan;
  final double bobotKg;
  final TipeLayanan opsiLayanan;

  PesananLaundry(this.namaPelanggan, this.bobotKg, this.opsiLayanan);
}

// ---------- DATA ----------

const double tarifPerKg = 7000;
const double batasMinKg = 2;
const double surchargeExpress = 0.5;

final List<PesananLaundry> daftarCucian = [];

// ---------- DECOMPOSITION ----------

// BR-04 : Bobot cucian wajib lebih dari 0 kg
bool cekBobotValid(double bobotKg) {
  return bobotKg > 0;
}

// BR-02 : Berat kurang dari 2 kg otomatis dihitung 2 kg
double hitungBobotEfektif(double bobotKg) {
  if (bobotKg < batasMinKg) {
    return batasMinKg;
  }
  return bobotKg;
}

// BR-01 : Biaya standar Rp7.000/kg
double kalkulasiBiayaDasar(double bobotKg, double tarif) {
  return bobotKg * tarif;
}

// BR-03 : Layanan Express dikenakan biaya tambahan 50%
double kalkulasiTotalBayar(double biayaDasar, TipeLayanan opsiLayanan) {
  switch (opsiLayanan) {
    case TipeLayanan.reguler:
      return biayaDasar;

    case TipeLayanan.express:
      return biayaDasar * (1 + surchargeExpress);
  }
}

// ---------- ALGORITHM ----------

StatusProses olahPesanan(PesananLaundry pesanan) {
  // Validasi berat cucian
  if (!cekBobotValid(pesanan.bobotKg)) {
    print('Nama Pelanggan  : ${pesanan.namaPelanggan}');
    print('Berat Asli      : ${pesanan.bobotKg} kg');
    print('Layanan         : ${pesanan.opsiLayanan.name}');
    print('Status          : Berat cucian tidak valid!');

    return StatusProses.beratBermasalah;
  }

  // Menentukan berat efektif yang dihitung
  final bobotPakai = hitungBobotEfektif(pesanan.bobotKg);

  // Menghitung harga dasar
  final subtotal = kalkulasiBiayaDasar(
    bobotPakai,
    tarifPerKg,
  );

  // Menghitung total biaya akhir
  final totalAkhir = kalkulasiTotalBayar(
    subtotal,
    pesanan.opsiLayanan,
  );

  // Menyimpan transaksi yang valid ke dalam list
  daftarCucian.add(pesanan);

  print('Nama Pelanggan  : ${pesanan.namaPelanggan}');
  print('Berat Asli      : ${pesanan.bobotKg} kg');
  print('Berat Dihitung  : $bobotPakai kg');
  print('Layanan         : ${pesanan.opsiLayanan.name}');
  print('Tarif           : Rp${tarifPerKg.toStringAsFixed(0)}/kg');
  print('Biaya Dasar     : Rp${subtotal.toStringAsFixed(0)}');

  if (pesanan.opsiLayanan == TipeLayanan.express) {
    print('Biaya Express   : +50%');
  }

  print('Total Bayar     : Rp${totalAkhir.toStringAsFixed(0)}');
  print('Status          : Pesanan sukses diproses');

  return StatusProses.berhasildiproses;
}

// ---------- STATUS MESSAGE ----------

String konversiStatusPesan(StatusProses status) {
  switch (status) {
    case StatusProses.berhasildiproses:
      return 'Transaksi Laundry Berhasil';

    case StatusProses.beratBermasalah:
      return 'Transaksi Gagal: Berat Tidak Valid';
  }
}

// ---------- TEST SCENARIO ----------

void main() {
  print('=== HW 2 - SISTEM KASIR LAUNDRY ===\n');

  // ===========================================
  // SKENARIO 1
  // 3 kg x Rp7.000 = Rp21.000
  // ===========================================

  print('=== Skenario 1 (Layanan Reguler) ===');

  final status1 = olahPesanan(
    PesananLaundry('Jay Jo', 3, TipeLayanan.reguler),
  );

  print(konversiStatusPesan(status1));
  print('');

  // ===========================================
  // SKENARIO 2 - BR-02
  // 1 kg dihitung minimal 2 kg
  // 2 kg x Rp7.000 = Rp14.000
  // ===========================================

  print('=== Skenario 2 (Reguler - Minimal 2kg BR-02) ===');

  final status2 = olahPesanan(
    PesananLaundry('Shelly', 1, TipeLayanan.reguler),
  );

  print(konversiStatusPesan(status2));
  print('');

  // ===========================================
  // SKENARIO 3 - BR-03
  // 4 kg x Rp7.000 = Rp28.000
  // Express +50% = Rp42.000
  // ===========================================

  print('=== Skenario 3 (Express - Charge 50% BR-03) ===');

  final status3 = olahPesanan(
    PesananLaundry('Park Hyeunseok', 4, TipeLayanan.express),
  );

  print(konversiStatusPesan(status3));
  print('');

  // ===========================================
  // SKENARIO 4 - BR-04
  // Berat 0 kg tidak valid
  // ===========================================

  print('=== Skenario 4 (Berat 0kg Tidak Valid - BR-04) ===');

  final status4 = olahPesanan(
    PesananLaundry('Crystal', 0, TipeLayanan.reguler),
  );

  print(konversiStatusPesan(status4));
  print('');

  // ===========================================
  // SKENARIO 5 - BR-04
  // Berat minus tidak valid
  // ===========================================

  print('=== Skenario 5 (Berat Negatif Tidak Valid - BR-04) ===');

  final status5 = olahPesanan(
    PesananLaundry('Jonggun', -1, TipeLayanan.express),
  );

  print(konversiStatusPesan(status5));
  print('');

  // ===========================================
  // REKAP DATA LAUNDRY BERHASIL
  // ===========================================

  print('=== Rekap Transaksi Tersimpan ===');

  for (final item in daftarCucian) {
    print(
      'Pelanggan: ${item.namaPelanggan}, '
      'Berat: ${item.bobotKg} kg, '
      'Layanan: ${item.opsiLayanan.name}',
    );
  }

  print('Jumlah Transaksi Berhasil: ${daftarCucian.length}');
}