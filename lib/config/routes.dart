import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/cart_page.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/home/home_page.dart';

final routes = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomePage()),
  '/cart': (_) => const MaterialPage(child: CartPage()),
});
