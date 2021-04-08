import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:payment_and_cart/views/home.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _bottomNavIndex = 0;
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My Cart'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.payment_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                })
          ]),
      body: Center(
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.medical_services_outlined,
                      color: Colors.lightGreen,
                    ),
                    title: Text('paracetamol'),
                    trailing: SizedBox(
                      width: 120,
                      child: NumberInputPrefabbed.roundedButtons(
                        controller: myController,
                        incDecBgColor: Colors.amber,
                        buttonArrangement: ButtonArrangement.incLeftDecRight,
                        min: 0,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_rounded),
            label: 'Order',
          ),
        ],
        currentIndex: _bottomNavIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
