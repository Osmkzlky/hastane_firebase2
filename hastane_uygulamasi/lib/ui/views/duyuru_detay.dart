import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/entity/duyurular.dart';
import 'package:hastane_uygulamasi/ui/cubit/duyuru_detay_cubit.dart';

class DuyuruDetay extends StatefulWidget {
  Duyurular hastane;
  DuyuruDetay(this.hastane);

  @override
  State<DuyuruDetay> createState() => _DuyuruDetayState();
}

class _DuyuruDetayState extends State<DuyuruDetay> {
  var tfBaslik = TextEditingController();
  var tfAciklama = TextEditingController();
  var tfTarih = TextEditingController();


  @override
  void initState() {
    var duyuru=widget.hastane;
    tfBaslik.text=duyuru.baslik;
    tfAciklama.text=duyuru.aciklama;
    tfTarih.text=duyuru.tarih;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE9ECF2),
        title: const Text("Duyuru Ekle"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE9ECF2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Haber Başlığı",
                    style: TextStyle(
                        color: Color(0xFF406A9B), fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10.00, bottom: 10.0),
                      child: SizedBox(
                        height: 200,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          controller: tfBaslik,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              hintText: "Açıklama..."),
                        ),
                      )),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tarih",
                            style: TextStyle(
                                color: Color(0xFF406A9B),
                                fontWeight: FontWeight.bold)),
                        TextField(
                          controller: tfTarih,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Örn 12 Aralık 2024"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text("Haber İçeriği",
                        style: TextStyle(
                            color: Color(0xFF406A9B),
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                        height: 300,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          controller: tfAciklama,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              hintText: "Açıklama..."),
                        )),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<DuyuruDetayCubit>().guncelle(widget.hastane.idNumarasi, tfBaslik.text, tfAciklama.text, tfTarih.text);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                          child: Text(
                            "Güncelle",
                            style: TextStyle(
                                color: Color(0xFF406A9B),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
