import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';
import 'package:social_feed_test/Trash/listofposts.dart';
import 'package:social_feed_test/Widgets/addField.dart';
import 'package:social_feed_test/Widgets/button.dart';
import 'package:social_feed_test/Widgets/contectField.dart';

class Addnewpost extends StatelessWidget {
  Addnewpost({super.key});
  final addField = Addfield();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void addpost(BuildContext context) {
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
                        'Create New Post',
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
                    'Share your thoughts with the community',
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
                        "Your Name:",
                        context,
                        nameController,
                        false,
                        "",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      addField.addField(
                        "Title:",
                        context,
                        titleController,
                        false,
                        "",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Contectfield(
                        controller: contentController,
                        labelText: "Content",
                        isHint: false,
                        initialValue: "",
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
                            text: "Create",
                            textColor: Colors.white,
                            buttonColor: ColorConstant.mainColor,
                            borderColor: ColorConstant.mainColor,
                            onTap: () {
                              posts.add({
                                "personPhoto": "Images/personPhoto.jpg",
                                "name": nameController.text,
                                "date": "Just now",
                                "labelText": titleController.text,
                                "descreptionText": contentController.text,
                                "numberofcomments": 0,
                              });
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
