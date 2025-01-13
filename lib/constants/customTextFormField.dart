// Flutter imports:
import 'package:crepto/color/colors.dart';
import 'package:crepto/constants/responsive.dart';
import 'package:flutter/material.dart';

// Project imports:


class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final bool? isDense;
  final Color? fillColor;
  final Color? borderColor;
  final bool? obscureText;
  final bool? readOnly;
  final bool? autoFocus;
  final int? maxLength;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.controller,
    this.focusNode,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.borderColor,
    this.validator,
    this.prefixIcon,
    this.filled,
    this.fillColor,
    this.isDense,
    this.textInputType,
    this.onTap,
    this.maxLength,
    this.readOnly,
    this.autoFocus,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText!,
        keyboardType: textInputType,
        onTap: onTap,
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: CryptoColor.cardBox, // Set hint color
            fontSize: 14.0, // Set hint text size
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          prefixIcon: prefixIcon,
          fillColor: CryptoColor.textFormField,
          filled: true,
          counterText: "",
          isDense: isDense ?? true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent, // Remove border color
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent, // Remove border color
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 12,
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.red, // Set the default border color
            ),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }


}
