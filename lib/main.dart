import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

TextEditingController bilangan1 = TextEditingController();
TextEditingController bilangan2 = TextEditingController();
TextEditingController hasil = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Pertambahan", style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              TextField(
                controller: bilangan1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  prefixIcon: Icon(Icons.looks_one_outlined),
                  labelText: "Bilangan 1",
                  hintText: "Inputkan Bilangan 1"
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: bilangan2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  prefixIcon: Icon(Icons.looks_two_outlined),
                  labelText: "Bilangan 2",
                  hintText: "Inputkan Bilangan 2"
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    if(bilangan1.text == "" || bilangan2.text == ""){
                      Fluttertoast.showToast(
                        msg: "Masukkan Bilangan 1 dan Bilangan 2",
                        textColor: Colors.black,
                        backgroundColor: Colors.white, //warna bg android
                        gravity: ToastGravity.CENTER, //posisi pada android
                        timeInSecForIosWeb: 3,  //lama muncul pesan pada web
                        webPosition: "center", //posisi pada web + kombinasi gravity
                        webBgColor: "white", //warna pada web
                        toastLength: Toast.LENGTH_LONG //lama muncul android
                      );
                    }else{
                    num bil1 = num.parse(bilangan1.text);
                    num bil2 = num.parse(bilangan2.text);
                    num result = bil1 + bil2;
                    hasil.text = result.toString();
                    }
                  }, child: Text("Tambah")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    hasil.text = "";
                    bilangan1.text = "";
                    bilangan2.text = "";
                  }, child: Text("Hapus")),
                ],
              ),
              SizedBox(height: 15,),
              TextField(
                controller: hasil,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  prefixIcon: Icon(Icons.equalizer),
                  labelText: "Hasil"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}