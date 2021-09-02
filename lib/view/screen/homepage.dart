import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiji_clone/core/routes/router.dart';
import 'package:jiji_clone/core/view_models/skills_vm.dart';
import 'package:jiji_clone/view/screen/homepage/home_appbar.dart';
import 'package:jiji_clone/view/screen/skills_screen.dart';
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
                  body: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 18, left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading(),
                      verticalSpaceMedium,
                      Expanded(
                        child: LoadingOverlay(
                          isLoading: model.busy,
                          color: Styles.colorGrey,
                          progressIndicator: spinkit,
                          child: StaggeredGridView.countBuilder(
                            physics: BouncingScrollPhysics(),
                            crossAxisCount: 4,
                            itemCount: model.allSkills?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    routeTo(
                                        context,
                                        SkillScreen(
                                          skills: model.allSkills[index],
                                          skillTitle: model.allSkills[index].title,
                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      height: 25,
                                                      width: 100,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .elliptical(
                                                                        100,
                                                                        25)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child:
                                                   SvgPicture.network(
                                                    model.allSkills[index]
                                                            ?.image ??
                                                        '',
                                                    semanticsLabel: 'A shark?!',
                                                    fit: BoxFit.cover,
                                                    placeholderBuilder:
                                                        (BuildContext
                                                                context) =>
                                                            doublbBounce,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        CustomText(
                                            model.allSkills[index]?.title ?? '',
                                            fontWeight: FontWeight.bold),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$100',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.fit(2),
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )));
        });
  }
}
