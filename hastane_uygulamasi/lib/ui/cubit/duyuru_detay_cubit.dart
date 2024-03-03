import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/repository/hastanedao_repository.dart';

class DuyuruDetayCubit extends Cubit<void> {
  DuyuruDetayCubit():super(0);

  var hrepo=HastaneDaoRepository();

  Future<void>guncelle (String idNumarasi,String baslik,String aciklama,String tarih) async{
    await hrepo.guncelle(idNumarasi, baslik, aciklama, tarih);
  }

}