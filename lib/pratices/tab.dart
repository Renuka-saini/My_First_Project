import 'package:flutter/material.dart';

class MyTabbedUI extends StatefulWidget {
  @override
  _MyTabbedUIState createState() => _MyTabbedUIState();
}

class _MyTabbedUIState extends State<MyTabbedUI> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tabbed UI'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Enter Amount'),
            Tab(text: 'Discount'),
            Tab(text: 'Amount after Discount'),
            Tab(text: 'GST'),
            Tab(text: 'Total Amount'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First Tab: Enter Amount
          Container(
            child: Center(
              child: Text('Enter Amount'),
            ),
          ),
          // Second Tab: Discount
          Container(
            child: Center(
              child: Text('Discount'),
            ),
          ),
          // Third Tab: Amount after Discount
          Container(
            child: Center(
              child: Text('Amount after Discount'),
            ),
          ),
          // Fourth Tab: GST
          Container(
            child: Center(
              child: Text('GST'),
            ),
          ),
          // Fifth Tab: Total Amount
          Container(
            child: Center(
              child: Text('Total Amount'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyTabbedUI(),
  ));
}