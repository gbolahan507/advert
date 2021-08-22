import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jiji_clone/core/view_models/skills_vm.dart';
import 'package:jiji_clone/view/screen/homepage/home_appbar.dart';
import 'package:jiji_clone/view/widgets/custom_icon.dart';
import 'package:jiji_clone/view/widgets/export.dart';
import 'package:loading_overlay/loading_overlay.dart';

class HomeSccreen extends StatelessWidget {
  final spinkit = SpinKitCircle(
    color: Styles.appBackground,
    size: 30.0,
  );

  final doublbBounce = SpinKitDoubleBounce(
    color: Styles.appBackground,
    size: 30.0,
  );

  @override
  Widget build(BuildContext context) {
    return BaseView<SkillsViewModel>(
        onModelReady: (SkillsViewModel model) => model.getAllSkills(),
        builder: (_, SkillsViewModel model, __) {
          return GestureDetector(
              onTap: () => Validate.offKeyboard(context),
              child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(70),
                    child: MyAppBar(),
                  ),
                  body: LoadingOverlay(
                    isLoading: model.busy,
                    color: Styles.colorGrey,
                    progressIndicator: spinkit,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Styles.colorWhite,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 1.8 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                          itemCount: model.allSkills?.length ?? 0,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              child: Stack(
                                children: [
                                  Container(
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          doublbBounce,
                                      imageUrl:
                                          "https://picsum.photos/250?image=9",
                                      // model.allSkills[index]?.image ?? '',
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: CustomText(
                                      model.allSkills[index]?.title ?? '',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )));
        });
  }
}
