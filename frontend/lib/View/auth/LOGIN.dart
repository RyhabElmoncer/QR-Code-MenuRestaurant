import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widget/SignUpForm.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  bool checkbox1 = false;
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(0.5),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape7.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    width: 100.w,
                    height: 58.h,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome back!",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          SizedBox(height: 1.h),
                          LoginForm(
                              loginEmail: loginEmail,
                              loginForm: loginForm,
                              loginPassword: loginPassword),
                        ]),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/shape6.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class SIGNUP extends StatefulWidget {
  const SIGNUP({super.key});

  @override
  State<SIGNUP> createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {
  bool? checkbox1 = false;
  GlobalKey<FormState> signupForm = GlobalKey<FormState>();
  TextEditingController signupUsername = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController signupPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(0.5),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/images/shape8.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                    width: 100.w,
                    height: 68.h,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          SignUpForm(
                              signupEmail: signupEmail,
                              signupForm: signupForm,
                              signupPassword: signupPassword,
                              signupPhone: signupPhone,
                              signupUsername: signupUsername),
                        ]),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 17.h,
                    child: Image.asset(
                      "assets/images/shape9.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class LoginForm extends StatelessWidget {
  final GlobalKey loginForm;
  final TextEditingController loginPassword;
  final TextEditingController loginEmail;

  const LoginForm({
    super.key,
    required this.loginEmail,
    required this.loginForm,
    required this.loginPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginForm,
      child: Column(
        children: [
          TextFormField(
            controller: loginEmail,
            validator: (val) {
              if (val!.length < 10) {
                return "Invalid Email, must be greater than 10 characters";
              }
              return null;
            },
            style: TextStyle(fontSize: 12.sp),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              label: Text(
                "Email",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
            validator: (val) {
              if (val!.length < 8) {
                return "Weak password, must be at least 8 characters";
              }
              return null;
            },
            controller: loginPassword,
            style: TextStyle(fontSize: 12.sp),
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              label: Text(
                "Password",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          MaterialButton(
            onPressed: () {
              // Placeholder for login functionality
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 168, 37),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              height: 6.h,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 12.sp),
              ),
              TextButton(
                onPressed: () {
                  // Placeholder for navigation to signup
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin?",
                style: TextStyle(fontSize: 12.sp),
              ),
              TextButton(
                onPressed: () {
                  // Placeholder for admin login
                },
                child: Text(
                  "Click here",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
