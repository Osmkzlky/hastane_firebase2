import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastane_uygulamasi/ui/views/(sil)sifre_kayit.dart';
import 'package:hastane_uygulamasi/ui/views/anasayfa.dart';
import 'package:hastane_uygulamasi/ui/views/sifre_s%C4%B1f%C4%B1rlama.dart';

class YoneticiGiris extends StatefulWidget {
  const YoneticiGiris({super.key});

  @override
  State<YoneticiGiris> createState() => _YoneticiGirisState();
}

class _YoneticiGirisState extends State<YoneticiGiris> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  height: height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/hospital_giris.png"),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bilgileri Eksiksiz Doldurunuz";
                      }
                      return null; // Geçerli olduğunda null döndürür
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline, color: Color(0xFF1C70A8)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "E-posta",
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Color(0xFF1C70A8)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bilgileri Eksiksiz Doldurunuz";
                      }
                      return null; // Geçerli olduğunda null döndürür
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF1C70A8)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Şifre",
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Color(0xFF1C70A8)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        try {
                          var userResult = await firebaseAuth.signInWithEmailAndPassword(
                              email: email,
                              password: password
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Anasayfa()));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color(0xFFC50A0A),
                            content: Text(
                              "Email veya şifre yanlış. Lütfen tekrar deneyin.",style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ));
                        }
                      }
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Agbalumo",
                          fontSize: 25
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        backgroundColor: Color(0xFF1C70A8)
                    ),
                  ),

                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SifreSifirlama()));
                    },
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(color: Color(0xFF406A9B)),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SifreKayit()));
                    },
                    child: Text(
                      "Kaydol",
                      style: TextStyle(color: Color(0xFF406A9B)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
