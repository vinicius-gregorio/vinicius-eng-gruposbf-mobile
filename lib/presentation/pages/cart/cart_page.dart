import 'package:flutter/material.dart';

import '../../widgets/centauro_app_bar/centauro_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 104),
        child: CentauroAppBar(),
      ),
      body: Container(),
    );
  }
}
