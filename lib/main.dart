import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/app.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/register_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  GetIt.I.isReady<SharedPreferences>().then((_) {
    runApp(const App());
  });
}
