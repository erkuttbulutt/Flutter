import 'package:bolum20_burc_rehberi/burc_item.dart';
import 'package:bolum20_burc_rehberi/data/strings.dart';
import 'package:bolum20_burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  List<Burc> tumBurclar = [];
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burçlar Listesi'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BurcItem(
              listelenenBurc: tumBurclar[index],
            );
          },
          itemCount: tumBurclar.length,
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (var i = 0; i < 12; i++) {
      var burc_Ad = Strings.BURC_ADLARI[i];
      var burc_Tarih = Strings.BURC_TARIHLERI[i];
      var burc_Detay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burc_Kucuk_Resim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      //toLowerCase: String ifadenin hepsini küçük harfe dönüştürür.
      var burc_Buyuk_Resim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i + 1}.png';
      Burc ekle = Burc(
          burc_Ad, burc_Tarih, burc_Detay, burc_Kucuk_Resim, burc_Buyuk_Resim);
      gecici.add(ekle);
    }
    return gecici;
  }
}
