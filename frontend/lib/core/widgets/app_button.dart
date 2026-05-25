import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: height,

      child: ElevatedButton(

        onPressed: isLoading
            ? null
            : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(18),
          ),
        ),

        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,

                child:
                    CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 10),
                  ],

                  Text(
                    text,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}