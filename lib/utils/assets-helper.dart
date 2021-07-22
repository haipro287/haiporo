import 'package:flutter/services.dart';

Future myLoadAsset(String path) async {
  try {
    return await rootBundle.loadString(path);
  } catch(_) {
    return null;
  }
}