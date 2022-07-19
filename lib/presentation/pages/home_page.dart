import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/home_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();
  @override
  void initState() {
    store.getPromotions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ValueListenableBuilder(
            valueListenable: store,
            builder: ((context, state, child) {
              if (state is LoadingHomeState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is SuccessHomeState) {
                return ListView.builder(
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(state.promotions[index].name),
                        )),
                    itemCount: state.promotions.length);
              }
              return const SizedBox.shrink();
            })));
  }
}
