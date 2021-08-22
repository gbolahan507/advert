import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiji_clone/core/routes/router.dart';
import 'package:jiji_clone/core/view_models/auth_vm.dart';
import 'package:jiji_clone/view/screen/profile_screen.dart';
import 'package:jiji_clone/view/widgets/export.dart';
import 'package:loading_overlay/loading_overlay.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  PickedFile _image;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final spinkit = SpinKitCircle(
    color: Styles.appBackground,
    size: 50.0,
  );

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        onModelReady: (AuthViewModel model) => model.getMe(),
        builder: (_, AuthViewModel model, __) {
          fullNameController.text = model?.profileModel?.user?.fullname ?? '';
          emailController.text = model?.profileModel?.user?.email ?? '';
          phoneController.text = model?.profileModel?.user?.phone ?? '';
          return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 200), () {});
                return model.getMe();
              },
              child: Scaffold(
                  backgroundColor: Styles.colorWhite,
                  appBar: buildAppBar(context),
                  body: LoadingOverlay(
                    isLoading: model.busy,
                    color: Styles.colorGrey,
                    progressIndicator: spinkit,
                    child: Center(
                      child: Container(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            //       Center(
                            //         child: model.busy
                            //             ? CupertinoActivityIndicator()
                            //             : Padding(
                            //                 padding: EdgeInsets.all(20.0),
                            //                 child: ClipRRect(
                            //                   borderRadius: BorderRadius.circular(74.0),
                            //                   child: CachedNetworkImage(
                            //                     imageUrl: model?.profileModel?.user
                            //                             ?.profileUrl ??
                            //                         'null',
                            //                     height: 74.0,
                            //                     width: 74.0,
                            //                     fit: BoxFit.fill,
                            //                     placeholder: (BuildContext context,
                            //                             String url) =>
                            //                         Container(
                            //                       height: 74.0,
                            //                       width: 74.0,
                            //                       alignment: Alignment.center,
                            //                       decoration: BoxDecoration(
                            //                           color: Styles.appBackground,
                            //                           borderRadius:
                            //                               BorderRadius.circular(74.0)),
                            //                       child: CustomText(
                            //                           model?.profileModel?.user
                            //                                   ?.fullname[0]
                            //                                   .toString() ??
                            //                               'B'.toUpperCase(),
                            //                           fontSize: 24.0,
                            //                           color: Styles.colorWhite,
                            //                           fontWeight: FontWeight.w400),
                            //                     ),
                            //                     errorWidget: (BuildContext context,
                            //                             String url, dynamic error) =>
                            //                         Container(
                            //                       height: 74.0,
                            //                       width: 74.0,
                            //                       alignment: Alignment.center,
                            //                       decoration: BoxDecoration(
                            //                           color: Styles.appBackground,
                            //                           borderRadius:
                            //                               BorderRadius.circular(74.0)),
                            //                       child: CustomText(
                            //                           model?.profileModel?.user
                            //                                   ?.email[0] ??
                            //                               'B'.toUpperCase(),
                            //                           fontSize: 24.0,
                            //                           color: Styles.colorWhite,
                            //                           fontWeight: FontWeight.w400),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //       ),
                            verticalSpaceMedium,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    title: 'FullName',
                                    controller: fullNameController,
                                    // enabled: false,
                                  ),
                                  verticalSpaceMedium,
                                  CustomTextField(
                                    title: 'Email',
                                    controller: emailController,
                                    // enabled: false,
                                  ),
                                  verticalSpaceMedium,
                                  CustomTextField(
                                    title: 'Phone',
                                    controller: phoneController,
                                    // enabled: false,
                                  ),
                                ],
                              ),
                            ),
                            verticalSpaceMedium,
                            verticalSpaceMedium,
                            verticalSpaceMedium,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      final Map<String, String> data = {
                                        'fullname': fullNameController.text,
                                        'phone': phoneController.text,
                                        'email': emailController.text,
                                      };
                                      print(data);
                                      model.editgetMe(data);
                                      // routeToReplace(context, ProfileScreen());
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Styles.colorLightBlue),
                                        child: CustomText('Save Profile'))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )));
        });
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.colorWhite,
      iconTheme: IconThemeData(color: Styles.colorBlack),
      elevation: 0,
      title: CustomText(
        'Edit Profiles',
        color: Styles.colorBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }

  // Future<void> getImageGallery(ImageSource source) async {
  //   Validate.offKeyboard(context);
  //   final PickedFile result = await ImagePicker().getImage(source: source);

  //   if (result != null) {
  //     _image = File(result.path);
  //   } else {
  //     return;
  //   }
  //   setState(() {});
  // }

  Future takephoto(ImageSource source) async {
    try {
      final PickedFile result = await ImagePicker().getImage(source: source);

      if (_image == null) return;
      setState(() {
        this._image = result;
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}

//   Widget bottomsheet() {
//     return Container(
//       margin: EdgeInsets.only(
//         top: 20,
//       ),
//       height: 150,
//       width: double.infinity,
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: <Widget>[
//                 H2text(
//                   text: 'Profile photo',
//                 ),
//                 Spacer(),
//                 InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.close,
//                       color: Colors.black,
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   CircleAvatar(
//                     backgroundColor: Styles.appBackground1,
//                     radius: 25,
//                     child: IconButton(
//                         icon: Icon(Icons.camera_alt),
//                         onPressed: () {
//                           getImageGallery(ImageSource.camera);
//                           Navigator.pop(context);
//                         },
//                         color: Colors.white),
//                   ),
//                   H2text(text: 'camera')
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     radius: 25,
//                     child: IconButton(
//                         icon: Icon(Icons.image),
//                         onPressed: () {
//                           Navigator.pop(context);
//                           getImageGallery(ImageSource.gallery);
//                         },
//                         color: Colors.white),
//                   ),
//                   H2text(text: 'gallery')
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class H2text extends StatelessWidget {
  String text;
  H2text({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  final icon;
  final String title;
  final String subTitle;

  const ProfileContainer({
    Key key,
    this.icon,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Icon(
          icon,
          color: Styles.colorGrey.withOpacity(0.7),
        ),
        title: CustomText(
          '$title',
          fontSize: 12,
          color: Styles.colorBlack,
        ),
        subtitle:
            CustomText('$subTitle', fontSize: 16, color: Styles.appBackground1),
      ),
    );
  }
}
