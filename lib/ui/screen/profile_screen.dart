// import 'dart:io';
// import 'dart:typed_data';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:jiji_clone/core/api/auth_api.dart';
// import 'package:jiji_clone/core/model/profile_model.dart';
// import 'package:jiji_clone/core/view_models/auth_vm.dart';
// import 'package:jiji_clone/widgets/export.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   PickedFile _image;

//   TextEditingController fNameController = TextEditingController();
//   TextEditingController lNameController = TextEditingController();

//   AuthViewModel authViewModel;
//   ProfileModel profileModel;
//   Future futureProfile;
//   AuthApi api;
//   Uint8List memoryImage;
//   bool isFile = false;

//   getMyProfile(ProfileModel profileModel) async {
//     // fNameController.text =
//     //           model?.userModel?.profile?.firstName?.toTitleCase() ?? 'A';
//     // fNameController.text = profileModel?.user?.fullname?.toUpperCase() ?? 'A';
//     return await authViewModel.getMe();
//   }

//   @override
//   void initState() {
//     authViewModel = AuthViewModel();
//     futureProfile = getMyProfile(profileModel);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Styles.colorWhite,
//         appBar: buildAppBar(context),
//         body: FutureBuilder(
//             future: futureProfile,
//             builder: (context, snapshot) {
//               final ProfileModel profile = snapshot.data;
//               switch (snapshot.connectionState) {
//                 case ConnectionState.waiting:
//                   return new Center(
//                     child: new Column(
//                       children: <Widget>[
//                         new Padding(padding: new EdgeInsets.all(50.0)),
//                         Center(
//                           child: new CircularProgressIndicator(),
//                         )
//                       ],
//                     ),
//                   );
//                 default:
//                   if (snapshot.hasData) {
//                     return Center(
//                       child: Container(
//                         child: ListView(
//                           shrinkWrap: true,
//                           children: [
//                             // Row(
//                             //   mainAxisAlignment: MainAxisAlignment.center,
//                             //   children: [
//                             //     InkWell(
//                             //       onTap: () => takephoto(ImageSource.gallery),
//                             //       child: ClipOval(
//                             //           child: _image != null
//                             //               ? Image.file(
//                             //                   File(_image.path),
//                             //                   width: 100,
//                             //                   height: 100,
//                             //                   fit: BoxFit.cover,
//                             //                 )
//                             //               : Image.asset(
//                             //                   'images/prof.png',
//                             //                   width: 100,
//                             //                   height: 100,
//                             //                 )),
//                             //     )
//                             //   ],
//                             // ),
//                             Center(
//                               child: Padding(
//                                 padding: EdgeInsets.all(20.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(74.0),
//                                   child: CachedNetworkImage(
//                                     imageUrl:
//                                         profile?.user?.profileUrl ?? 'null',
//                                     height: 74.0,
//                                     width: 74.0,
//                                     fit: BoxFit.fill,
//                                     placeholder:
//                                         (BuildContext context, String url) =>
//                                             Container(
//                                       height: 74.0,
//                                       width: 74.0,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           color: Styles.appBackground,
//                                           borderRadius:
//                                               BorderRadius.circular(74.0)),
//                                       child: CustomText(
//                                           profile?.user?.fullname[0]
//                                                   .toString() ??
//                                               'B'.toUpperCase(),
//                                           fontSize: 24.0,
//                                           color: Styles.colorWhite,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                     errorWidget: (BuildContext context,
//                                             String url, dynamic error) =>
//                                         Container(
//                                       height: 74.0,
//                                       width: 74.0,
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           color: Styles.appBackground,
//                                           borderRadius:
//                                               BorderRadius.circular(74.0)),
//                                       child: CustomText(
//                                           profile?.user?.email[0] ??
//                                               'B'.toUpperCase() +
//                                                   profile?.user?.email[0] ??
//                                               'B'.toUpperCase(),
//                                           fontSize: 24.0,
//                                           color: Styles.colorWhite,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Row(
//                             //   mainAxisAlignment: MainAxisAlignment.center,
//                             //   children: [
//                             //     Positioned(
//                             //       top: -35,
//                             //       child: Stack(
//                             //         children: <Widget>[
//                             //           Container(
//                             //             decoration: BoxDecoration(
//                             //                 color: Styles.colorWhite,
//                             //                 borderRadius:
//                             //                     BorderRadius.circular(80),
//                             //                 border: Border.all(
//                             //                     color: Styles.colorDeepGreen,
//                             //                     width: 2)),
//                             //             child: ClipRRect(
//                             //                 borderRadius:
//                             //                     BorderRadius.circular(70),
//                             //                 child: _image != null
//                             //                     ? Image.file(
//                             //                         _image,
//                             //                         fit: BoxFit.fill,
//                             //                         height: screenAwareSize(
//                             //                             120, context),
//                             //                         width: screenAwareSize(
//                             //                             120, context),
//                             //                       )
//                             //                     : CachedNetworkImage(
//                             //                         imageUrl: profile?.user
//                             //                                 ?.profileUrl ??
//                             //                             'null',
//                             //                         height: screenAwareSize(
//                             //                             120, context),
//                             //                         width: screenAwareSize(
//                             //                             120, context),
//                             //                         fit: BoxFit.fill,
//                             //                         placeholder: (BuildContext
//                             //                                     context,
//                             //                                 String url) =>
//                             //                             Image(
//                             //                                 image: const AssetImage(
//                             //                                     'images/redlogo.png'),
//                             //                                 height:
//                             //                                     screenAwareSize(
//                             //                                         80,
//                             //                                         context),
//                             //                                 width:
//                             //                                     screenAwareSize(
//                             //                                         80,
//                             //                                         context),
//                             //                                 fit:
//                             //                                     BoxFit.contain),
//                             //                         errorWidget: (BuildContext
//                             //                                     context,
//                             //                                 String url,
//                             //                                 dynamic error) =>
//                             //                             Image(
//                             //                                 image: const AssetImage(
//                             //                                     'images/redlogo.png'),
//                             //                                 height:
//                             //                                     screenAwareSize(
//                             //                                         80,
//                             //                                         context),
//                             //                                 width:
//                             //                                     screenAwareSize(
//                             //                                         80,
//                             //                                         context),
//                             //                                 fit:
//                             //                                     BoxFit.contain),
//                             //                       )),
//                             //           ),
//                             //           Positioned(
//                             //               bottom: 0,
//                             //               right: 0,
//                             //               child: InkWell(
//                             //                 onTap: () {
//                             //                   showDialog<void>(
//                             //                       context: context,
//                             //                       barrierDismissible: true,
//                             //                       builder:
//                             //                           (BuildContext context) {
//                             //                         return AlertDialog(
//                             //                           shape:
//                             //                               RoundedRectangleBorder(
//                             //                                   borderRadius:
//                             //                                       BorderRadius
//                             //                                           .circular(
//                             //                                               15)),
//                             //                           content: Column(
//                             //                             mainAxisSize:
//                             //                                 MainAxisSize.min,
//                             //                             children: <Widget>[
//                             //                               InkWell(
//                             //                                 onTap: () {
//                             //                                   Navigator.pop(
//                             //                                       context);
//                             //                                   getImageGallery(
//                             //                                       ImageSource
//                             //                                           .gallery);
//                             //                                 },
//                             //                                 child:
//                             //                                     const Padding(
//                             //                                   padding:
//                             //                                       EdgeInsets
//                             //                                           .all(8.0),
//                             //                                   child: CustomText(
//                             //                                     'Choose Image from Gallery',
//                             //                                     fontSize: 14,
//                             //                                   ),
//                             //                                 ),
//                             //                               ),
//                             //                               InkWell(
//                             //                                 onTap: () {
//                             //                                   Navigator.pop(
//                             //                                       context);
//                             //                                   getImageGallery(
//                             //                                       ImageSource
//                             //                                           .camera);
//                             //                                 },
//                             //                                 child:
//                             //                                     const Padding(
//                             //                                   padding:
//                             //                                       EdgeInsets
//                             //                                           .all(8.0),
//                             //                                   child: CustomText(
//                             //                                     'Take image from Camera',
//                             //                                     fontSize: 14,
//                             //                                   ),
//                             //                                 ),
//                             //                               ),
//                             //                             ],
//                             //                           ),
//                             //                         );
//                             //                       });
//                             //                 },
//                             //                 child: Container(
//                             //                   padding: EdgeInsets.all(
//                             //                       screenAwareSize(5, context)),
//                             //                   decoration: BoxDecoration(
//                             //                       color: Styles.colorWhite,
//                             //                       borderRadius:
//                             //                           BorderRadius.circular(30),
//                             //                       border: Border.all(
//                             //                           color:
//                             //                               Styles.colorNavGreen,
//                             //                           width: screenAwareSize(
//                             //                               1, context))),
//                             //                   child: Icon(
//                             //                     Icons.camera_alt,
//                             //                     color: Styles.colorNavGreen,
//                             //                     size: screenAwareSize(
//                             //                         18, context),
//                             //                   ),
//                             //                 ),
//                             //               )),
//                             //         ],
//                             //       ),
//                             //     ),
//                             //   ],
//                             // ),
//                             verticalSpaceMedium,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       // showModalBottomSheet(
//                                       //     context: context,
//                                       //     builder: ((builder) =>
//                                       //         bottomsheet()));
//                                     },
//                                     child: CustomText('Pick image')),
//                               ],
//                             ),
//                             ProfileContainer(
//                                 icon: Icons.person,
//                                 title: 'Username',
//                                 subTitle: '${profile.user.fullname}'),
//                             ProfileContainer(
//                                 icon: Icons.email,
//                                 title: 'Email',
//                                 subTitle: "${profile.user.email}"),
//                             ProfileContainer(
//                                 icon: Icons.phone,
//                                 title: 'Phone',
//                                 subTitle: '${profile.user.phone}'),
//                             verticalSpaceLarge,
//                             verticalSpaceLarge,
//                             verticalSpaceLarge,
//                           ],
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Center(
//                       child: new Column(
//                         children: <Widget>[
//                           new Padding(padding: new EdgeInsets.all(50.0)),
//                           verticalSpaceLarge,
//                           verticalSpaceLarge,
//                           verticalSpaceLarge,
//                           Center(
//                             child: new CustomText(
//                               'Order list is empty',
//                               fontSize: 13,
//                               color: Styles.colorWhite,
//                             ),
//                           ),
//                           verticalSpaceMedium,
//                           InkWell(
//                             onTap: () {
//                               // routeTo(context, ButtomNavScreen());
//                             },
//                             child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 10),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: Styles.colorRed),
//                                 child: CustomText(
//                                   'Home',
//                                   fontSize: 12,
//                                   color: Styles.colorWhite,
//                                 )),
//                           )
//                         ],
//                       ),
//                     );
//                   }
//               }
//             }));
//   }

//   Widget buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: Styles.colorWhite,
//       iconTheme: IconThemeData(color: Styles.colorBlack),
//       elevation: 0,
//       title: CustomText(
//         'Profiles',
//         color: Styles.colorBlack,
//         fontWeight: FontWeight.bold,
//         fontSize: 20.0,
//       ),
//     );
//   }

//   // Future<void> getImageGallery(ImageSource source) async {
//   //   Validate.offKeyboard(context);
//   //   final PickedFile result = await ImagePicker().getImage(source: source);

//   //   if (result != null) {
//   //     _image = File(result.path);
//   //   } else {
//   //     return;
//   //   }
//   //   setState(() {});
//   // }

//   Future takephoto(ImageSource source) async {
//     try {
//       final PickedFile result = await ImagePicker().getImage(source: source);

//       if (_image == null) return;
//       setState(() {
//         this._image = result;
//       });
//     } on PlatformException catch (e) {
//       print(e.message);
//     }
//   }
// }

// //   Widget bottomsheet() {
// //     return Container(
// //       margin: EdgeInsets.only(
// //         top: 20,
// //       ),
// //       height: 150,
// //       width: double.infinity,
// //       child: Column(
// //         children: <Widget>[
// //           Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 20),
// //             child: Row(
// //               children: <Widget>[
// //                 H2text(
// //                   text: 'Profile photo',
// //                 ),
// //                 Spacer(),
// //                 InkWell(
// //                     onTap: () {
// //                       Navigator.pop(context);
// //                     },
// //                     child: Icon(
// //                       Icons.close,
// //                       color: Colors.black,
// //                     ))
// //               ],
// //             ),
// //           ),
// //           SizedBox(
// //             height: 20,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: <Widget>[
// //               Column(
// //                 children: <Widget>[
// //                   CircleAvatar(
// //                     backgroundColor: Styles.appBackground1,
// //                     radius: 25,
// //                     child: IconButton(
// //                         icon: Icon(Icons.camera_alt),
// //                         onPressed: () {
// //                           getImageGallery(ImageSource.camera);
// //                           Navigator.pop(context);
// //                         },
// //                         color: Colors.white),
// //                   ),
// //                   H2text(text: 'camera')
// //                 ],
// //               ),
// //               Column(
// //                 children: <Widget>[
// //                   CircleAvatar(
// //                     backgroundColor: Colors.blue,
// //                     radius: 25,
// //                     child: IconButton(
// //                         icon: Icon(Icons.image),
// //                         onPressed: () {
// //                           Navigator.pop(context);
// //                           getImageGallery(ImageSource.gallery);
// //                         },
// //                         color: Colors.white),
// //                   ),
// //                   H2text(text: 'gallery')
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class H2text extends StatelessWidget {
//   String text;
//   H2text({Key key, this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//           fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
//     );
//   }
// }

// class ProfileContainer extends StatelessWidget {
//   final icon;
//   final String title;
//   final String subTitle;

//   const ProfileContainer({
//     Key key,
//     this.icon,
//     this.title,
//     this.subTitle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ListTile(
//         leading: Icon(
//           icon,
//           color: Styles.colorGrey.withOpacity(0.7),
//         ),
//         title: CustomText(
//           '$title',
//           fontSize: 12,
//           color: Styles.colorBlack,
//         ),
//         subtitle:
//             CustomText('$subTitle', fontSize: 16, color: Styles.appBackground1),
//       ),
//     );
//   }
// }
