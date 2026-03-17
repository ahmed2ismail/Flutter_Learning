import 'package:flutter/material.dart';
// import 'package:flutter_learning/Navigator/about_us.dart';
import 'package:flutter_learning/Navigator/contact.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator')),
      body: ListView(
        children: [
          const Center(
            child: Text(
              'HomePage',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                // الطريقة دي او
                // Navigator.of(context,).push(MaterialPageRoute(builder: (context) => AboutUs()));
                // routeNamed طريقة ال
                Navigator.of(context).pushNamed('about us');
              },
              child: const Text('Go To AboutUs Page (push)'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Contact()));
              },
              child: const Text('Go To Contact Page (push)'),
            ),
          ),
        ],
      ),
    );
  }
}
