import 'package:flutter/material.dart';
import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/view/widgets/custom_icon.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Styles.colorWhite,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: RichText(
          textAlign: TextAlign.center,
          text: customTextSpan(
            text: 'Hi,  ',
            context: context,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Styles.colorBlack,
            children: <TextSpan>[
              customTextSpan(
                text: '${AppCache.getUser().user.fullname.toString()}',
                context: context,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Styles.appBackground1,
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 15),
          child: Row(
            children: [
              CustomText(
                'What are you looking for ?',
                fontSize: 13,
                color: Styles.colorGrey,
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(0),
      ),

      //
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: InkWell(
      //       onTap: () {},
      //       child: Column(
      //         children: [
      //           SizedBox(
      //             height: 30,
      //           ),
      //           CustomIcon(
      //             icon: Icons.notifications,
      //             // onPressed: () => routeTo(context, DashBoardNotification()),
      //           ),
      //         ],
      //       ),
      //     ),
      //   )
      // ],
    );
  }
}
