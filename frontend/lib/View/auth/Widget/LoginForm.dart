
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

