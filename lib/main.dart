import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/app.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/register_dependencies.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();

  runApp(const App());
}
