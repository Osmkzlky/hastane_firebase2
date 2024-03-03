import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/repository/haberlerdao_repository.dart';

class HaberlerKayitCubit extends Cubit<void>{
  HaberlerKayitCubit():super(0);

  var hasrepo=HaberlerDaoRepository();

  Future<void> kaydet (String haberler_baslik,String haberler_aciklama,String haberler_tarih) async{
    await hasrepo..kaydet(haberler_baslik, haberler_aciklama, haberler_tarih);
  }

}