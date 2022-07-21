import 'dart:developer';

import 'package:flutter/foundation.dart';

void appLog(String message) {
  if (kDebugMode) {
    log(message);
  }
}
