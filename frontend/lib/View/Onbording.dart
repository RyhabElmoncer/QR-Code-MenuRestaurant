import 'package:flutter/material.dart';


class Onboarding3 extends StatefulWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/Obord3.png', // Replace 'assets/background_image.jpg' with the path to your image
              //fit: BoxFit.cover,
              // width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: Text(
                      'Suivante',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}