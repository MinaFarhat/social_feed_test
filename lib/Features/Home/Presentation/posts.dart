import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';
import 'package:social_feed_test/Features/Home/Presentation/addnewpost.dart';
import 'package:social_feed_test/Features/Home/Presentation/singlepost.dart';
import 'package:social_feed_test/Trash/listofposts.dart';

class Posts extends StatelessWidget {
  Posts({super.key});

  final addNewPost = Addnewpost();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            onPressed: () {
              addNewPost.addpost(context);
            },
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,
            backgroundColor: ColorConstant.mainColor,
            splashColor: ColorConstant.mainColor,
            focusColor: ColorConstant.mainColor,
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              1,
            ),
            child: Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Posts",
                        style: TextStyle(
                          color: ColorConstant.labelText,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "3 posts",
                        style: TextStyle(
                          color: ColorConstant.hintTextColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    onTap: () {},
                    child: Icon(
                      Icons.repeat,
                      color: ColorConstant.labelText,
                      size: 20,
                      fill: 0.5,
                      weight: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: posts.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    return SinglePost(
                      posts: posts,
                      context: context,
                      index: index,
                      personPhoto: posts[index]["personPhoto"],
                      name: posts[index]["name"],
                      date: posts[index]["date"],
                      labelText: posts[index]["labelText"],
                      descreptionText: posts[index]["descreptionText"],
                      numberofcomments: posts[index]["numberofcomments"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
