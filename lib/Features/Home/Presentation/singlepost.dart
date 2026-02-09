import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';
import 'package:social_feed_test/Features/Post/Presentation/postdetails.dart';

class SinglePost extends StatelessWidget {
  const SinglePost({
    super.key,
    required this.posts,
    required this.context,
    required this.index,
    required this.personPhoto,
    required this.name,
    required this.date,
    required this.labelText,
    required this.descreptionText,
    required this.numberofcomments,
  });

  final List posts;
  final BuildContext context;
  final int index;
  final String personPhoto;
  final String name;
  final String date;
  final String labelText;
  final String descreptionText;
  final int numberofcomments;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.255,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: index == 0
            ? Border.all(
                color: ColorConstant.mainColor.withAlpha(180),
                width: 1.5,
              )
            : Border.all(color: Colors.transparent, width: 0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Postdetails(
                personPhoto: posts[index]["personPhoto"],
                name: posts[index]["name"],
                date: posts[index]["date"],
                labelText: posts[index]["labelText"],
                descreptionText: posts[index]["descreptionText"],
                numberofcomments: posts[index]["numberofcomments"],
                index: index,
              ),
            ),
          );
        },
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Column(
          children: [
            ListTile(
              horizontalTitleGap: 10,
              trailing: InkWell(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                onTap: () {},
                child: Icon(
                  Icons.more_vert_rounded,
                  color: ColorConstant.labelText,
                  size: 18,
                ),
              ),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(posts[index]["personPhoto"]),
              ),
              title: Text(
                posts[index]["name"],
                style: TextStyle(color: ColorConstant.labelText, fontSize: 14),
              ),
              subtitle: Text(
                posts[index]["date"],
                style: TextStyle(
                  color: ColorConstant.hintTextColor,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  posts[index]["labelText"],
                  style: TextStyle(
                    color: ColorConstant.labelText,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: Text(
                    posts[index]["descreptionText"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstant.hintTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
