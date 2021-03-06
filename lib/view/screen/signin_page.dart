import 'package:flutter/material.dart';
import 'package:jiji_clone/core/model/user_model2.dart';
import 'package:jiji_clone/core/view_models/auth_vm.dart';
import 'package:jiji_clone/view/screen/signup_page.dart';
import 'package:jiji_clone/core/routes/router.dart';
import 'package:jiji_clone/view/widgets/custom_text_widget.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class LoginScreen extends StatefulWidget {
  final UserModel userModel;
  LoginScreen({this.userModel});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool user = true;

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        onModelReady: (AuthViewModel model) => {},
        builder: (_, AuthViewModel model, __) {
          return GestureDetector(
              onTap: () => Validate.offKeyboard(context),
              child: Scaffold(
                  appBar: AppBar(
                      elevation: 0.0,
                      backgroundColor: Styles.colorWhite,
                      title: CustomText(
                        'Login',
                        fontSize: 18,
                        color: Styles.colorBlack,
                      ),
                      centerTitle: true,
                      leading: Icon(
                        Icons.arrow_back_ios,
                        color: Styles.colorBlack,
                        size: 20,
                      )),
                  body: Center(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Styles.colorWhite,
                        child: ListView(shrinkWrap: true, children: [
                          verticalSpaceLarge,
                          verticalSpaceLarge,
                          CustomTextField(
                              hintText: 'Email',
                              title: 'Email',
                              maxLines: 1,
                              controller: _emailController,
                              validator: (val) => Validate.validateEmail(val)),
                          verticalSpaceMedium,
                          verticalSpaceTiny,
                          CustomTextField(
                            hintText: 'Password',
                            title: 'password',
                            maxLines: 1,
                            controller: _passwordController,
                            validator: (val) => Validate.validatePassword(val),
                            obscure: true,
                          ),
                          verticalSpaceMedium,
                          verticalSpaceTiny,
                          verticalSpaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        user = !user;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: user
                                              ? Styles.appBackground1
                                              : Styles.colorDeepPink),
                                      child: CustomText(
                                        user ? 'User' : 'Admin',
                                        color: Styles.colorWhite,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: CustomText(
                                  'Forgot Password',
                                  color: Styles.colorDeepGreen,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          verticalSpaceMedium,
                          verticalSpaceTiny,
                          CustomButton(
                            title: model.busy ? 'Login you in...' : 'LOGIN',
                            fontSize: 13,
                            height: 50,
                            busy: model.busy,
                            buttonColor: Styles.appBackground1,
                            onPressed: () {
                              final Map<String, String> data = {
                                "email": _emailController.text,
                                "password": _passwordController.text
                              };
                              if (_formKey.currentState.validate()) {
                                print(data);

                                model.loginUser(
                                  context,
                                  data,
                                );
                              }
                            },
                          ),
                          verticalSpaceMedium,
                          verticalSpaceLarge,
                          verticalSpaceMedium,
                          RichText(
                            textAlign: TextAlign.center,
                            text: customTextSpan(
                              text: 'Dont have any account? ',
                              context: context,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Styles.colorBlack,
                              children: <TextSpan>[
                                customTextSpan(
                                    text: 'Sign Up',
                                    context: context,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Styles.colorDeepGreen,
                                    onTap: () {
                                      routeTo(context, SignupScreen());
                                    }),
                              ],
                            ),
                          ),
                          verticalSpaceSmall
                        ]),
                      ),
                    ),
                  )));
        });
  }
}
