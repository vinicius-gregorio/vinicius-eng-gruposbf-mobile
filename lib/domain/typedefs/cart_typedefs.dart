import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';

typedef GetCartCall = Future<Either<CartError, List<String>>>;
typedef CheckoutCartCall = Future<Either<CartError, Response>>;
