import 'package:clean_blog_app/core/theme/app_pallate.dart';
import 'package:clean_blog_app/features/auth/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String isi;
  final VoidCallback onPressed;
  const AuthGradientButton({super.key, required this.isi, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppPallete.gradient1, AppPallete.gradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          isi,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
