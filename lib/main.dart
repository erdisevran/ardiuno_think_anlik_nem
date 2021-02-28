import 'package:ardiuno_nem_sicaklik/NavigasyonIslemleri.dart';
import 'package:flutter/material.dart';

//amacım thingspeak içerisine ardiunodan attıgım verileri alıp alamadıgımı görmekti
//servis linki ile body kısmında verileri debugda gördüm.
// modelimi düzenlersem hatasız bir görüntü alabilirim ama bu kadarı su an için yeterli GG
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sıcaklik ve Nem Verileri",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => NavigasyonIslemleri(), // GET PACKAGE
        });
  }
}
