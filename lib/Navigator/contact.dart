import 'package:flutter/material.dart';
import 'package:flutter_learning/Navigator/about_us.dart';
import 'package:flutter_learning/Navigator/homepage.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: ListView(
        children: [
          const Center(
            child: Text(
              'Contact Page',
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
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => AboutUs()));
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
                ).push(MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: const Text('Go To Home Page (push)'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Homepage()),
                  (route) => false,
                );
              },
              child: const Text('Go To Home Page (pushAndRemoveUntil)'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}
