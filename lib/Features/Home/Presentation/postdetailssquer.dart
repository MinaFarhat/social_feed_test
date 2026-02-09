import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';
import 'package:social_feed_test/Features/Post/Presentation/editpost.dart';
import 'package:social_feed_test/Widgets/deletedailog.dart';


class PostDetailsSquer extends StatelessWidget {
  PostDetailsSquer({
    super.key,
    required this.personPhoto,
    required this.name,
    required this.date,
    required this.labelText,
    required this.descreptionText,
    required this.numberofcomments,
    required this.index,
  });
  final String personPhoto;
  final String name;
  final String date;
  final String labelText;
  final String descreptionText;
  final int numberofcomments;
  final int index;
  late final editpost = Editpost(title: labelText, contact: descreptionText);
  late final deletedailog = Deletedailog(index: index);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.41,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(personPhoto),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        InkWell(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          onTap: () {
                            editpost.editpost(context);
                          },
                          child: Icon(
                            Icons.edit_note_rounded,

                            color: ColorConstant.labelText,
                            size: 22,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        InkWell(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          onTap: () {
                            deletedailog.deleteDailog(context);
                          },
                          child: Icon(
                            Icons.delete_rounded,
                            color: Colors.red.shade700,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  labelText,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.labelText,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  descreptionText,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorConstant.hintTextColor,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.024),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1.5,
                radius: BorderRadius.circular(50),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                children: [
                  Icon(
                    Icons.mode_comment_outlined,
                    color: Colors.grey.shade600,
                    size: 16,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.023),
                  Text(
                    "$numberofcomments",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
