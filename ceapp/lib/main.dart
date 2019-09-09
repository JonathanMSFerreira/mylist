import 'package:flutter/material.dart';
import 'package:ceapp/ui/CeAppPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Vaga',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,  ],
      supportedLocales: [
        const Locale('pt', 'BR'), ],
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: CeAppPage(),
    );
  }
}
