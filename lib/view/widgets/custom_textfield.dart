import 'package:flutter/material.dart';
import 'package:jiji_clone/app/styles/spacing.dart';
import 'package:jiji_clone/app/styles/styles.dart';
import 'package:jiji_clone/view/widgets/export.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key key,
      this.controller,
      this.enabled = true,
      this.autoFocus = false,
      this.inputType,
      this.inputAction,
      this.focusNode,
      this.maxLength,
      this.maxLines,
      this.labelText,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.hintText,
      this.fillColor,
      this.prefixIcon,
      this.borderBorderColor,
      this.enableBorderColor,
      this.focusedBorderColor,
      this.titleColor,
      this.image,
      this.showTitle = true,
      this.title,
      this.obscure})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  final int maxLength;
  final int maxLines;
  final bool showTitle;
  final bool enabled;
  final bool obscure;
  final Color titleColor,
      focusedBorderColor,
      enableBorderColor,
      borderBorderColor,
      fillColor;
  final bool autoFocus;
  final String labelText, title;
  final String hintText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Widget image;
  final String Function(String) validator;
  final Function(String) onChanged;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure;

  @override
  void initState() {
    obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            widget.showTitle
                ? CustomText(
                    widget.title,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color:
                        widget.titleColor ?? Styles.colorBlack.withOpacity(0.8),
                  )
                : SizedBox()
          ],
        ),
        verticalSpaceTiny,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            keyboardType: widget.inputType,
            controller: widget.controller,
            textInputAction: widget.inputAction,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            obscureText: obscure ?? false,
            cursorColor: Colors.black,
            style: TextStyle(
                color: Styles.colorBlack,
                fontSize: screenAwareSize(16, context, width: true),
                fontFamily: 'Brandon'),
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              labelText: widget.labelText,
              fillColor: widget.fillColor ?? Color(0xffFAFAFA),
              filled: true,
              hintStyle: TextStyle(
                  color: Styles.colorBlack.withOpacity(0.2),
                  fontSize: screenAwareSize(14, context, width: true),
                  fontFamily: 'Brandon'),
              hintText: widget.hintText,
              labelStyle: TextStyle(
                  color: Styles.colorGrey,
                  fontSize: screenAwareSize(14, context, width: true),
                  fontFamily: 'Brandon'),
              errorStyle: const TextStyle(color: Color(0xff222222)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: widget.focusedBorderColor ?? Styles.appBackground1,
                    width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: widget.enableBorderColor ?? Styles.appBackground1,
                    width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: widget.borderBorderColor ?? Styles.appBackground1,
                    width: 1),
              ),
              counterText: '',
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ?? obscure == null
                  ? null
                  : widget.image ??
                      IconButton(
                        icon: obscure
                            ? Icon(Icons.visibility_off,
                                color: Styles.colorBlack.withOpacity(0.3))
                            : Icon(Icons.visibility,
                                color: Styles.colorBlack.withOpacity(0.5)),
                        onPressed: () {
                          setState(
                            () {
                              obscure = !obscure;
                            },
                          );
                        },
                      ),
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
