import 'package:flutter/material.dart';
import 'package:google_pay_ui/components/transaction_screen/transaction.dart';

class Payment extends StatefulWidget {
  final name;

  final url;

  @override
  _PaymentState createState() => _PaymentState();
  const Payment({Key key, this.url, this.name}) : super(key: key);
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Icon(Icons.arrow_back),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.url),
                  radius: 30,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '7289675821',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    PaymentDone(pay: true),
                    PaymentDone(
                      pay: false,
                    ),
                    PaymentDone(pay: true),
                    PaymentDone(
                      pay: false,
                    ),
                    RequestToPay()
                  ],
                )),
            Footer(name: widget.name, image: widget.url)
          ],
        ));
  }
}

class RequestToPay extends StatelessWidget {
  const RequestToPay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Footer extends StatelessWidget {
  final name;
  final image;
  const Footer({Key key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(right: 5, left: 10),
              height: 40,
              width: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Transaction(name: name, image: image)));
                  },
                  child: Text("Pay"))),
          Container(
              height: 40,
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () {},
                  child: Text("Request"))),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Message....'),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.send)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDone extends StatefulWidget {
  final pay;

  const PaymentDone({Key key, this.pay}) : super(key: key);

  @override
  _PaymentDoneState createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  @override
  Widget build(BuildContext context) {
    print(widget.pay);
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: widget.pay ? 10 : 0),
      child: Align(
        alignment: widget.pay ? Alignment.topRight : Alignment.topLeft,
        child: Card(
          child: Container(
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 40, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    !widget.pay ? "Payment To you" : "Payment To Akshay",
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      '₹500',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text("Paid April 23"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
