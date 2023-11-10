import 'package:flutter/material.dart';
import 'package:projeto_target_sistemas/theme/app_colors.dart';
import 'package:projeto_target_sistemas/widgets/vertical_spacing.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final bool? obscureText;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool onlyBorderError;
  final String? errorMessage;
  final String? initialValue;
  final Widget? prefix;
  final bool? autofocus;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final TextEditingController? controller;

  const CustomTextField({
    this.label,
    this.errorMessage,
    this.obscureText = false,
    this.onlyBorderError = false,
    this.prefix,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.initialValue,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.white,
              ),
            ),
          ),
        const VerticalSpacing(
          spacing: 4,
        ),
        TextFormField(
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          textAlign: textAlign ?? TextAlign.start,
          initialValue: initialValue,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: hintStyle,
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: onlyBorderError
                ? const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: AppColors.error, width: 2),
                  )
                : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
            focusedBorder: onlyBorderError
                ? const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: AppColors.error, width: 2),
                  )
                : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: prefix,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
            errorText: errorMessage,
            errorMaxLines: 4,
            errorStyle: const TextStyle(
              color: AppColors.error,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
          ),
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
