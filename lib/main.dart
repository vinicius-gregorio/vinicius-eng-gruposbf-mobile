import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/app.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/register_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();

  runApp(const App());
}
