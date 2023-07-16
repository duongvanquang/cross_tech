import 'package:cross_tech/src/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

class AScreen extends StatefulWidget {
  const AScreen({super.key});

  @override
  State<AScreen> createState() => _AScreenState();
}

class _AScreenState extends State<AScreen> {
  int numberA = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.widthScreen,
          ),
          const Text('Screen A'),
          Text('$numberA'),
          BWidget(
            number: numberA,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                numberA++;
              });
            },
            child: const Text('incre'),
          )
        ],
      ),
    );
  }
}

class BWidget extends StatefulWidget {
  const BWidget({super.key, required this.number});

  final int number;

  @override
  State<BWidget> createState() => _BWidgetState();
}

class _BWidgetState extends State<BWidget> {
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.number;
  }

  @override
  void didUpdateWidget(BWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.number != oldWidget.number) {
      setState(() {
        number = widget.number;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(number.toString());
  }
}
