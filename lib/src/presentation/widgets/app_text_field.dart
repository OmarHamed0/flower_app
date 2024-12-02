import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/styles/app_radius.dart';
import '../../../core/styles/colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.helperText,
    this.errorText,
    this.suffixIcon,
    this.suffixIconConstraints =
        const BoxConstraints(minHeight: 24, minWidth: 40),
    this.prefixIcon,
    this.prefixIconConstraints =
        const BoxConstraints(minHeight: 24, minWidth: 40),
    this.autofillHints,
    this.onEditingComplete,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.onSaved,
  });

  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final bool enabled;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<String>?
      validator; // Fixed: Updated type to match TextFormField's validator
  final String? helperText;
  final String? errorText;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final FormFieldSetter<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        autofillHints: autofillHints,
        controller: controller,
        enabled: enabled,
        obscureText: obscureText,
        onChanged: onChanged,
        autovalidateMode: autovalidateMode,
        validator: validator, // Now properly typed
        maxLines: maxLines,
        cursorHeight: 16,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          helperText: helperText,
          errorText: errorText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconConstraints: suffixIconConstraints,
          prefixIconConstraints: prefixIconConstraints,
          filled: true,
          fillColor: AppColors.kWhiteBase,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kGray,
              width: 1.5,
            ),
            borderRadius: AppBorderRadius.xs,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kGray,
              width: 1.5,
            ),
            borderRadius: AppBorderRadius.xs,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.error,
              width: 1.5,
            ),
            borderRadius: AppBorderRadius.xs,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.error,
              width: 1.5,
            ),
            borderRadius: AppBorderRadius.xs,
          ),
        ),
      ),
    );
  }
}
