class Duyurular{
  String idNumarasi;
  String baslik;
  String aciklama;
  String tarih;

  Duyurular({
    required this.idNumarasi,
    required this.baslik,
    required this.aciklama,
    required this.tarih});


  factory Duyurular.fromJson(Map<dynamic,dynamic> json,String key){
    return Duyurular(
        idNumarasi: key,
        baslik: json["baslik"] as String,
        aciklama: json["aciklama"] as String,
        tarih: json["tarih"] as String
    );
  }
}
