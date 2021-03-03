import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'en_US.dart';

//helper class if our app needs language changes according to locale
class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
      };
}
