import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';
class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(children: [
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Image URL for the quiz" : null,
              decoration: InputDecoration(
                hintText: "Quiz Image URL",
              ),
              onChanged: (val){
                quizImageUrl = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Title for the quiz" : null,
              decoration: InputDecoration(
                hintText: "Quiz Title",
              ),
              onChanged: (val){
                quizTitle = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter quiz description" : null,
              decoration: InputDecoration(
                hintText: "Quiz Description",
              ),
              onChanged: (val){
                quizDescription = val;
              },
            ),
            Spacer(),
            blueButton(context, "Create Quiz"),
            SizedBox(height: 50,),
          ],),
        ),
      ),
    );
  }
}
