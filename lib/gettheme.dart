import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:global_configuration/global_configuration.dart';
// import 'package:json_theme/json_theme.dart';
import 'main.dart';
import 'themes.dart';

var fontName = "Font";

AppTheme getTheme() {
  final client = dotenv.get('CLIENT', fallback: 'dev');
  final fontname = dotenv.get('FONT_NAME', fallback: 'Montserrat');
  fontName = fontname;
  var theme = themeDev;

  switch (client) {
    case "dev":
      theme = themeDev;
      break;
    case "qa":
      theme = themeQA;
      break;
    case "001":
      theme = theme_001;
      break;
    case "002":
      theme = theme_002;
      break;
    case "003":
      theme = theme_003;
      break;
  }

  return theme;
}

String? getConfig(String key) {
  if (key != null) {
    // var value = GlobalConfiguration().get(key);
    // return value;

  }
}
