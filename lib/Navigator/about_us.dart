import 'package:flutter/material.dart';
// import 'package:flutter_learning/Navigator/contact.dart';
import 'package:flutter_learning/Navigator/homepage.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: ListView(
        children: [
          const Center(
            child: Text(
              'AboutUs Page',
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
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Contact(),));
                // routeNamed طريقة ال
                Navigator.of(context).pushReplacementNamed('contact');
              },
              child: const Text('Go To Contact Page (pushReplacement)'),
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
                Navigator.of(context).pop();
              },
              child: const Text('Back (pop)'),
            ),
          ),
        ],
      ),
    );
  }
}
