import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastane_uygulamasi/ui/views/yonetici_giris.dart';

class SifreKayit extends StatefulWidget {
  const SifreKayit({super.key});

  @override
  State<SifreKayit> createState() => _SifreKayitState();
}

class _SifreKayitState extends State<SifreKayit> {
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
                      prefixIcon: Icon(Icons.person, color: Color(0xFF406A9B)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "E-posta",
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Color(0xFF406A9B)),
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
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF406A9B)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Color(0xFF406A9B)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                          formkey.currentState!.save();
                          var userResult = await firebaseAuth
                              .createUserWithEmailAndPassword(
                              email: email, password: password);
                          formkey.currentState!.reset();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Kullanıcı başarı ile kaydoldu. Giriş sayfasına yonlendiriliyorsunuz..."),
                          )
                          );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> YoneticiGiris( )));
                        }
                        catch (e) {
                          print(e.toString());
                        }
                      }
                      else {}
                    },
                    child: Text(
                      "Kayıt Et",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Agbalumo",
                          fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor: Color(0xFF406A9B)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
