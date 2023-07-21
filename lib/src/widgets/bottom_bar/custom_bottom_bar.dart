import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/bottom_bar/bottom_bar_item.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  final Widget child;
  const CustomBottomNavigatorBar({Key? key, required this.child})
      : super(key: key);

  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 10,
                      offset: Offset(0, 4))
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: widget.child,
          )
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final BottomBarItem? item;
  final void Function()? onTap;
  final bool selected;
  const TabItem({Key? key, this.item, this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10))),
      onPressed: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            item!.icon,
            color: selected ? Colors.redAccent : Colors.grey,
          ),
          Text(item!.text,
              style: TextStyle(
                  fontSize: 13,
                  color: selected ? Colors.redAccent : Colors.grey))
        ],
      ),
    );
  }
}
