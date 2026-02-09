import 'package:flutter/material.dart';
import 'package:social_feed_test/Core/constant/colors_constant.dart';

class Singlecomment extends StatefulWidget {
  const Singlecomment({
    super.key,
    required this.comments,
    required this.context,
    required this.index,
    required this.name,
    required this.date,
    required this.commentText,
  });
  final List comments;
  final BuildContext context;
  final int index;
  final String name;
  final String date;
  final String commentText;

  @override
  State<Singlecomment> createState() => _SinglecommentState();
}

class _SinglecommentState extends State<Singlecomment> {
  bool isExpanded = false;

  String getInitials(String name) {
    if (name.contains(' ')) {
      List<String> parts = name.split(' ');
      return parts[0][0] + parts[1][0];
    } else {
      return name[0] + name[name.length - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: isExpanded ? null : MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            top: 12,
            right: 12,
            bottom: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: ColorConstant.hintTextColor.withAlpha(30),
                child: Text(
                  getInitials(widget.name),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.labelText,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.labelText,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          onTap: () {},
                          child: Icon(
                            Icons.more_vert_rounded,
                            color: ColorConstant.labelText,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: ColorConstant.hintTextColor,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    InkWell(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        widget.commentText,
                        maxLines: isExpanded ? null : 2,
                        overflow: isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
