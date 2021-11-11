import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/controller/homepageContoller.dart';
import 'package:movie_app/view/AutenticationPage/login.page.dart';
import 'package:movie_app/view/HomePage/home.page.dart';
import 'package:movie_app/view/HomePage/homepage.helpers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageHelpers(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        )
      ],
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },
        title: 'Movies app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
