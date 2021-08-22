import 'package:flutter/material.dart';
import 'package:jiji_clone/view/widgets/custom_icon.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool check;
  final color, textColor;
  final Widget widget;
  final Function onPressed;
  final bool backbutton;
  const CustomAppBar({
    this.title,
    this.color,
    this.widget,
    this.textColor,
    this.onPressed,
    this.backbutton = true,
    this.check = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 0.0,
        backgroundColor: color,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    backbutton == true
                        ? CustomIcon(
                            onPressed: () => Navigator.pop(context),
                          )
                        : SizedBox(),
                    horizontalSpaceTiny,
                    CustomText(
                      '$title',
                      fontSize: 16,
                      color: textColor ?? Styles.colorBlack,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  check
                      ? widget ??
                          CustomIcon(icon: Icons.notifications, onPressed: () {}
                              // routeTo(context, DashBoardNotification()),
                              )
                      : SizedBox()
                ],
              ),
            ),
          )
        ]);
  }
}
