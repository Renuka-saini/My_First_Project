import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
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

class AmountEntryScreenState {
}

class _AmountEntryScreenState extends State<AmountEntryScreen> {
  TextEditingController _amountController = TextEditingController();
  double discountPercentage = 0.2; // 20% discount
  double gstPercentage = 0.18; // 18% GST
  double discountAmount = 0.0;
  double amountAfterDiscount = 0.0;
  double gstAmount = 0.0;
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal[900],
        title: Text('Enter Amount',style:TextStyle(fontSize:25,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Amount',),
              onChanged: (value) {
                setState(() {
                  String enteredAmount = value.trim();

                  if (enteredAmount.isNotEmpty) {
                    double originalAmount = double.tryParse(enteredAmount) ?? 0.0;
                    discountAmount = originalAmount * discountPercentage;
                    amountAfterDiscount = originalAmount - discountAmount;
                    gstAmount = amountAfterDiscount * gstPercentage;
                    totalAmount = amountAfterDiscount + gstAmount;
                  } else {
                    discountAmount = 0.0;
                    amountAfterDiscount = 0.0;
                    gstAmount = 0.0;
                    totalAmount = 0.0;
                  }
                });
              },
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Discount : 20%',style:TextStyle(fontSize:15,),),
                    SizedBox(width:25),
                    Text('Discount Amount: $discountAmount',style:TextStyle(fontSize:15,),),
                    SizedBox(width:25),
                    Text('amountafterdiscount: $amountAfterDiscount',style:TextStyle(fontSize:15,),),
                  ],
                ),
                SizedBox(height:30,),
                Row(
                  children: [
                    Text('GST : 18%',style:TextStyle(fontSize:15,),),
                    SizedBox(width:25),
                    Text('Amount After GST: $gstAmount',style:TextStyle(fontSize:15,),),
                  ],
                ),
                SizedBox(height:40,),
                Row(
                  children: [
                    Text('Total Amount: $totalAmount',style:TextStyle(fontSize:20,),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}