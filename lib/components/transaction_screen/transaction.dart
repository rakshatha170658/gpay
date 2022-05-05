import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_pay_ui/components/PaymentDone_Screen/payment_done.dart';

class Transaction extends StatefulWidget {
  final name;
  final image;
  const Transaction({Key key, this.name, this.image}) : super(key: key);
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  var rupees = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 150),
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.image),
                    radius: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.name,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    '8976542345',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        '₹',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 100,
                      child: TextField(
                        onChanged: (val) => {
                          setState(() => {rupees = val})
                        },
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (rupees == '') {
            SnackBar(content: Text("Please Enter At least 1Rs"));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentDone(
                          payment: rupees,
                          name: widget.name,
                        )));
          }
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
