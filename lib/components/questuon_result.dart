import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult({
    required this.results,
    super.key,


  });
  final List <bool>results;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: results.map(
      (result) {
    if(result) {
     return const Icon(
      Icons.check, 
      color: Colors.green,
      );
      } else {
        return const Icon(
          Icons.close, 
          color: Colors.red,
          );
      }
      },
    ).toList(),
    );
  }
  }