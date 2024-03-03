class Haberler{
  String haberler_id;
  String haberler_baslik;
  String haberler_aciklama;
  String haberler_tarih;

  Haberler(
      { required this.haberler_id,
        required this.haberler_baslik,
        required this.haberler_aciklama,
        required this.haberler_tarih,});


  factory Haberler.fromJson(Map<dynamic,dynamic> json,String key){
    return Haberler(
        haberler_id: key,
        haberler_baslik: json["haberler_baslik"] as String,
        haberler_aciklama: json["haberler_aciklama"] as String,
        haberler_tarih: json["haberler_tarih"] as String
    );
  }
}