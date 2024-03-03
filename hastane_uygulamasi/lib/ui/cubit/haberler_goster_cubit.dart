import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/entity/haberler.dart';
import 'package:hastane_uygulamasi/data/repository/haberlerdao_repository.dart';

class HaberlerGosterCubit extends Cubit<List<Haberler>>{

  HaberlerGosterCubit():super(<Haberler>[]);

  var hasrepo=HaberlerDaoRepository();

  var colectionHaberler=FirebaseFirestore.instance.collection("Haberler");

  Future<void> haberYukle() async{
    colectionHaberler.snapshots().listen((event) {
      var haberListesi=<Haberler>[];
      var documents=event.docs;
      for(var document in documents){
        var key1=document.id;
        var data1=document.data();
        var haber=Haberler.fromJson(data1, key1);
        haberListesi.add(haber);
      }
      emit(haberListesi);
    });
  }

  Future<void> sil (String haberler_id) async{
    await hasrepo.sil(haberler_id);

  }

}