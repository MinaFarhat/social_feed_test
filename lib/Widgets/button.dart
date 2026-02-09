import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.borderColor,
    required this.onTap,
    required this.isAdd,
  });
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final Function()? onTap;
  final bool isAdd;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
      onTap: onTap,
      child: Container(
        width: isAdd
            ? MediaQuery.of(context).size.width * 0.38
            : MediaQuery.of(context).size.width * 0.44,
        height: isAdd
            ? MediaQuery.of(context).size.height * 0.042
            : MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
