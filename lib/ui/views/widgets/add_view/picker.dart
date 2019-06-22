import 'package:flutter/material.dart';

class Picker extends StatelessWidget {
  final Text hint;
  final List<String> items;
  final String value;
  final Function setter;
  final Icon icon;
  final Widget underline;

  const Picker(
      {Key key,
      this.hint,
      this.value,
      this.setter,
      this.items,
      this.icon,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(items);
    return DropdownButton<String>(
      underline: underline,
      icon: icon,
      value: value,
      hint: hint,
      onChanged: (String newValue) => setter(newValue),
      items: items
          .map((value) =>
              DropdownMenuItem<String>(value: value, child: Text(value)))
          .toList(),
    );
  }
}
