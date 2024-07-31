import 'package:flutter/material.dart';
import 'package:flutter_application_11_quiz_app/components/custom_button.dart';
import 'package:flutter_application_11_quiz_app/components/question_text.dart';
import 'package:flutter_application_11_quiz_app/components/questuon_result.dart';
import 'package:flutter_application_11_quiz_app/source.dart/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List <bool> results = <bool>[];
// final currentQuestion = questions.entries.first;
int currentIndex = 0;

void _checkanswer({required bool value}) {
  if (questions.values.elementAt( currentIndex) == value){
    results.add(true);
  } else {
    results.add(false);
  }
  if(questions.length == currentIndex+1){
    final tuuraJooptor = results.where((e) => e == true).toList();
    showDialog(
      context: context, 
      builder: (context) => AlertDialog.adaptive(
        title:  const Text('Test jyiyntyktaldy :)',
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,),
        content: Text('${tuuraJooptor.length}/${questions.length}',
        style: const TextStyle(fontSize: 16,),
        textAlign: TextAlign.center,),
        actions: [
          TextButton(
            onPressed: () {
              currentIndex = 0;
              results.clear();
              Navigator.pop(context);
              setState(() {
                
              });
            }, 
            child:  const Text('Kaira bashtoo',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,))
        ],
      ),
      );

  }else{
     currentIndex++;
  }

 
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Тапшырма 7'),
        
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             QuestionText(text: questions.keys.elementAt(currentIndex),),
            const SizedBox(height: 80,),
            CustomButton(
              color: Colors.green, 
              text: 'Tуура',
              onPressed: () {
                _checkanswer(value: true,);
              },),
              // ignore: prefer_const_constructors
              SizedBox(height: 30,),
            CustomButton(
              color: Colors.red, 
              text: 'Tуура эмес',
              onPressed: () {
                _checkanswer(value: false,);
              },
              ),
              const SizedBox(height: 60,),
               QuestionResult(
                results: results,
              ),
        
          ],
        ),
      ),
    );
  }
}






