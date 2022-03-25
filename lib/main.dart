import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/language/language_service.dart';
import 'package:localization_app/language/localization.dart';
import 'package:localization_app/login.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(DefaultApp());

  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();

  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class DefaultApp extends StatefulWidget {
  @override
  _DefaultAppState createState() => _DefaultAppState();
}

class _DefaultAppState extends State<DefaultApp> {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => widget.appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'Building app',
            debugShowCheckedModeBanner: false,
            locale: widget.appLanguage.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', ''),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color(0xFF5151E5),
              textTheme: TextTheme(
                headline6: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF171219),
                  height: 1.5,
                ),
                headline4: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
                subtitle1: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF171219),
                  height: 1.5,
                ),
                subtitle2: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF171219),
                  height: 1.5,
                ),
                headline3: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB8234F),
                  height: 1.5,
                ),
                caption: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF171219),
                  height: 1.5,
                ),
                headline2: TextStyle(
                    fontSize: 14, color: Color(0xFF171219), height: 1),
                overline: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7A7A7A),
                  letterSpacing: 0.1,
                  height: 1.5,
                ),
                headline1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
