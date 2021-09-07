import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jiji_clone/app/styles/spacing.dart';
import 'package:jiji_clone/app/styles/styles.dart';
import 'package:jiji_clone/core/model/skills_model.dart';
import 'package:jiji_clone/core/routes/router.dart';
import 'package:jiji_clone/core/utils/base_view.dart';
import 'package:jiji_clone/core/view_models/skills_vm.dart';
import 'package:jiji_clone/view/screen/Admin/post_service.dart';
import 'package:jiji_clone/view/screen/detail_Screen.dart';
import 'package:jiji_clone/view/screen/homepage/home_appbar.dart';
import 'package:jiji_clone/view/widgets/custom_text_widget.dart';
import 'package:jiji_clone/view/widgets/export.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdminSkillsScreen extends StatelessWidget {
  final SkillsModel skills;
  final String skillTitle;

  AdminSkillsScreen({this.skills, this.skillTitle});
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
        onModelReady: (SkillsViewModel model) =>
            model.getService(skills.id.toString()),
        builder: (_, SkillsViewModel model, __) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Styles.colorWhite,
                margin: EdgeInsets.only(top: 18, left: 14, right: 14),
                child: Column(
                  children: [
                    Heading(showName: false, skillTile: skills.title),
                    Expanded(
                      child: Container(
                        child: LoadingOverlay(
                          isLoading: model.busy,
                          color: Styles.colorGrey,
                          progressIndicator: spinkit,
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    'Number of Registered Heartisan',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  Spacer(),
                                  CustomText(
                                    !model.busy
                                        ? model.allServices?.length
                                                .toString() ??
                                            '0'
                                        : '0',
                                    color: Styles.colorDeepPink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              ),
                              verticalSpaceSmall,
                              verticalSpaceSmall,
                              ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: model.allServices?.length ?? 0,
                                  separatorBuilder: (context, index) =>
                                      Divider(color: Styles.colorDeepPink),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        routeTo(
                                            context,
                                            DetailScreen(
                                                serviceModel:
                                                    model.allServices[index]));
                                      },
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 120,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Positioned.fill(
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    Container(
                                                                  height: 25,
                                                                  width: 100,
                                                                  decoration:
                                                                      new BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.elliptical(
                                                                            100,
                                                                            25)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Center(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: model
                                                                          .allServices[
                                                                              index]
                                                                          ?.images[0] ??
                                                                      '',
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 100,
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      doublbBounce,
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    horizontalSpaceMedium,
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomText(
                                                          model
                                                                  .allServices[
                                                                      index]
                                                                  ?.title ??
                                                              '',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        Spacer(),
                                                        CustomText(
                                                          model
                                                                  .allServices[
                                                                      index]
                                                                  ?.phone ??
                                                              '',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Styles
                                                              .colorDeepPink,
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          children: [
                                                            CustomText(
                                                              'Rating :',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                            horizontalSpaceTiny,
                                                            CustomText(
                                                              model
                                                                      .allServices[
                                                                          index]
                                                                      ?.rating
                                                                      .toString() ??
                                                                  '',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Styles
                                                                  .colorDeepPink,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              CustomButton(
                                onPressed: () {
                                  routeTo(context, PostServiceScreen(skillsId: skills.id));
                                },
                                title: 'Post Service',
                                height: 50,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
