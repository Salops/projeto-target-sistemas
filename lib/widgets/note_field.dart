import 'package:flutter/material.dart';
import 'package:projeto_target_sistemas/theme/app_colors.dart';
import 'package:projeto_target_sistemas/widgets/custom_text_filed.dart';

class NoteField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;

  const NoteField({
    required this.controller,
    required this.onSaved,
    required this.focusNode,
    required this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Digite seu texto',
      textAlign: TextAlign.center,
      autofocus: true,
      focusNode: focusNode,
      controller: controller,
      hintStyle: const TextStyle(color: AppColors.black),
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O texto não pode estar vazio.';
        }
        return null;
      },
    );
  }
}
