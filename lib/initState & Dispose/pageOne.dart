import 'package:flutter/material.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
   @override
  void initState() {
    print('InitState in page one');
    super.initState();
  }
    @override
  void dispose() {
    print("pageone deleted from the stack");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pageone'),),
      body: ListView(
        children: [
          MaterialButton(onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('home',(route) => false);
            },child: Text('Go To Home Page'),
          ),
          MaterialButton(onPressed: () {
              Navigator.of(context).pushNamed('pagetwo');
          }, child: Text('Go To PageTwo')),
        ],
      ),
    );
  }
}