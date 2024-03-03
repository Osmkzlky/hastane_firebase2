import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hastane_uygulamasi/ui/views/yonetici_giris.dart';

class SifreSifirlama extends StatefulWidget {
  const SifreSifirlama({super.key});

  @override
  State<SifreSifirlama> createState() => _SifreSifirlamaState();
}

class _SifreSifirlamaState extends State<SifreSifirlama> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword(BuildContext context) async {
    String email = _emailController.text.trim();
    if (email.isNotEmpty) {
      try {
        await _auth.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF1C70A8),
          content:
          Text("Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.",style: TextStyle(fontWeight: FontWeight.bold)),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFFC50A0A),
          content: Text(
              "Şifre sıfırlama bağlantısı gönderilemedi. Lütfen tekrar deneyin.",style: TextStyle(fontWeight: FontWeight.bold)),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFFC50A0A),
        content: Text("Lütfen e-posta adresinizi girin.",style: TextStyle(fontWeight: FontWeight.bold)),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifre Sıfırlama"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline, color: Color(0xFF1C70A8)),
                labelText: "E-posta",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Color(0xFF1C70A8)),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _resetPassword(context),
                child: Text(
                  "Şifremi Sıfırla",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Agbalumo", fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Color(0xFF1C70A8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
