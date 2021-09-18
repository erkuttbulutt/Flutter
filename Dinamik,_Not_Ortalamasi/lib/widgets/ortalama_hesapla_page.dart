import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi/data/data_helper.dart';
import 'package:dinamik_not_ortalamasi/model/ders.dart';
import 'package:dinamik_not_ortalamasi/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalamasi/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //klavye açıldığında taşma hatası giderme
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: Sabitler.yatayPadding8,
                        child: _buildTextFormField(),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: Sabitler.yatayPadding8,
                              child: _buildHarfler(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: Sabitler.yatayPadding8,
                              child: _buildKrediler(),
                            ),
                          ),
                          IconButton(
                            onPressed: _dersEkleveOrtalamaHesapla,
                            icon: Icon(Icons.arrow_forward_ios_sharp),
                            color: Sabitler.anaRenk,
                            iconSize: 36,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHarfler.tumEklenenDersler.length,
                    ortalama: DataHarfler.ortalamaHesapla()),
              ),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                print("eleman çıkarıldı index: $index");
                DataHarfler.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
          hintText: "Ders Adı",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(1),
        ),
        onSaved: (deger) {
          setState(() {
            girilenDersAdi = deger!;
          });
        },
        validator: (s) {
          if (s!.length <= 0) {
            return "Ders adını giriniz";
          } else
            return null;
        });
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenHarfDeger,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger = deger!;
          });
        },
        items: DataHarfler.tumDersHarfleri(),
        underline: Container(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenKrediDeger,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
          });
        },
        items: DataHarfler.tumDerslerinKredileri(),
        underline: Container(),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger);
      DataHarfler.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
