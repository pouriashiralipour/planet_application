import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './screens/on_boarding_screen.dart';
import 'utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);
        return MaterialApp(
          title: 'Planet Application',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('fa')],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Shabnam',
            primaryColor: Color(0xFF296E48),
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Color(0xFF296E48)),
          ),
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
