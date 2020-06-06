import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  LayoutBuilder(builder: (ctx, constraints ){

      return   Column(
        children: <Widget>[
          Container(
            height:  constraints.maxHeight * 0.15,
            child: FittedBox(

                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),),
          ),
          Container(
              height:  constraints.maxHeight * 0.10,
              child: SizedBox(
                height: 4,
              )),
          Container(
            height: constraints.maxHeight * 0.5 ,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  height:  constraints.maxHeight * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    height:  constraints.maxHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height:  constraints.maxHeight * 0.03,
          ),
          Container(
            height:  constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text(label)),
          ),
        ],
      );
    },);

  }
}
