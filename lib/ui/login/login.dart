import 'package:ecomm_391/domain/constants/app_routes.dart';
import 'package:ecomm_391/ui/bloc/user/user_bloc.dart';
import 'package:ecomm_391/ui/bloc/user/user_event.dart';
import 'package:ecomm_391/ui/bloc/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/utils/button_helper.dart';
import '../custom_widgets/custume_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;

  bool isLoading = false;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), // <-- your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 100,
            right: 100,
            top: 40,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage("assets/logo/bglog.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Bottom sheet container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Account Verified to Login",
                        //"Account Verified successfully",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email / Phone field
                      CustomTextField(
                        label: "Email/Phone Number",
                        controller: emailController,
                        validator: (value) =>
                            value!.isEmpty ? "Enter your email or phone" : null,
                      ),
                      const SizedBox(height: 16),

                      // Password field
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        obscure: true,
                        validator: (value) =>
                            value!.isEmpty ? "Enter your password" : null,
                      ),

                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?"),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Login Button
                      BlocConsumer<UserBloc, UserState>(
                        buildWhen: (ps,cs){
                          return isLogin;
                        },
                        listenWhen: (ps,cs){
                          return isLogin;
                        },
                        listener: (_, state) {
                          if (state is UserLoadingState) {
                            isLoading = true;
                          }

                          if (state is UserSuccessState) {
                            isLoading = false;
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.dashboard,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login Successfully!!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                          if (state is UserFailureState) {
                            isLoading = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMsg),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }

                        },
                        builder: (context, state) {
                          return UiButtonHelper().CustomButtonFlex(
                            callback: () {
                              if (_formKey.currentState!.validate()) {
                                isLogin = true;
                                context.read<UserBloc>().add(
                                  LoginUserEvent(
                                    email: emailController.text,
                                    pass: passwordController.text,
                                  ),
                                );
                              }
                            },
                            buttonName: isLoading ? "Logging In..." : "Login",
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          isLogin = false;
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        child: const Text("Don't have an account? Sign Up"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
