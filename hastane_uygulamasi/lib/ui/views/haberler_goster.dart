import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/entity/haberler.dart';
import 'package:hastane_uygulamasi/ui/cubit/haberler_goster_cubit.dart';
import 'package:hastane_uygulamasi/ui/views/haberler_detay.dart';
import 'package:hastane_uygulamasi/ui/views/haberler_kayit.dart';

class HaberlerGoster extends StatefulWidget {
  const HaberlerGoster({super.key});

  @override
  State<HaberlerGoster> createState() => _HaberlerGosterState();
}

class _HaberlerGosterState extends State<HaberlerGoster> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HaberlerGosterCubit>().haberYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9ECF2),
      appBar: AppBar(
        backgroundColor: Color(0xFFE9ECF2),
        title: Text("Hastameniz ile İlgili Haberler"),
      ),
      body: BlocBuilder<HaberlerGosterCubit, List<Haberler>>(
        builder: (context, haberlerListesi) {
          if (haberlerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: haberlerListesi.length,
              itemBuilder: (context, indeks) {
                var haber = haberlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HaberlerDetay(haber)));
                  },
                  child: Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  haber.haberler_tarih,
                                  style: TextStyle(fontFamily: "Agbalumo"),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  haber.haberler_baslik,
                                  style: TextStyle(fontFamily: "Agbalumo"),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "${haber.haberler_baslik} adlı haber silinsin mi"),
                                      action: SnackBarAction(
                                        label: "Evet",
                                        onPressed: () {
                                          context.read<HaberlerGosterCubit>().sil(haber.haberler_id);
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
                );
              },
            );
          } else {
            return Center(); // Burada bir widget döndürmelisiniz
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xFF406A9B),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HaberlerKayit()));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
