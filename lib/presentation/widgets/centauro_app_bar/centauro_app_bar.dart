import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/appbar_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/appbar_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_app_bar/components/cart_icon.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_app_bar/components/search_input.dart';

class CentauroAppBar extends StatefulWidget {
  const CentauroAppBar({Key? key, required this.cartLength}) : super(key: key);
  final double cartLength;

  @override
  State<CentauroAppBar> createState() => _CentauroAppBarState();
}

class _CentauroAppBarState extends State<CentauroAppBar> {
  final AppBarStore store = GetIt.I.get<AppBarStore>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.getCartLength();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: store,
        builder: (context, state, child) {
          return Material(
            elevation: 2,
            child: Container(
              height: 104,
              width: double.infinity,
              color: AppColors.redBackground,
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SvgPicture.asset(AppImages.centauroLogoWhite),
                          ),
                          Expanded(child: Container()),
                          if (state is SuccessAppBarState)
                            CartIcon(
                              cartLength: state.cartLength,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SearchInput(),
                ],
              ),
            ),
          );
        });
  }
}
