import 'package:dartz/dartz.dart';

import '../entities/promotion.dart';
import '../errors/promotion_error.dart';

typedef GetPromotionsCall = Future<Either<PromotionException, List<Promotion>>>;
