void main() {
  int UAS = 80;
  int UTS = 90;
  double kehadiran = 0.90;
  double rata_rata = (UTS + UAS)/2; 
  if (rata_rata >= 70 && kehadiran >= 0.75 && !(UTS <= 60 || UAS <= 60)){
      print(
        "Hasil belajar siswa dengan:"
        "\nNilai UAS $UAS"
        "\nNilai UTS $UTS"
        "\nRata-Rata $rata_rata"
        "\nPresentase Kehadiran ${kehadiran * 100}%"
        "\ndinyatakan LULUS"
      );
  } else {
      print(
        "Hasil belajar siswa dengan:"
        "\nNilai UAS $UAS"
        "\nNilai UTS $UTS"
        "\nRata-Rata $rata_rata"
        "\nPresentase Kehadiran ${kehadiran * 100}%"
        "\ndinyatakan TIDAK LULUS"
      );
  }
}
