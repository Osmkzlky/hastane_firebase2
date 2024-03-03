import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hastane_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:hastane_uygulamasi/ui/cubit/duyuru_detay_cubit.dart';
import 'package:hastane_uygulamasi/ui/cubit/duyuru_kayit_cubit.dart';
import 'package:hastane_uygulamasi/ui/cubit/haber_detay_cubit.dart';
import 'package:hastane_uygulamasi/ui/cubit/haberler_goster_cubit.dart';
import 'package:hastane_uygulamasi/ui/cubit/haberler_kayit_cubit.dart';
import 'package:hastane_uygulamasi/ui/views/anasayfa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hastane_uygulamasi/ui/views/yonetici_giris.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AnasayfaCubit()),
        BlocProvider(create: (context)=>DuyuruKayitCubit()),
        BlocProvider(create: (context)=>DuyuruDetayCubit()),
        BlocProvider(create: (context)=>AnasayfaCubit()),
        BlocProvider(create: (context)=>HaberlerDetayCubit()),
        BlocProvider(create: (context)=>HaberlerGosterCubit()),
        BlocProvider(create: (context)=>HaberlerKayitCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: YoneticiGiris(),
      ),
    );
  }
}
