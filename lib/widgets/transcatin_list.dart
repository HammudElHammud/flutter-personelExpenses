import 'package:flutter/material.dart';
import '../models/transcation.dart';
import 'package:intl/intl.dart';


class TranscatinList extends StatelessWidget {
   final Function deleteTx;
  final List<Transaction> transcation ;
 TranscatinList(this.transcation,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return  transcation.isEmpty ? SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Its no Transcantion add yet'),
            Image.asset('assets/images/waiting.png'),
          ],
        ),
      ):
      ListView.builder(
        itemBuilder: (ctx, index) {
           return Card(
             elevation: 6,
             margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
             child: ListTile(
               leading: CircleAvatar(
                 radius: 30,
                 child:
                 Padding(
                   padding: EdgeInsets.all(7),
                   
                   child: FittedBox(

                       child: Text('\$${transcation[index].amount}')),
                 ),
               ),
               title: Text(transcation[index].title, style: Theme.of(context).textTheme.title,),
               subtitle:Text(DateFormat.yMMMd().format(transcation[index].date)) ,
               trailing: IconButton(icon: Icon(Icons.delete, ), color: Theme.of(context).errorColor, onPressed: () => deleteTx(transcation[index].id),),
             ),
           );
    },
      itemCount:transcation.length,

    );

  }
}
