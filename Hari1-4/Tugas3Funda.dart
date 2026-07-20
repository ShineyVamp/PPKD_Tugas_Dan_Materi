import 'dart:io';

void main(){
  // SOAL 1
  for(int i=1; i<=20; i++){
    if(i % 2 == 1){
      print(i);
    }
  }
  print("");

  // SOAL 2
  for(int j=1; j<=5; j++){
    stdout.write("*");
  }
  print("\n");

  // ALT SOAL 2
  // for(int tang=5; tang<=5; tang++){
  //   print("*"*tang);
  // }
  // print("\n");

  // SOAL 3 
  String nam = "Aisyah";
  int u = 1;
  while(u <= 4){
    print(nam);
    u++;
  }
  print("");

  // SOAL 4
  List<String> buah = ["Apel", "Jeruk", "Mangga", "Anggur"];
  for(String b in buah){
    print("Saya Suka : $b");
  }
  print("");
  
  // SOAL 5
  List<String> belanja = ["Beras", "Minyak", "Royco", "Ketumbar"];
    for(String bel in belanja){
      print("Item Ke ${belanja.indexOf(bel)+1} : $bel");
    }
}