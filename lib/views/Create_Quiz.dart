import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/views/addQuestion.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';
class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription,quizId;
  bool _isLoading = false;
  
  DatabaseService databaseService = new DatabaseService();
  
  createQuizOnline()async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      
      quizId = randomAlphaNumeric(16);
      Map<String,String> quizMap = {
        "quizId" : quizId,
        "quizImgurl" : quizImageUrl,
        "quizTitle" : quizTitle,
        "quizDesc" : quizDescription
      };
      await databaseService.addQuizData(quizMap, quizId).then((value){
        setState(() {
          _isLoading = false;
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuestion()
          ));
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
            GestureDetector(
                onTap: (){
                  createQuizOnline();
                },
                child: blueButton(context: context,
                    label: "Create Quiz")
            ),
            SizedBox(height: 50,),
          ],),
        ),
      ),
    );
  }
}
