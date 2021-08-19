import 'package:flutter/material.dart';
import 'package:jiji_clone/core/view_models/auth_vm.dart';
import 'package:jiji_clone/view/screen/signin_page.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class SignupScreen extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context).settings.arguments as String;

    return BaseView<AuthViewModel>(
        onModelReady: (
          AuthViewModel model,
        ) {},
        builder: (_, AuthViewModel model, __) {
          return GestureDetector(
            onTap: () => Validate.offKeyboard(context),
            child: Scaffold(
              appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Styles.colorWhite,
                  title: CustomText(
                    'SignUp',
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
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        CustomTextField(
                          hintText: 'First Name',
                          title: 'First Name',
                          maxLines: 1,
                          controller: _firstNameController,
                          validator: (val) => Validate.isValidName(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                          hintText: '08062835641',
                          title: 'Phone',
                          maxLines: 1,
                          inputType: TextInputType.phone,
                          controller: _phoneController,
                          validator: (val) => Validate.validateMobile(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                          hintText: 'Email Address',
                          title: 'Email',
                          maxLines: 1,
                          controller: _emailController,
                          validator: (val) => Validate.validateEmail(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                          hintText: 'Password',
                          title: 'Password',
                          maxLines: 1,
                          obscure: true,
                          controller: _passwordController,
                          validator: (val) => Validate.validatePassword(val),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomTextField(
                            hintText: 'Re-enter Password',
                            title: 're-enter password',
                            maxLines: 1,
                            obscure: true,
                            controller: _repasswordController,
                            validator: (val) =>
                                Validate.validateConfirmPassword(
                                    val, _passwordController.text)),
                        verticalSpaceMedium,
                        verticalSpaceTiny,
                        CustomButton(
                          title: model.busy
                              ? 'Creating your account...'
                              : 'SIGN UP',
                          fontSize: 13,
                          height: 50,
                          busy: model.busy,
                          buttonColor: Styles.appBackground1,
                          onPressed: () {
                            final Map<String, String> data = {
                              "fullname": _firstNameController.text,
                              "phone": _phoneController.text,
                              "email": _emailController.text,
                              "password": _passwordController.text,
                            };
                            if (_formKey.currentState.validate()) {
                              print(data);
                              model.createUsers(context, data);
                            }
                          },
                        ),
                        verticalSpaceMedium,
                        RichText(
                          textAlign: TextAlign.center,
                          text: customTextSpan(
                            text: 'By continue, you agree to our  ',
                            context: context,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Styles.colorBlack,
                            children: <TextSpan>[
                              customTextSpan(
                                text: 'Terns of use',
                                context: context,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Styles.colorDeepGreen,

                                // locator<NavigationService>()
                                //     .navigateToReplacing(OnboardView),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        verticalSpaceSmall,
                        RichText(
                          textAlign: TextAlign.center,
                          text: customTextSpan(
                            text: 'Already a user  ',
                            context: context,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Styles.colorBlack,
                            children: <TextSpan>[
                              customTextSpan(
                                  text: 'Login',
                                  context: context,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Styles.colorDeepGreen,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }),
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
