import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TestRow extends StatefulWidget {

  final int value;
  final void Function(int value) onDelete;

  const TestRow({super.key, required this.value, required this.onDelete});

  @override
  State<TestRow> createState() => _TestRowState();
}

class _TestRowState extends State<TestRow> with TickerProviderStateMixin {

  late SlidableController _slidableController;

  @override
  void initState() {
    _slidableController = SlidableController(this);
    super.initState();
  }

  @override
  void dispose() {
    _slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Slidable(
          key: UniqueKey(),
          controller: _slidableController,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () => widget.onDelete(widget.value),
            ),
            children: [
              SlidableAction(
                onPressed: (context) => widget.onDelete(widget.value),
                label: 'Delete',
              )
            ],
          ),
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 50,
              minWidth: double.infinity
            ),
            color: Colors.blue,
            child: Center(child: Text(widget.value.toString())),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );

  }


}
