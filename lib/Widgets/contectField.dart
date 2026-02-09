import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';

class Contectfield extends StatelessWidget {
  const Contectfield({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isHint,
    required this.initialValue,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isHint;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$labelText:",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: ColorConstant.labelText,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.16,
          child: SingleChildScrollView(
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              cursorColor: ColorConstant.mainColor,
              cursorHeight: 16,
              cursorRadius: Radius.circular(20),
              keyboardType: TextInputType.name,
              cursorWidth: 1.5,
              textInputAction: TextInputAction.next,
              enabled: true,
              maxLines: null,
              minLines: 5,
              expands: false,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConstant.labelText,
              ),
              decoration: InputDecoration(
                hintText: isHint ? initialValue : "",
                hintStyle: TextStyle(
                  color: ColorConstant.hintTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                contentPadding: EdgeInsets.only(
                  left: 14,
                  bottom: 8,
                  top: 8,
                  right: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstant.mainColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
