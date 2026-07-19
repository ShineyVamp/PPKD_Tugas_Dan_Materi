/// Kode dibawah merupakan fungsi untuk menampilkan biodata anggota klub
void tampilkanBiodata(Nama, Umur, tB, fav, infotambah){
    /* variabel variabel didalam kurung diatas merupakan parameter yang dibutuhkan untuk
    memanggil fungsi tampilkanBiodata */
  print("Nama anggota : ${Nama}");
  print("Umur anggota : ${Umur}");
  print("Tinggi Badan anggota : ${tB}");
  print("Buku Favorit anggota : ${fav[0]} & ${fav[1]}"); // baris kode pemanggilan Map (belum menggunakan perulangan)
  print("\nInfo tambahan anggota \nAlamat Anggota : ${infotambah["alamat"]} \nProfesi Anggota : ${infotambah["profesi"]}"); // penggunaan \n untuk membuat newline agar tidak bertumpuk


}

/// Kode dibawah ini merupakan fungsi utama dari program dan juga tempat penginisialisasian variabel dan pemanggilan fungsi yang telah dibuat
void main(){
  String Nama = "Bayu";
  int Umur = 34;
  double tB = 200;
  List<String> fav = ["Buku masak", "buku buki", "ytta"];


  Map<String, dynamic> infotambah = {
      "alamat" : "jalan iya",
      "profesi" : "pengacara"
  };


  tampilkanBiodata(Nama, Umur, tB, fav, infotambah); // kode pemanggilan fungsi
}
