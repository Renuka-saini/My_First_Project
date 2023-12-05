import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  double amount = 0;
  double discount = 0;
  double gst = 0;
  double totalAmount = 0;

  

  void calculateTotalAmount() {
    setState(() {
      totalAmount = amount + amount * (gst / 100) - discount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                amount = double.parse(value);
              });
              calculateTotalAmount();
            },
            decoration: InputDecoration(
                hintText: 'Enter Amount',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Enter Amount',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                discount = double.parse(value);
              });
              calculateTotalAmount();
            },
            decoration: InputDecoration(
                hintText: 'Enter Discount',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Enter Discount',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                gst = double.parse(value);
                
              });
              calculateTotalAmount();
            },
            decoration: InputDecoration(
                hintText: 'Enter GST',
                hintStyle: TextStyle(color: Colors.white),
                labelText: 'Enter GST',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          
          Text(
            'Total Amount: $totalAmount',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ));
  }
}
