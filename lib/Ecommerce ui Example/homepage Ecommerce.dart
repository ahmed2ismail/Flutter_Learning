import 'package:flutter/material.dart';
import 'package:flutter_learning/Ecommerce%20ui%20Example/details.dart';

class HomepageEcommerce extends StatefulWidget {
  const HomepageEcommerce({super.key});

  @override
  State<HomepageEcommerce> createState() => _HomepageEcommerceState();
}

class _HomepageEcommerceState extends State<HomepageEcommerce> {
  List categories = [
    {'iconName': Icons.shopify_outlined, 'title': 'shop'},
    {'iconName': Icons.laptop, 'title': 'laptop'},
    {'iconName': Icons.electric_bike, 'title': 'electric bike'},
    {'iconName': Icons.hot_tub, 'title': 'Hobbies'},
    {'iconName': Icons.electric_car, 'title': 'electric car'},
  ];
  List bestSelling = [
    {
      'iconName': Icons.headset_mic_rounded,
      'title': 'Logitech G 231',
      'subtitle': 'apple headphone',
      'price': "35.9 \$",
    },
    {
      'iconName': Icons.watch_outlined,
      'title': 'Apple Watch S4',
      'subtitle': 'Smart Watch',
      'price': "499.9 \$",
    },
    {
      'iconName': Icons.monitor_rounded,
      'title': 'Amoled monitor V7',
      'subtitle': 'Smart monitor',
      'price': "6599.9 \$",
    },
    {
      'iconName': Icons.headset_mic_rounded,
      'title': 'Logitech G 231',
      'subtitle': 'apple headphone',
      'price': "35.9 \$",
    },
    {
      'iconName': Icons.watch_outlined,
      'title': 'Apple Watch S4',
      'subtitle': 'Smart Watch',
      'price': "499.9 \$",
    },
    {
      'iconName': Icons.monitor_rounded,
      'title': 'Amoled monitor V7',
      'subtitle': 'Smart monitor',
      'price': "6599.9 \$",
    },
  ];

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // Expanded كده هيعملي مشكلة الابعاد فلازم احدد ابعاده او احطه جوه TextFormField لو سبنا ال
                    // error : An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.
                    decoration: InputDecoration(
                      // هنا انا هلغي البوردر اللي هو التحديد او الخط اللي بالعرض اللي تحت بشكل نهائي
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.search, size: 35),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[270]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.clear_all_outlined, size: 35),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Categories',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[200],
                        ),
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(categories[index]['iconName'], size: 35),
                      ),
                      Text(
                        categories[index]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Text(
              'Best Selling',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 307,
                ),
                itemCount: bestSelling.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ItemDetails(data: bestSelling[index]),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.grey[200],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 180,
                            width: 160,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              bestSelling[index]['iconName'],
                              size: 120,
                            ),
                          ),
                          Text(
                            bestSelling[index]['title'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bestSelling[index]['subtitle'],
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Text(
                            bestSelling[index]['price'],
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
