import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/views/HomeQM.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:quizmaker/helper/funtions.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool _isLoggedin = false;
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }
  checkUserLoggedInStatus()async{
    HelperFunctions.getUserLoginDetails().then((value){
      setState(() {
        _isLoggedin = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedin ?? false) ? Home():SignIn(),
    );
  }
}
