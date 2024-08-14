import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey signupForm;
  final TextEditingController signupPassword;
  final TextEditingController signupEmail;
  final TextEditingController signupUsername;
  final TextEditingController signupPhone;

  const SignUpForm({
    super.key,
    required this.signupEmail,
    required this.signupForm,
    required this.signupPassword,
    required this.signupPhone,
    required this.signupUsername,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupForm,
      child: Column(
        children: [
          TextFormField(
            validator: (val) {
              if (val!.length < 4) {
                return "Invalid username, must be at least 4 characters";
              }
              return null;
            },
            controller: signupUsername,
            style: TextStyle(fontSize: 12.sp),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              label: Text(
                "Username",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val!.length < 10) {
                return "Invalid Email, must be at least 10 characters";
              }
              return null;
            },
            controller: signupEmail,
            style: TextStyle(fontSize: 12.sp),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              label: Text(
                "Email",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val!.length < 11) {
                return "Invalid phone number, must be at least 11 characters";
              }
              return null;
            },
            controller: signupPhone,
            style: TextStyle(fontSize: 12.sp),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              label: Text(
                "Phone",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val!.length < 8) {
                return "Weak password, must be at least 8 characters";
              }
              return null;
            },
            controller: signupPassword,
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
              // Placeholder for signup functionality
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 168, 37),
                borderRadius: BorderRadius.circular(10.sp),
              ),
              height: 6.h,
              child: Center(
                child: Text(
                  "Sign Up",
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
                "Already have an account? ",
                style: TextStyle(fontSize: 12.sp),
              ),
              TextButton(
                onPressed: () {
                  // Placeholder for navigation to login
                },
                child: Text(
                  "Login",
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
