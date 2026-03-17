import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final String name;
  final String email;
  final String date;
  final String imagename;
  const CustomListtile({
    super.key,
    required this.name,
    required this.email,
    required this.date,
    required this.imagename,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 70, // طول الصورة
              width: 70, // عرض الصورة
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.asset(
                  'lib/images/$imagename.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              // عشان تاخد الابعاد المناسبة ليها وميحصلش مشكلة Expanded حطينا الصورة جوه ال
              child: ListTile(
                title: Text(name),
                subtitle: Text(email),
                trailing: Text(date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}