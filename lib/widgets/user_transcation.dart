import 'package:flutter/material.dart';
import 'transcatin_list.dart';
import 'new_transcation.dart';
import '../models/transcation.dart';
import 'new_transcation.dart';
import 'package:fluttertestapp/main.dart';

class UserTranscatins extends StatefulWidget {
  @override
  _UserTranscatinsState createState() => _UserTranscatinsState();
}

class _UserTranscatinsState extends State<UserTranscatins> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final List<Transaction> _userTranscation = [
//    Transaction(
//      id: 't1',
//      title: 'new',
//      amount: 99.8,
//      date: DateTime.now(),
//
//    ),
//    Transaction(
//      id: 't2',
//      title: 'newTran',
//      amount: 55.9,
//      date: DateTime.now(),
//    )

  ];
  void _AddTranscation(String Title, double Amount){
    final NewTX = Transaction(title: Title,amount: Amount,date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
    _userTranscation.add(NewTX);

    },);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_AddTranscation),
//        TranscatinList(_userTranscation),
      ],
    );
  }
}
