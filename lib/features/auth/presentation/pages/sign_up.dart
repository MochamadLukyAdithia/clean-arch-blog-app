import 'package:clean_blog_app/core/theme/app_pallate.dart';
import 'package:clean_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_blog_app/features/auth/presentation/pages/sign_in.dart';
import 'package:clean_blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:clean_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // keyForm.currentState!.validate();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              AuthField(
                hintText: "Email",
                controller: emailController,
              ),
              AuthField(
                hintText: "Name",
                controller: nameController,
              ),
              AuthField(
                hintText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              AuthGradientButton(
                isi: "Sign Up",
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignUp(
                            email: emailController.text.trim(),
                            name: nameController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignIn();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppPallete.gradient2,
                                  ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
