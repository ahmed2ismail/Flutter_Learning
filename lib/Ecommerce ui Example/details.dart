import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data;
  const ItemDetails({super.key, this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.deepOrange,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '.'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '.',
          ),
        ],
      ),
      endDrawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[30]),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopify_sharp, size: 30),
            Text(' Gipsy', style: TextStyle(color: Colors.black)),
            Text(' Bee', style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 25),
            height: 280,
            color: Colors.grey[200],
            child: Icon(widget.data['iconName'], size: 200),
          ),
          Text(
            widget.data['title'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.data['subtitle'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 17),
          Text(
            widget.data['price'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 13),
          Row(
            children: [
              Text(
                '               Color:    ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 139, 129, 129),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.circle),
                color: Colors.amber,
              ),
              Text(
                'Amber     ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 139, 129, 129),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.circle),
                color: Colors.black,
              ),
              Text(
                'Black',
                style: TextStyle(
                  color: const Color.fromARGB(255, 139, 129, 129),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '               Size: ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 139, 129, 129),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('39', style: TextStyle(fontSize: 15)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('40', style: TextStyle(fontSize: 15)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('41', style: TextStyle(fontSize: 15)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('42', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 85, vertical: 15),
            child: MaterialButton(
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
              child: Text('< Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
