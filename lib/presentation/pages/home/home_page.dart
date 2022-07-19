import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/home_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/home_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_app_bar/centauro_app_bar.dart';

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
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 104),
            child: CentauroAppBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
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
                })),
          )),
    );
  }
}
