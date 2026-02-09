import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';
import 'package:social_feed_test/Features/Home/Presentation/postdetailssquer.dart';
import 'package:social_feed_test/Features/Post/Presentation/addnewcomment.dart';
import 'package:social_feed_test/Features/Post/Presentation/singlecomment.dart';
import 'package:social_feed_test/Trash/listofcomments.dart';
import 'package:social_feed_test/Widgets/button.dart';


class Postdetails extends StatelessWidget {
  Postdetails({
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
  final addNewComment = Addnewcomment();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  InkWell(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                      size: 16,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.045),
                  Text(
                    "Post Details",
                    style: TextStyle(
                      color: ColorConstant.labelText,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.018),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1.5,
              radius: BorderRadius.circular(50),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            PostDetailsSquer(
              personPhoto: personPhoto,
              name: name,
              date: date,
              labelText: labelText,
              descreptionText: descreptionText,
              numberofcomments: numberofcomments,
              index: index,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Comments",
                    style: TextStyle(
                      color: ColorConstant.labelText,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  ButtonWidget(
                    text: "Add Comment",
                    textColor: Colors.white,
                    buttonColor: ColorConstant.mainColor,
                    borderColor: ColorConstant.mainColor,
                    onTap: () {
                      addNewComment.addComment(context);
                    },
                    isAdd: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: comments.length,
                physics: AlwaysScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 18),
                itemBuilder: (context, index) {
                  return Singlecomment(
                    comments: comments,
                    context: context,
                    index: index,
                    name: comments[index]['name'],
                    date: comments[index]['date'],
                    commentText: comments[index]['commentText'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
