import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    this.isPasswordVisible = true,
    this.showPassword,
    this.onChanged,
    this.enabled = true,
    this.changePasswordTap,
  });

  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  bool isPasswordVisible;
  void Function()? showPassword;
  void Function(String)? onChanged;
  bool? enabled;
  void Function()? changePasswordTap;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    // If changePasswordTap is not null, set initial value to "aaaaaaaa" or any string of length 8
    if (widget.changePasswordTap != null) {
      widget.controller?.value = const TextEditingValue(
          text: '*********'); // Setting a default value of length 8
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: (_isFocused && widget.showPassword != null)
            ? IconButton(
                onPressed: widget.showPassword,
                icon: Icon(
                  widget.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off, // Toggle icon
                  color: Colors.grey.shade600,
                ),
              )
            : widget.changePasswordTap != null
                ? TextButton(
                    onPressed: widget.changePasswordTap,
                    child: const Text('Change',
                        style: TextStyle(
                            color: AppColors.kBaseColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)))
                : null,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _isFocused
              ? Colors.blue
              : Colors.grey.shade400, // Focused label color
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        filled: true,
        fillColor: Colors.white, // Lighter background color
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          borderSide: BorderSide(
            color: _isFocused
                ? Colors.blue
                : Colors.grey.shade300, // Border color when focused
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          borderSide: const BorderSide(
            color: Colors.blue, // Focused border color
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText:
          widget.showPassword == null ? false : widget.isPasswordVisible,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        color: Colors.black, // Text color
      ),
    );
  }
}
