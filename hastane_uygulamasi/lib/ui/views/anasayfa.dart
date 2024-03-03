import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/entity/duyurular.dart';
import 'package:hastane_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:hastane_uygulamasi/ui/cubit/duyuru_detay_cubit.dart';
import 'package:hastane_uygulamasi/ui/views/duyuru_detay.dart';
import 'package:hastane_uygulamasi/ui/views/duyuru_kayit.dart';
import 'package:hastane_uygulamasi/ui/views/haberler_goster.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final List<String> duyurular = [
    "Duyuru 1",
    "Duyuru 2",
    "Duyuru 3",
    "Duyuru 4",
  ];

  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().duyuruYukle();
  }

  @override
  Widget build(BuildContext context) {
    var yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFE9ECF2),
      appBar: AppBar(
        toolbarHeight: yukseklik / 8,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("images/bakanlik_logo.png"),
        ),
        title: Text(
          "Kanuni Sultan Süleyman\n Eğitim ve Araştırma Hastanesi",
          style: TextStyle(fontSize: 15, fontFamily: "Agbalumo"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Ad\nSoyad",
              style: TextStyle(color: Color(0xFF406A9B)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: yukseklik / 4,
                child: PageView(
                  controller: _pageController,
                  children: duyurular.map((duyuru) {
                    return GestureDetector(
                      onTap: () {
                        print(duyuru);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(duyuru),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      color: Color(0xFF406A9B),
                      iconSize: 35,
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      },
                      icon: Icon(Icons.arrow_circle_left_rounded),
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HaberlerGoster()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                              0xFF406A9B), // Genişlik ve yükseklik değerleri
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "icons/newspaper.png",
                              color: Colors.white,
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Haberler",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      color: Color(0xFF406A9B),
                      iconSize: 35,
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.linear,
                        );
                      },
                      icon: Icon(Icons.arrow_circle_right),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Boşluk ekleyebilirsiniz
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 125,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "icons/bolumler.png",
                              color: Colors.white,
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Çalışan Görüş ve Öneriler",
                              style: TextStyle(color: Color(0xFF406A9B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "icons/stethoscope.png",
                              color: Color(0xFF406A9B),
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Doktorlar",
                              style: TextStyle(color: Color(0xFF406A9B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "icons/hemsire.png",
                              color: Color(0xFF406A9B),
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              "Hemşireler",
                              style: TextStyle(color: Color(0xFF406A9B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Duyurular",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25)),
              ),
              SizedBox(
                height: 500,
                child: Container(
                  child: Column(
                    children: [
                      BlocBuilder<AnasayfaCubit, List<Duyurular>>(
                          builder: (context, duyuruListesi) {
                        if (duyuruListesi.isNotEmpty) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: duyuruListesi.length,
                                itemBuilder: (context, indeks) {
                                  var duyuru = duyuruListesi[indeks];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DuyuruDetay(duyuru)));
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        child: SizedBox(
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      duyuru.tarih,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Agbalumo"),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 250,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0),
                                                    child: Text(
                                                      duyuru.baslik,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Agbalumo"),
                                                      maxLines: 4,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                IconButton(
                                                    onPressed: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              "${duyuru.baslik} adlı haber silinsin mi"),
                                                          action:
                                                              SnackBarAction(
                                                            label: "Evet",
                                                            onPressed: () {
                                                              context
                                                                  .read<
                                                                      AnasayfaCubit>()
                                                                  .sil(duyuru
                                                                      .idNumarasi);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF406A9B),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return const Center();
                        }
                      })
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DuyuruKayit()));
                  },
                  child: Text("Duyuru Ekle")),
            ],
          ),
        ),
      ),
    );
  }
}
