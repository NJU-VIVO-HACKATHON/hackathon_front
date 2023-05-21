import 'package:flutter/material.dart';

class MultiWidgetSelector extends StatefulWidget {
  final int count;
  final Widget Function(int index) builder;
  final Widget Function(int index)? bottomBuilder;
  final void Function(Set<int> allSelected, int id)? onAdded;
  final void Function(Set<int> allSelected, int id)? onRemoved;
  const MultiWidgetSelector({
    Key? key,
    required this.count,
    required this.builder,
    required this.bottomBuilder,
    this.onAdded,
    this.onRemoved,
  }) : super(key: key);

  @override
  State<MultiWidgetSelector> createState() => _MultiWidgetSelectorState();
}

class _MultiWidgetSelectorState extends State<MultiWidgetSelector> {
  Set<int> selected = {};
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
      ),
      itemCount: widget.count,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              setState(() {
                if (selected.contains(index)) {
                  selected.remove(index);
                  widget.onRemoved?.call(selected, index);
                } else {
                  selected.add(index);
                  widget.onAdded?.call(selected, index);
                }
              });
            },
            child: () {
              Widget ret = widget.builder(index);
              if (selected.contains(index)) {
                ret = Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 5),
                  ),
                  child: widget.builder(index),
                );
              }
              return Column(
                children: [
                  ret,
                  widget.bottomBuilder?.call(index) ?? const SizedBox(),
                ],
              );
            }(),
          ),
        );
      },
    );
  }
}
