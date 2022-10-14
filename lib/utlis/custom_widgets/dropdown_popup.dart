import 'package:flutter/material.dart';
import '../../utlis/helpers/global.dart';

class DropDownPopUpGesture extends StatefulWidget {
  const DropDownPopUpGesture({super.key});

  @override
  State<DropDownPopUpGesture> createState() => DropDownPopUpGesturePage();
}

class DropDownPopUpGesturePage extends State<DropDownPopUpGesture> {
  String dropdownvalue = '';

  var items = [
    'Mobile',
    'Web',
    'Desktop',
    'Embedded',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CustomDropdown.showDropdown(
          //   list: items,
          //   dropdownValue: dropdownvalue,
          //   hintText: 'hintText',
          //   onChanged: () {},
          // ),
          PopupMenuButton(
            child: const Center(child: Text('Multi-Platform ')),
            itemBuilder: (context) {
              return items.map<PopupMenuItem<String>>((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList();
            },
            onSelected: (String index) {
              printDebug('index is $index');
            },
          ),
          GestureDetector(
            onTap: () {
              printDebug('onTap clicked');
            },
            onDoubleTap: () {
              printDebug('onDoubleTap clicked');
            },
            onLongPress: () {
              printDebug('onLongPress clicked');
            },
            onTapCancel: () {
              printDebug('onTapCancel clicked');
            },
            child: Container(
                color: Colors.yellow,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: const Text('Click Me')),
          )
        ],
      ),
    );
  }
}
