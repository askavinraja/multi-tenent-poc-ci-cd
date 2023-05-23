import 'package:flutter_dotenv/flutter_dotenv.dart';
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
