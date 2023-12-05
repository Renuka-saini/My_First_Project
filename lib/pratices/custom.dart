import 'package:flutter/material.dart';

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI> {
  double amount = 0.0;
  double discountPercentage = 0.0;
  double amountDiscount = 0.0;
  double amountAfterDiscount = 0.0;
  double gst = 18.0;
  double totalAmount = 0.0;

  void calculateAmountDiscount(){
    setState(() {
      amountDiscount=(amount*discountPercentage)/100;
      amountAfterDiscount=amount-amountDiscount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom UI'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Amount'),
              onChanged: (value) {
                setState(() {
                  amount = double.parse(value);
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Discount Percentage'),
              onChanged: (value) {
                setState(() {
                  discountPercentage = double.parse(value);
                  
                  amountDiscount = (amount * discountPercentage)/100;
                  //amountAfterDiscount = amount-amountDiscount;
                  //totalAmount=amountAfterDiscount+(amountAfterDiscount*gst/100);
                });
              },
            ),
            
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount Discount'),

              
              onChanged: (value) {
                setState(() {
                  amountDiscount = double.parse(value);
                  discountPercentage= (amount * discountPercentage)/100;
                  amountAfterDiscount = amount-amountDiscount;
                  totalAmount=amountAfterDiscount+(amountAfterDiscount*gst/100);
                });
              },
            ),
            //Text('Amount discount:$amountDiscount'),
            Text('Amount After Discount: $amountAfterDiscount'),
            Text('gst:$gst'),
           // TextField(
             // keyboardType: TextInputType.number,
             // decoration: InputDecoration(labelText: 'Enter GST'),
             // onChanged: (value) {
               // setState(() {
               //   gst = double.parse(value);
               //   totalAmount = amountAfterDiscount + (amountAfterDiscount * gst / 100);
               // });
            //  },
            //),
            Text('Total Amount: $totalAmount'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyCustomUI(),
  ));
}
