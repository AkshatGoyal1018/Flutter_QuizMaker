import 'package:flutter/material.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {

  const AddQuestion({Key key, this.quizId}) : super(key: key);
  final String quizId;


  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  final _formKey = GlobalKey<FormState>();
  String question,option1,option2,option3,option4;
  bool _isLoading = false;
  DatabaseService databaseService = new DatabaseService();

  uploadQuestionData() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      Map<String,String> questionMap = {
        "question" : question,
        "option1" : option1,
        "option2" : option2,
        "option3" : option3,
        "option4" : option4
      };
      await databaseService.addQuestionData(questionMap, widget.quizId).then((value){
        setState(() {
          _isLoading = false;
        });
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
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Form(
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
                question = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Correct Option" : null,
              decoration: InputDecoration(
                hintText: "Option1 (Correct Answer)",
              ),
              onChanged: (val){
                option1 = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Option" : null,
              decoration: InputDecoration(
                hintText: "Option2",
              ),
              onChanged: (val){
                option2 = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Option" : null,
              decoration: InputDecoration(
                hintText: "Option3",
              ),
              onChanged: (val){
                option3 = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter the Option" : null,
              decoration: InputDecoration(
                hintText: "Option4",
              ),
              onChanged: (val){
                option4 = val;
              },
            ),
            Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: blueButton(context: context,
                    label: "Submit",
                    buttonWidth:  MediaQuery.of(context).size.width/2 - 36
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    uploadQuestionData();
                  },
                  child: blueButton(context: context,
                      label: "Add Question",
                      buttonWidth:  MediaQuery.of(context).size.width/2 - 36
                  ),
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
