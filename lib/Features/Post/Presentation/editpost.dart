import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';
import 'package:social_feed_test/Widgets/addField.dart';
import 'package:social_feed_test/Widgets/button.dart';
import 'package:social_feed_test/Widgets/contectField.dart';

class Editpost extends StatelessWidget {
  Editpost({super.key, required this.title, required this.contact});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final addField = Addfield();
  final String title;
  final String contact;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void editpost(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.87,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit Post',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.labelText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.blueGrey.shade800,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Update you post details below',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      addField.addField(
                        "title:",
                        context,
                        titleController,
                        true,
                        title,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),

                      Contectfield(
                        controller: contactController,
                        labelText: "Contact",
                        isHint: true,
                        initialValue: contact,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget(
                            text: "Cancel",
                            textColor: ColorConstant.labelText,
                            buttonColor: Colors.white,
                            borderColor: Colors.blueGrey.shade200,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            isAdd: false,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.028,
                          ),
                          ButtonWidget(
                            text: "Update",
                            textColor: Colors.white,
                            buttonColor: ColorConstant.mainColor,
                            borderColor: ColorConstant.mainColor,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            isAdd: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
