import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedTime;

  void _submetedData(){
    final Titlecont = titleController.text;
    final AmountCont = double.parse(amountController.text) ;
    if(Titlecont.isEmpty || AmountCont <= 0 || _selectedTime == null){
      return;
    }

    widget.addTx(
      Titlecont,
      AmountCont,
      _selectedTime,
    );
    Navigator.of(context).pop();
  }
  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()).then((picketDate){
      if(picketDate == null){
        return;
      }
       setState(() {
         _selectedTime = picketDate;

       });
    });

}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom +10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_)=> _submetedData() ,
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_)=> _submetedData(),
                // onChanged: (val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text( _selectedTime == null ? 'No Date Chosen !' : DateFormat.yMMMd().format(_selectedTime), style: TextStyle(fontWeight: FontWeight.bold),)),
                    FlatButton(child: Text( 'Chosen Date '),
                      onPressed: _presentDatePicker,
                      textColor: Theme.of(context).primaryColor,

                    )

                  ],

                ),
              ),
              RaisedButton(

                child: Text('Add Transaction'),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: _submetedData,
                hoverElevation:4 ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
