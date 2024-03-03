import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/data/repository/haberlerdao_repository.dart';


class HaberlerDetayCubit extends Cubit<void>{
  HaberlerDetayCubit():super(0);

  var hasrepo=HaberlerDaoRepository();

  Future<void>guncelle (String haberler_id,String haberler_baslik,String haberler_aciklama,String haberler_tarih) async{
    await hasrepo.guncelle(haberler_id, haberler_baslik, haberler_aciklama, haberler_tarih);
  }

}