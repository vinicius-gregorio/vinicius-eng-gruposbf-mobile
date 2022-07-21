import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.buttonText, required this.onPressed}) : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.redBackground,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
