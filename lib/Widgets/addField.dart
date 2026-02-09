import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';

class Addfield extends StatelessWidget {
  const Addfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget addField(
    String text,
    BuildContext context,
    TextEditingController controller,
    bool isHint,
    String? initialValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: ColorConstant.labelText,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.04,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: ColorConstant.mainColor,
            cursorHeight: 16,
            cursorRadius: Radius.circular(20),
            keyboardType: TextInputType.name,
            cursorWidth: 1.5,
            textInputAction: TextInputAction.next,
            enabled: true,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: ColorConstant.labelText,
            ),

            decoration: InputDecoration(
              hintText: isHint ? initialValue : "",
              contentPadding: EdgeInsets.only(left: 14, bottom: 9),
              enabledBorder: InputBorder.none,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.mainColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
