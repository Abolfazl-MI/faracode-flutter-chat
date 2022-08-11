import 'package:faracode_flutter_chat/Components/app_bar.dart';
import 'package:faracode_flutter_chat/ConstantS/my_colors.dart';
import 'package:faracode_flutter_chat/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'gen/fonts.gen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: MyColors.systemNavigationBar,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor:  MyColors.systemNavigationBar,
        systemNavigationBarIconBrightness: Brightness.dark
        ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'faracode flutter chat',
      theme: ThemeData(
         fontFamily: FontFamily.roboto,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: FontFamily.roboto,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),),

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
       
        body: MainScreen()
      ),
    );
  }
}
