import 'package:flutter/material.dart';

class PromotionCardColors extends StatelessWidget {
  const PromotionCardColors({Key? key, required this.quantityOfColors}) : super(key: key);
  final int quantityOfColors;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.grey,
      ),
      child: Center(child: Text('$quantityOfColors cores', style: const TextStyle(fontSize: 12))),
    );
  }
}
