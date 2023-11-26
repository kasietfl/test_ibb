import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final String? selectedItem;
  final List<String> items;
  final String hint;
  final void Function(String) callback;
  const CustomDropDownButton(
      {super.key,
      this.selectedItem,
      required this.items,
      required this.callback,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: DropdownButton<String>(
        underline: Container(),
        iconSize: 0,
        hint: Text(hint),
        value: selectedItem,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          callback(value!);
        },
      ),
    );
  }
}
