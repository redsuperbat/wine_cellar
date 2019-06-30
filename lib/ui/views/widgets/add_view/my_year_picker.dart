import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyYearPicker extends StatefulWidget {
  final int selectedYear;
  final int firstYear;
  final int lastYear;
  final ValueChanged<int> onChanged;

  MyYearPicker(
      {@required this.selectedYear,
      @required this.onChanged,
      @required this.firstYear,
      @required this.lastYear});

  @override
  _MyYearPickerState createState() => _MyYearPickerState();
}

class _MyYearPickerState extends State<MyYearPicker> {
  ScrollController scrollController;
  static const _itemExtent = 50.0;

  @override
  void initState() {
    scrollController = ScrollController(
      initialScrollOffset:
          (widget.selectedYear - widget.firstYear) * _itemExtent,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _itemCount = widget.lastYear - widget.firstYear + 1;
    if (scrollController.hasClients) {
      for (int i = 0; i < _itemCount; i++) {
        final int year = widget.firstYear + i;
        if (year == widget.selectedYear) {
          scrollController.animateTo(i * 50.0,
              duration: Duration(seconds: 2), curve: Curves.ease);
          break;
        }
      }
    }
    return ListView.builder(
      dragStartBehavior: DragStartBehavior.start,
      controller: scrollController,
      itemExtent: _itemExtent,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        final int year = widget.firstYear + index;
        final bool isSelected = year == widget.selectedYear;
        final TextStyle itemStyle = isSelected
            ? TextStyle(fontSize: 25, color: Colors.red)
            : TextStyle(fontSize: 20);
        return InkWell(
          key: ValueKey<int>(year),
          onTap: () => widget.onChanged(year),
          child: Center(
            child: Semantics(
              selected: isSelected,
              child: Text('$year', style: itemStyle),
            ),
          ),
        );
      },
    );
  }
}
