import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/provides/space_provider.dart';
import 'package:kosan_flutter_firebase/screens/home_screen.dart';
import 'package:kosan_flutter_firebase/screens/splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( create : (context) => SpaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
      ),
    );
  }
}

