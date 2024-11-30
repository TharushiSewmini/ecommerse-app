import 'dart:ui';

import 'package:ecommerce_app/components/reusableButton.dart';
import 'package:ecommerce_app/components/reusable_textfield.dart';
import 'package:ecommerce_app/pages/home/ui/home_page.dart';
import 'package:ecommerce_app/pages/landing/ui/landing_page.dart';
import 'package:ecommerce_app/pages/login/bloc/auth_bloc.dart';
import 'package:ecommerce_app/utils/AppStyles.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyles.primaryColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              //loading
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      "Logging in ...",
                      style: AppStyles.small,
                    )),
              );
            } else if (state is LoginSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      "Login Successful!",
                      style: AppStyles.small,
                    )),
              );

              // Navigate to Home Page
              Navigator.push(context, CustomPageRoute(page: Landing()));
            } else if (state is LoginErrorState) {
              // Show error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: Stack(
            children: [
              // bg Image
              Positioned.fill(
                child: Image.network(
                  "https://images.pexels.com/photos/6717680/pexels-photo-6717680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withOpacity(0.05),
                  ),
                ),
              ),

              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Baskit",
                          style: AppStyles.BigLightWhite20,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Inputs
                      Wrap(
                        runSpacing: 20,
                        children: [
                          ReusableTextField(
                            controller: emailController,
                            placeHolderText: "Enter sample username",
                          ),
                          ReusableTextField(
                            controller: passwordController,
                            placeHolderText: "Enter sample password",
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Login
                      ReusableButton(
                        ButttonText: "LOGIN",
                        onClick: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
