import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../res/colors.dart';
import '../../../res/dimen.dart';

class CustomTextFormField extends StatelessWidget {
  final Color color;
  final int maxLength;
  final TextEditingController controller;
  final String hintText;
  final String? labelText, initialValue, counterText;
  final Widget? prefixIcon, suffixIcon;
  final bool obscureText;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomTextFormField({
    super.key,
    this.color = AppColors.black,
    required this.maxLength,
    required this.controller,
    required this.hintText,
    this.counterText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.validator,
    required this.inputFormatters,
    this.textCapitalization,
    this.keyboardType,
    this.fontSize = AppDimen.size14,
    this.fontWeight = FontWeight.w400,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textCapitalization: TextCapitalization.none,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLength: maxLength,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: counterText,
      ),
      obscureText: obscureText,
      textInputAction: textInputAction,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
    );
  }
}
