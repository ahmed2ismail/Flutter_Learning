import 'package:flutter/material.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});

  @override
  State<Pagetwo> createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  @override
  void initState() {
    print('InitState in page two');
    super.initState();
  }
    @override
  void dispose() {
    print("pagetwo deleted from the stack");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pagetwo')),
      body: ListView(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('pageone');
            },
            child: Text('Go To PageOne'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('home', (route) => false);
            },
            child: Text('Go To Home Page'),
          ),
        ],
      ),
    );
  }
}
