import 'package:dinamik_not_ortalamasi/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi/data/data_helper.dart';
import 'package:dinamik_not_ortalamasi/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHarfler.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a){
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toString()),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyiniz!",
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
