import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas9page/model/tiketvoucher.dart';

class Tugas9flutterModel extends StatelessWidget {
  Tugas9flutterModel({super.key});

  final List<VoucherTicket> data = [
    VoucherTicket(
      nama: "Voucher Shopee",
      gambar: "assets/images/tugas9/sopi.png",
      deskripsi: "Voucher potongan belanja 30%, Min. Pembelian 30 Rb",
    ),
    VoucherTicket(
      nama: "Voucher Shopee",
      gambar: "assets/images/tugas9/sopi.png",
      deskripsi: "Voucher gratis ongkir, Min. Pembelian 30 Rb",
    ),
    VoucherTicket(
      nama: "Voucher Tiktok",
      gambar: "assets/images/tugas9/tiktok.jpg",
      deskripsi: "Voucher potongan belanja 10%, Min. Pembelian 300 Rb",
    ),
    VoucherTicket(
      nama: "Voucher Tiktok",
      gambar: "assets/images/tugas9/tiktok.jpg",
      deskripsi: "Voucher potongan belanja 30%, Min. Pembelian 30 Rb",
    ),
    VoucherTicket(
      nama: "Batik Air (CGK - UPG)",
      gambar: "assets/images/tugas9/pesawat.jpg",
      deskripsi: "15 Ags 2026 - 08:30 WIB - Ekonomi",
    ),
    VoucherTicket(
      nama: "Garuda Indonesia (CGK - DPS)",
      gambar: "assets/images/tugas9/pesawat.jpg",
      deskripsi: "18 Ags 2026 - 10:00 WIB - Ekonomi",
    ),
    VoucherTicket(
      nama: "Voucher Diskon Tiket Pesawat",
      gambar: "assets/images/tugas9/pesawat.jpg",
      deskripsi: "Diskon 20% s/d Rp150.000, Min. Pembelian 500 Rb",
    ),
    VoucherTicket(
      nama: "Argo Bromo Anggrek (GMR - SBI)",
      gambar: "assets/images/tugas9/kereta.jpg",
      deskripsi: "20 Ags 2026 - 08:00 WIB - Eksekutif",
    ),
    VoucherTicket(
      nama: "Voucher Potongan Kereta Api",
      gambar: "assets/images/tugas9/kereta.jpg",
      deskripsi: "Potongan Rp50.000, Min. Pembelian 150 Rb",
    ),
    VoucherTicket(
      nama: "KM Kelud (TJP - BTH)",
      gambar: "assets/images/tugas9/kapal.jpg",
      deskripsi: "22 Ags 2026 - 14:00 WIB - Kelas 1A",
    ),
    VoucherTicket(
      nama: "Voucher Promo Tiket Kapal Laut",
      gambar: "assets/images/tugas9/kapal.jpg",
      deskripsi: "Diskon 15% s/d Rp100.000, Min. Pembelian 200 Rb",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Voucher dan Tiket Anda"), centerTitle: true),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListTile(
              leading: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(data[index].gambar, fit: BoxFit.cover),
              ),
              title: Text(
                data[index].nama,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[index].deskripsi),
              trailing: Text(
                "Lihat\nDisini",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}
// ini tugas 9 yang model