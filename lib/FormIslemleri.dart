import 'dart:convert';

import 'package:ardiuno_nem_sicaklik/models/Gonderi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormIslemleri extends StatefulWidget {
  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  String girilenMetin;
  final userControl = TextEditingController(text: "ERDIS");
  final passControl = TextEditingController(text: "123");
  String user;
  String pass;
  String islem;
  String mesaj;
  Future<Gonderi> futureAlbum;
  Gonderi gonderi;

  @override
  void dispose() {
    userControl.dispose();
    passControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        //padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: Center(
          child: Container(
            child:
                // ignore: deprecated_member_use
                RaisedButton(
              padding: EdgeInsets.all(15),
              color: Colors.blue[900],
              onPressed: () {
                futureAlbum = fetchAlbum(userControl.text.toString(),
                        passControl.text.toString())
                    .then((_) {
                  if (islem.toString() == "1") {
                    debugPrint("geldi");
                  } else {
                    //print("mesaj: " + mesaj.toString());
                  }
                });
              },
              child: Text(
                "Giriş verileri gönder",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Gonderi> fetchAlbum(String user, String pass) async {
    final response = await http.get(
      //'http://sapr3-test.hepsiburada.dmz:8000/sap(bD10ciZjPTIwMA==)/bc/bsp/sap/zwm_bsp_013/request.html?process_type=01&json_request={ "KULLANICI_BILGILERI":{ "KULLANICI_ID":"", "KULLANICI_AD":"$user", "AD":"", "SOYAD":"", "EPOSTA":"", "CIHAZ_ID":"", "TOKEN":"", "MULTI_AUTH":"", "SESSION_ID":"", "SIFRE":"$pass", "VERSION":""}, "SONUC":{ "ISLEM_DURUMU":0 , "MESAJ_TIPI":"", "MSGID":"", "MSGNO":"", "MESAJ":"", "MSGGROUP":""}, "ILKEKRAN":{ "BARKODLAR":[ ], "KAYNAKDEPO":"", "BARKOD":""}, "IKINCIEKRAN":{ "MALZ_NO":"", "MALZ_METNI":"", "MIKTAR":0 , "TMIKTAR":0 , "HEDEF_ADRES":"", "ONERILEN_ADRESLER":[ ], "MIKTAR_YETKI":""}}');
      //'http://sapr3-test.hepsiburada.dmz:8000/sap/bc/bsp/sap/zwm_bsp_013/request.html?process_type=01&json_request={ "KULLANICI_BILGILERI":{ "KULLANICI_ID":"", "KULLANICI_AD":"$user", "AD":"", "SOYAD":"", "EPOSTA":"", "CIHAZ_ID":"", "TOKEN":"", "MULTI_AUTH":"", "SESSION_ID":"", "SIFRE":"$pass", "VERSION":""}, "SONUC":{ "ISLEM_DURUMU":0 , "MESAJ_TIPI":"", "MSGID":"", "MSGNO":"", "MESAJ":"", "MSGGROUP":""}, "ILKEKRAN":{ "BARKODLAR":[ ], "KAYNAKDEPO":"", "BARKOD":""}, "IKINCIEKRAN":{ "MALZ_NO":"", "MALZ_METNI":"", "MIKTAR":0 , "TMIKTAR":0 , "HEDEF_ADRES":"", "ONERILEN_ADRESLER":[ ], "MIKTAR_YETKI":""}}',
      //'http://qa-app-02.hepsiburada.dmz:8000/sap/bc/bsp/sap/zwm_bsp_013/request.html?process_type=01&json_request={ "KULLANICI_BILGILERI":{ "KULLANICI_ID":"", "KULLANICI_AD":"$user", "AD":"", "SOYAD":"", "EPOSTA":"", "CIHAZ_ID":"", "TOKEN":"", "MULTI_AUTH":"", "SESSION_ID":"", "SIFRE":"$pass", "VERSION":""}, "SONUC":{ "ISLEM_DURUMU":0 , "MESAJ_TIPI":"", "MSGID":"", "MSGNO":"", "MESAJ":"", "MSGGROUP":""}, "ILKEKRAN":{ "BARKODLAR":[ ], "KAYNAKDEPO":"", "BARKOD":""}, "IKINCIEKRAN":{ "MALZ_NO":"", "MALZ_METNI":"", "MIKTAR":0 , "TMIKTAR":0 , "HEDEF_ADRES":"", "ONERILEN_ADRESLER":[ ], "MIKTAR_YETKI":""}}',
      'https://api.thingspeak.com/channels/1314418/feeds.json?api_key=D760QD0HIZAO4IB9&results=2',
    );
    //print('I was waiting here :)');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      gonderi = Gonderi.fromJsonMap(data);
      islem = "1";
      // islem = gonderi.feeds.islem_durumu.toString();
      // mesaj = gonderi.sonuc.mesaj.toString();
      return Gonderi.fromJsonMap(json.decode(response.body));
    } else {
      //debugPrint("fetchalb3");
      throw Exception('Failed to load album');
    }
  }
}
