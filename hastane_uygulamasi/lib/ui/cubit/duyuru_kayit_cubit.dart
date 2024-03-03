import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/repository/hastanedao_repository.dart';

class DuyuruKayitCubit extends Cubit<void>{
  DuyuruKayitCubit():super(0);


  var hrepo=HastaneDaoRepository();

  Future<void> kaydet (String baslik,String aciklama,String tarih) async{
    await hrepo.kaydet(baslik, aciklama, tarih);
  }


}