import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/ui/cubit/haberler_kayit_cubit.dart';

class HaberlerKayit extends StatefulWidget {
  const HaberlerKayit({super.key});

  @override
  State<HaberlerKayit> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<HaberlerKayit> {
  var tfHaberBaslik = TextEditingController();
  var tfHaberAciklma = TextEditingController();
  var tfHaberTarih = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE9ECF2),
        title: const Text("Haber Ekle"),
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
                  Text("Haber Başlığı",style: TextStyle(color: Color(0xFF406A9B),fontWeight: FontWeight.bold),),
                  Padding(
                      padding: const EdgeInsets.only(top:10.00,bottom: 10.0),
                      child: SizedBox(
                        height: 200,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          controller: tfHaberBaslik,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                              hintText: "Açıklama..."),
                        ),
                      )),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tarih",style: TextStyle(color: Color(0xFF406A9B),fontWeight: FontWeight.bold)),
                              TextField(
                                controller: tfHaberTarih,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Örn 12 Aralık"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text("Haber İçeriği",style: TextStyle(color: Color(0xFF406A9B),fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                        height: 300,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          controller: tfHaberAciklma,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              isDense: true,
                            hintText: "Açıklama..."
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<HaberlerKayitCubit>().kaydet(tfHaberBaslik.text, tfHaberAciklma.text, tfHaberTarih.text);
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF406A9B),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                          child: Text("Kaydet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
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
