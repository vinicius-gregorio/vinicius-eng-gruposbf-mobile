import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';

import '../../domain/entities/promotion.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Promotion> promotions = [];
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    var service = GetIt.I.get<GetPromotionsUsecase>();
    var fold = await service();
    promotions = fold.fold((l) => [], (r) => r);
    setState(() {});
    log(promotions.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: ((context, index) => ListTile(
                  title: Text(promotions[index].name),
                )),
            itemCount: promotions.length),
      ),
    );
  }
}
