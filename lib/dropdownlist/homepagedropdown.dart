import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/dropdownlist/apptextfield.dart';

class Homepagedropdown extends StatefulWidget {
  const Homepagedropdown({super.key});

  @override
  State<Homepagedropdown> createState() => _HomepagedropdownState();
}

class _HomepagedropdownState extends State<Homepagedropdown> {
  TextEditingController country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dropdownSearch")),
      body: ListView(
        children: [
          AppTextField(
            datalist: [
              SelectedListItem(data:"Palestein"),
              SelectedListItem(data:"Syria"),
              SelectedListItem(data:"Egypt"),
              SelectedListItem(data:"Jordan"),
            ],
            textEditingController: country,
            title: "Select Country",
            hint: "Country",
          ),
        ],
      ),
    );
  }
}
