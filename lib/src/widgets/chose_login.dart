import 'package:flutter/material.dart';

class ChoseLogin extends StatefulWidget {
  const ChoseLogin(
      {super.key,
      this.color,
      this.width,
      this.textButtonLogin,
      this.image,
      this.height,
      this.ontap});
  final Color? color;
  final double? width;
  final double? height;
  final String? textButtonLogin;
  final String? image;
  final Function()? ontap;

  @override
  State<ChoseLogin> createState() => _ChoseLoginState();
}

class _ChoseLoginState extends State<ChoseLogin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 0, offset: Offset(0, 3))
            ]),
        child: widget.image != null
            ? Row(
                children: [
                  if (widget.image != null)
                    Image.asset(
                      widget.image ?? '',
                      color: Colors.white,
                      width: 40,
                    ),
                  const SizedBox(width: 20),
                  Text(
                    widget.textButtonLogin ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            : Center(
                child: Text(
                  widget.textButtonLogin ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
      ),
    );
  }
}
