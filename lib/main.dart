// import 'dart:ffi';

import 'package:final_project/ABookDetailPage.dart';
import 'package:final_project/ABookFormAddPage.dart';
import 'package:final_project/ABookFormEditPage.dart';
import 'package:final_project/homepage.dart';
import 'package:final_project/models/ABookModel.dart';
import 'package:final_project/loginPage.dart';
import 'package:final_project/RegisterPage.dart';
import 'package:final_project/services/ABookModelService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ABookModelService())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: "/login",
        routes: {
          '/': (context) => HomePage(),
          '/add': (context) => const ABookFormAddPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == "/detail") {
            ABookModel aBookModel = settings.arguments as ABookModel;

            return MaterialPageRoute(
              builder: (context) {
                return ABookDetailPage(aBookModel: aBookModel);
              },
            );
          }
          if (settings.name == "/edit") {
            ABookModel aBookModel = settings.arguments as ABookModel;

            return MaterialPageRoute(
              builder: (context) {
                return ABookFormEditPage(aBookModel: aBookModel);
              },
            );
          }
        },
      ),
    );
  }
}
