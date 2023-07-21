import 'package:auto_route/annotations.dart';
import 'package:cross_tech/src/extension/build_context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
