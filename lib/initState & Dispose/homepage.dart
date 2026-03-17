import 'package:flutter/material.dart';

class HomeinitState extends StatefulWidget {
  const HomeinitState({super.key});

  @override
  State<HomeinitState> createState() => _HomeinitStateState();
}

class _HomeinitStateState extends State<HomeinitState> {
   @override
  void initState() {
    print('InitState in Home page');
    super.initState();
  }
    @override
  void dispose() {
    print("Homepage deleted from the stack");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Initial State & Dispose')),
      body: ListView(
        children: [
          MaterialButton(onPressed: () {
              Navigator.of(context).pushNamed('pageone');
            },child: Text('Go To PageOne'),
          ),
          MaterialButton(onPressed: () {
              Navigator.of(context).pushNamed('pagetwo');
          }, child: Text('Go To PageTwo')),
        ],
      ),
    );
  }
}
