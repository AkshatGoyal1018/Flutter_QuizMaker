import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key key}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question,option1,option2,option3,option4;

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
              validator: (val) => val.isEmpty ? "Enter Question" : null,
              decoration: InputDecoration(
                hintText: "Question",
              ),
              onChanged: (val){
                val = question;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Option1(Correct Answer)" : null,
              decoration: InputDecoration(
                hintText: "Option1 (Correct Answer)",
              ),
              onChanged: (val){
                val = option1;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Option" : null,
              decoration: InputDecoration(
                hintText: "Option2",
              ),
              onChanged: (val){
                val = option2;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Option" : null,
              decoration: InputDecoration(
                hintText: "Option3",
              ),
              onChanged: (val){
                val = option3;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Option" : null,
              decoration: InputDecoration(
                hintText: "Option4",
              ),
              onChanged: (val){
                val = option4;
              },
            ),
            Spacer(),
            Row(
              children: [
                blueButton(context: context,
                  label: "Submit",
                  buttonWidth:  MediaQuery.of(context).size.width/2 - 36
                ),
                SizedBox(width: 20,),
                blueButton(context: context,
                    label: "Add Question",
                    buttonWidth:  MediaQuery.of(context).size.width/2 - 36
                )
              ],
            ),
            SizedBox(height: 50,),
          ],),
        ),
      ),
    );
  }
}
