import 'package:flutter/material.dart';
import 'package:quizmaker/helper/funtions.dart';
import 'package:quizmaker/services/auth.dart';
import 'package:quizmaker/views/HomeQM.dart';
import 'package:quizmaker/views/signin.dart';
import 'package:quizmaker/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name,email,password;

  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      authService.signInEmailAndPass(email, password).then((value) {
        if(value != null){
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedin: true);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home(),
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body:  _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val){return val.isEmpty ? "Enter correct name" : null;},
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (val){
                  name = val;
                },
              ),
              SizedBox(height: 5,),
              TextFormField(
                validator: (val){return val.isEmpty ? "Enter correct email id" : null;},
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 5,),
              TextFormField(
                obscureText: true,
                validator: (val){return val.isEmpty ? "Enter your password" : null;},
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  signUp();

                },
                child: blueButton(context: context,
                    label: "Sign Up")
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",style: TextStyle(fontSize: 15.5),),
                  GestureDetector(
                      onTap:(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                      } ,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 15.5,
                            decoration: TextDecoration.underline),
                      )
                  ),
                ],
              ),
              SizedBox(height: 80,),
            ],
          ),
        ),
      ),
    );
  }
}
