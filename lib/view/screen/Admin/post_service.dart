import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiji_clone/core/api/skill_api.dart';
import 'package:jiji_clone/core/model/uploadimg.dart';
import 'package:jiji_clone/core/view_models/skills_vm.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:jiji_clone/view/widgets/custom_text_widget.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class PostServiceScreen extends StatefulWidget {
  final String skillsId;

  final String url;

  PostServiceScreen({this.skillsId, this.url});

  @override
  _PostServiceScreenState createState() => _PostServiceScreenState();
}

class _PostServiceScreenState extends State<PostServiceScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _serviceDscController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();
  bool user = true;

  List<File> images = [];

  List<UploadImageModel> uploadmodel = [];

  List serial = [];

  File imgeFile;

  SkillsApi skillsApi;

  @override
  void initState() {
    skillsApi = SkillsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(uploadmodel?.length.toString() ?? 0.toString());
    return BaseView<SkillsViewModel>(
        onModelReady: (SkillsViewModel model) => {},
        builder: (_, SkillsViewModel model, __) {
          return GestureDetector(
              onTap: () => Validate.offKeyboard(context),
              child: Scaffold(
                  appBar: AppBar(
                      elevation: 0.0,
                      backgroundColor: Styles.colorWhite,
                      title: CustomText(
                        'POST SERVICES',
                        fontSize: 18,
                        color: Styles.colorBlack,
                      ),
                      centerTitle: true,
                      leading: Icon(
                        Icons.arrow_back_ios,
                        color: Styles.colorBlack,
                        size: 20,
                      )),
                  body: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Styles.colorWhite,
                      child: ListView(shrinkWrap: true, children: [
                        CustomTextField(
                            hintText: 'Service Name',
                            title: 'Service Name',
                            maxLines: 1,
                            controller: _nameController,
                            validator: (val) => Validate.validateEmail(val)),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                            hintText: 'User Email',
                            title: 'User Email',
                            maxLines: 1,
                            controller: _emailController,
                            validator: (val) => Validate.validateEmail(val)),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                          hintText: 'Phone',
                          title: 'Phone',
                          maxLines: 1,
                          controller: _phoneController,
                          validator: (val) => Validate.validatePassword(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                          hintText: 'Address',
                          title: 'Address',
                          maxLines: 1,
                          controller: _addressController,
                          validator: (val) => Validate.validatePassword(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                          hintText: 'Service Description',
                          title: 'Service Description',
                          maxLines: 10,
                          controller: _serviceDscController,
                          validator: (val) => Validate.validatePassword(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            DottedBorder(
                              color: Styles.colorNavGreen,
                              strokeWidth: 1,
                              borderType: BorderType.RRect,
                              dashPattern: const <double>[8, 8],
                              radius: const Radius.circular(20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: screenAwareSize(100, context),
                                    width: screenAwareSize(100, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                        onTap: () {
                                          getImageGallery(model);
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.cloud_upload_outlined,
                                                size: screenAwareSize(
                                                    30, context),
                                                color: Styles.colorNavGreen),
                                            verticalSpaceTiny,
                                            CustomText('Upload',
                                                fontSize: 16,
                                                color: Styles.colorNavGreen)
                                          ],
                                        )),
                                  )),
                            ),
                            horizontalSpaceSmall,
                            if (images.isNotEmpty)
                             
                              Expanded(
                                child: SizedBox(
                                  height: screenAwareSize(150, context),
                                  child: ListView.builder(
                                      itemCount: images.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                Stack(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.file(
                                                          images[index],
                                                          height:
                                                              screenAwareSize(
                                                                  110, context),
                                                        )),
                                                    GestureDetector(
                                                      onTap: () {
                                                        images.removeAt(index);
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                        size: screenAwareSize(
                                                            24, context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (index == 0)
                                                  CustomText('Banner',
                                                      fontSize: 14,
                                                      color: Styles.colorBlack)
                                              ],
                                            ));
                                      }),
                                ),
                              ),
                          ],
                        ),
                        verticalSpaceMedium,
                        CustomButton(
                            title: model.busy ? 'Posting...' : 'POST',
                            fontSize: 13,
                            height: 50,
                            busy: model.busy,
                            buttonColor: Styles.appBackground1,
                            onPressed: () {
                              final Map<String, dynamic> data =
                                  <String, dynamic>{
                                "title": _nameController.text,
                                "description": _serviceDscController.text,
                                "email": _emailController.text,
                                "phone": _phoneController.text,
                                "address": _addressController.text,
                                "category": '602117661b2b6f1c3cfb81f3',
                                "images": serial
                              };
                              print(serial);
                              // print(widget.skillsId);
                              // model.postService(context, data, images);
                            }),
                        verticalSpaceSmall
                      ]),
                    ),
                  )));
        });
  }

  Future<void> getImageGallery(SkillsViewModel model) async {
    Validate.offKeyboard(context);
    final PickedFile result =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (result != null) {
      images.add(File(result.path));
      skillsApi.uploadImage2([File(result.path)]);
    } else {
      return;
    }
    setState(() {});
  }
}
