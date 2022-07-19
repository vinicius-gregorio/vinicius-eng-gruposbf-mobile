import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/home_page.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/splash_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SBF Challenge',
      home: SplashPage(),
    );
  }
}
