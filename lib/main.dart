import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/transcatin_list.dart';
import 'widgets/new_transcation.dart';
import 'package:fluttertestapp/models/transcation.dart';
import 'models/transcation.dart';
import 'package:intl/intl.dart';
import 'widgets/user_transcation.dart';
import 'widgets/user_transcation.dart';
import 'widgets/chart.dart';
import 'package:flutter/services.dart';

void main() {
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown,
//  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: ' Prosenel Expenese ',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',
        errorColor: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//  String TitleInput;
//  String AmountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  final TitleControler = TextEditingController();
//  final AmountControler = TextEditingController();
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
  List<Transaction> get _recentTransction {
    return _userTranscation.where((tx){
      return  tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }
  void _AddTranscation(String Title, double Amount, DateTime ChoseDate) {
    final NewTX = Transaction(
        title: Title,
        amount: Amount,
        date: ChoseDate,
        id: DateTime.now().toString());
    setState(
      () {
        _userTranscation.add(NewTX);
      },
    );
  }



  void _StartShowNewTranscation(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_AddTranscation),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
  void _deleteTranscation( String id){
    setState(() {
      _userTranscation.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar =  AppBar(
      title: Text(
        'Prosenel Expenese',
        style: TextStyle(fontFamily: 'Quicksand'),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _StartShowNewTranscation(context),
        ),
      ],
    );
    // TODO: implement build
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            Container(
//              width: double.infinity,
//              child: Card(
//                color: Colors.blue,
//                elevation: 5,
//                child: Text('char'),
//              ),
//            ),
            SingleChildScrollView(
                child: Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height  - MediaQuery.of(context).padding.top) *0.25 ,

                child: Chart(_userTranscation))),
//              UserTranscatins(),
            Container(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) *0.75 ,
                child: TranscatinList(_userTranscation,_deleteTranscation)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _StartShowNewTranscation(context),
      ),
    );
  }
}
