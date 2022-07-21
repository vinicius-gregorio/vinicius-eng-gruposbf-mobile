import 'package:dartz/dartz.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';

typedef GetCartCall = Future<Either<CartError, List<CartItem>>>;
typedef CheckoutCartCall = Future<Either<CartError, dynamic>>;
