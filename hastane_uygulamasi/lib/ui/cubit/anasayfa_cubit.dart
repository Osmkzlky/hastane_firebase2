import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/entity/duyurular.dart';
import 'package:hastane_uygulamasi/data/repository/hastanedao_repository.dart';

class AnasayfaCubit extends Cubit<List<Duyurular>>{

  AnasayfaCubit():super(<Duyurular>[]);

  var hrepo=HastaneDaoRepository();

  var colectionDuyurular=FirebaseFirestore.instance.collection("Duyurular");

  Future<void> duyuruYukle() async{
    colectionDuyurular.snapshots().listen((event) {
      var duyuruListesi=<Duyurular>[];

      var documents=event.docs;
      for(var document in documents){
        var key=document.id;
        var data=document.data();
        var duyuru=Duyurular.fromJson(data, key);
        duyuruListesi.add(duyuru);
      }
      emit(duyuruListesi);
    });
  }

  Future<void> sil (String id) async{
    await hrepo.sil(id);
  }

}