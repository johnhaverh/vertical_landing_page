import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:vertical_landing_page/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Flurorouter.configureRoutes();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing page App',
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
      //home: 
    );
  }
}