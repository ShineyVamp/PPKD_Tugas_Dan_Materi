import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class VoucherTicket {
  final String nama;
  final String gambar;
  final String deskripsi;
  VoucherTicket({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'gambar': gambar,
      'deskripsi': deskripsi,
    };
  }

  factory VoucherTicket.fromMap(Map<String, dynamic> map) {
    return VoucherTicket(
      nama: map['nama'] as String,
      gambar: map['gambar'] as String,
      deskripsi: map['deskripsi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoucherTicket.fromJson(String source) =>
      VoucherTicket.fromMap(json.decode(source) as Map<String, dynamic>);
}
// ini model dari data voucher dan tiket