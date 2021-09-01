import 'package:flutter/material.dart';
import 'package:quizmaker/services/database.dart';
import 'package:quizmaker/widgets/widgets.dart';

import 'Create_Quiz.dart';
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList(){
    return Container(
      child: StreamBuilder(
        stream: quizStream,
        builder: (context,snapshot){
          return snapshot.data == null ? Container(): ListView.builder(
            itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
              return QuizTile(
                  imgUrl: snapshot.data.documents[index].data["quizImgurl"],
                  title: snapshot.data.documents[index].data["quizTitle"],
                  desc: snapshot.data.documents[index].data["quizDesc"],

              );
              });
        },
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizData().then((val){
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
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
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz()
          ));
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  const QuizTile({Key key,@required this.imgUrl, @required this.title, @required this.desc}) : super(key: key);

  final String imgUrl,title,desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(imgUrl),
          Container(
            child: Column(
              children: [
                Text(title),
                Text(desc)
              ],
            ),
          )
        ],
      ),
    );
  }
}
