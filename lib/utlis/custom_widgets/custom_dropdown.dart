import 'package:flutter/material.dart';
import '../../utlis/custom_widgets/custom_text.dart';

import 'custom_icon.dart';

class CustomDropdown {
  static showDropdown({
    required List<String> list,
    required String dropdownValue,
    required String hintText,
    required Function onChanged,
  }) {
    DropdownButton(
      items: list.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: onChanged(),
      icon: const CustomIcon(icon: Icons.arrow_drop_down),
      value: dropdownValue,
      hint: CustomText(title: hintText),
    );
  }
}
