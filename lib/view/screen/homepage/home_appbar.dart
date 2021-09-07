import 'package:flutter/material.dart';
import 'package:jiji_clone/app/styles/spacing.dart';
import 'package:jiji_clone/app/styles/styles.dart';
import 'package:jiji_clone/core/storage/local_storage.dart';
import 'package:jiji_clone/view/widgets/custom_text_widget.dart';

class Heading extends StatelessWidget {

  final String skillTile;
  final bool showName;
  final String text;
  const Heading({
    Key key,
    this.skillTile,
    this.text,
    this.showName = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showName
              ? Row(
                  children: [
                    CustomText('Welcome  ',
                        fontSize: 14, fontWeight: FontWeight.bold),
                    CustomText('${AppCache.getUser().user.fullname.toString()}',
                        fontSize: 14,
                        color: Styles.appBackground1,
                        fontWeight: FontWeight.bold),
                  ],
                )
              : SizedBox(),
          showName ? verticalSpaceSmall : SizedBox(),
          CustomText(skillTile ?? text,
              fontSize: 20, fontWeight: FontWeight.bold),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                _searchBox(),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Expanded(
      child: Container(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding: EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
