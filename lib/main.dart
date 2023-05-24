// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'themes.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:whitelabel/stringtohex.dart';
import 'gettheme.dart';

String? themeStr;

Future main() async {
  // themeStr = await rootBundle.loadString('assets/config/red.json');
  await GlobalConfiguration()
      .loadFromMap({"appName": "RUN-Loyal", "brandColor": "fff"});
  await dotenv.load(fileName: "assets/client.env");
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: theme.primaryColor,
          scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
          fontFamily: theme.fontFamily,
          brightness: Brightness.dark),
      // theme: theme,
      title: 'Development',
      home: Scaffold(
        appBar: theme.kShowAppBar
            ? AppBar(title: Text(theme.kStatusBarHeader))
            : null,
        body: Center(
          child: Container(
            decoration: theme.kGradientStyle,
            // child: Text(AppConfig.of(context).buildFlavor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  theme.kMainHeader,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/hero.png',
                  width: 180.0,
                  height: 180.0,
                ),
                Text(
                  theme.kSubHeader,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  GlobalConfiguration().getString('appName') +
                      "Color ${GlobalConfiguration().getString("brandColor")}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: convertToColor(
                          GlobalConfiguration().getString("brandColor"))),
                ),
                Text(
                  'FONT NAME ${dotenv.get('FONT_NAME', fallback: 'Montserrat')}\nGLOBAL VAR ${fontName}',
                ),
                Text(
                  'FONT URL ${dotenv.get('FONT_URL', fallback: 'Montserrat')}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
