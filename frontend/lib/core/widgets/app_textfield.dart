import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController controller;

  final String hintText;

  final int maxLines;

  final TextInputType keyboardType;

  final IconData? prefixIcon;

  final bool enabled;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,

      maxLines: maxLines,

      keyboardType: keyboardType,

      enabled: enabled,

      style: const TextStyle(
        fontSize: 15,
        color: AppColors.textPrimary,
      ),

      decoration: InputDecoration(

        hintText: hintText,

        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          height: 1.5,
        ),

        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColors.textSecondary,
              )
            : null,

        filled: true,
        fillColor: Colors.white,

        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(18),

          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(18),

          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(18),

          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(18),

          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
    );
  }
}