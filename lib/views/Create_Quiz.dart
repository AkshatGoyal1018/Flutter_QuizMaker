import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';
class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();

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
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Quiz Image URL",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Quiz Title",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Quiz Description",
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
