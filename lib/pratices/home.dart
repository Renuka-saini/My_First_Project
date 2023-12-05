import 'package:flutter/material.dart';

void main() {
  runApp(MyUI());
}

class MyUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AmountEntryScreen(),
    );
  }
}

class AmountEntryScreen extends StatefulWidget {
  @override
  State<AmountEntryScreen> createState() => _AmountEntryScreenState();
}

class _AmountEntryScreenState extends State<AmountEntryScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _discountController = TextEditingController();
  TextEditingController _discountAmountController = TextEditingController(); // Controller for discount amount

  double discountPercentage = 0.0;
  double discountAmount = 0.0;
  double amountAfterDiscount = 0.0;
  double gstPercentage = 0.18;
  double gstAmount = 0.0;
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text(
          'Enter Amount',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))
                ),
                onChanged: (value) {
                  calculateAmounts();
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child:Column(children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _discountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Enter Discount Percentage',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))
                    ),
                    onChanged: (value) {
                      setState(() {
                        discountPercentage = double.tryParse(value) ?? 0.0;
                        calculateDiscountAmount();
                        calculateAmounts();
                      });
                    },
                  ),
                  ],)),
               
              SizedBox(width: 20),
              Expanded(child: Column(children:[
              TextField(
                style: TextStyle(color: Colors.white),
                controller: _discountAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: 'Enter Discount Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))
                ),
                onChanged: (value) {
                  setState(() {
                    discountAmount = double.tryParse(value) ?? 0.0;
                    calculateDiscountPercentage();
                    calculateAmounts();
                  });
                },
              ),
              ],)),
               ],
              ),
              
              //SizedBox(height: 20),
              //Text('Discount Amount: $discountAmount', style: TextStyle(fontSize: 15,color: Colors.white)),
              SizedBox(height: 10),
              Text('Amount After Discount: $amountAfterDiscount', style: TextStyle(fontSize: 15,color: Colors.white)),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(border:Border.all(color: Color.fromARGB(168, 255, 255, 255)),borderRadius:BorderRadius.circular(8.0)),
                    height: 55.0,
                  
                    child: Row(
                      children: [
                        Text('GST : 18%', style: TextStyle(fontSize: 15,color: Colors.white)),
                        SizedBox(width: 25),
                        Text('Amount After GST: $gstAmount', style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Total Amount: $totalAmount', style: TextStyle(fontSize: 20,color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateDiscountAmount() {
    String enteredAmount = _amountController.text.trim();
    if (enteredAmount.isNotEmpty) {
      double originalAmount = double.tryParse(enteredAmount) ?? 0.0;
      discountAmount = originalAmount * (discountPercentage / 100);
      _discountAmountController.text = discountAmount.toString();
    }
  }

  void calculateDiscountPercentage() {
    String enteredAmount = _amountController.text.trim();
    if (enteredAmount.isNotEmpty) {
      double originalAmount = double.tryParse(enteredAmount) ?? 0.0;
      discountPercentage = (discountAmount / originalAmount) * 100;
      _discountController.text = discountPercentage.toString();
    }
  }

  void calculateAmounts() {
    String enteredAmount = _amountController.text.trim();

    if (enteredAmount.isNotEmpty) {
      double originalAmount = double.tryParse(enteredAmount) ?? 0.0;
      amountAfterDiscount = originalAmount - discountAmount;
      gstAmount = amountAfterDiscount * gstPercentage;
      totalAmount = amountAfterDiscount + gstAmount;
    } else {
      discountAmount = 0.0;
      amountAfterDiscount = 0.0;
      gstAmount = 0.0;
      totalAmount = 0.0;
    }
    setState(() {});
  }
}