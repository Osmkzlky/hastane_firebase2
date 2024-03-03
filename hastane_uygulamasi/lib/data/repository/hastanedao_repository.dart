import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class HastaneDaoRepository{
  var collectionDuyurular=FirebaseFirestore.instance.collection("Duyurular");

  Future<void> kaydet(String baslik,String aciklama,String tarih) async{
    var yeniDuyuru=HashMap<String,dynamic>();
    yeniDuyuru["id"]="";
    yeniDuyuru["baslik"]=baslik;
    yeniDuyuru["aciklama"]=aciklama;
    yeniDuyuru["tarih"]=tarih;
    collectionDuyurular.add(yeniDuyuru);
  }

  Future<void> guncelle(String idNumarasi,String baslik,String aciklama,String tarih) async{
    var guncellenenDuyuru=HashMap<String,dynamic>();
    guncellenenDuyuru["baslik"]=baslik;
    guncellenenDuyuru["aciklama"]=aciklama;
    guncellenenDuyuru["tarih"]=tarih;
    collectionDuyurular.doc(idNumarasi).update(guncellenenDuyuru);
  }

  Future<void> sil(String id) async{
    collectionDuyurular.doc(id).delete();
  }
}