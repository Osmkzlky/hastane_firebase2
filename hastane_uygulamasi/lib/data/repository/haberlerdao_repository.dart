import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class HaberlerDaoRepository{
  var collectionHaberler=FirebaseFirestore.instance.collection("Haberler");

  Future<void> kaydet(String haberler_baslik,String haberler_aciklama,String haberler_tarih) async{
    var yeniHaber=HashMap<String,dynamic>();
    yeniHaber["haber_id"]="";
    yeniHaber["haberler_baslik"]=haberler_baslik;
    yeniHaber["haberler_aciklama"]=haberler_aciklama;
    yeniHaber["haberler_tarih"]=haberler_tarih;
    collectionHaberler.add(yeniHaber);
  }

  Future<void> guncelle(String haberler_id,String haberler_baslik,String haberler_aciklama,String haberler_tarih) async{
    var guncellenenHaber=HashMap<String,dynamic>();
    guncellenenHaber["haber_id"]="";
    guncellenenHaber["haberler_baslik"]=haberler_baslik;
    guncellenenHaber["haberler_aciklama"]=haberler_aciklama;
    guncellenenHaber["haberler_tarih"]=haberler_tarih;
    collectionHaberler.doc(haberler_id).update(guncellenenHaber);
  }

  Future<void> sil(String haberler_id) async{
    collectionHaberler.doc(haberler_id).delete();
  }





}