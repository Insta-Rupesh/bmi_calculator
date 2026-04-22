import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bmi_input_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB2F0E0), Color(0xFF80E8D0), Color(0xFF4DD9C0)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 180),
                Text("BMI",
                style: GoogleFonts.poppins(
                  fontSize: 150,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                  height: 1,
                  letterSpacing: 2,
                ),),
              SizedBox(height: 0.01),
                Text("Calculator",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF2C3E50),
                  letterSpacing: -0.5,
                ),),
                SizedBox(height: 5,),
                Text("Welcome to BMI Calculator, your personal"
                    "\ntool for tracking your Body Mass Index (BMI)"
                    "\nand monitoring your health.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF2C3E50),
                ),),
                SizedBox(height: 330,),
                SizedBox(
                  width: double.infinity,
                    height: 56,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const InputPage()));
                  } ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C3E50),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )
                    ),
                    child: Text("START",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),) ),
                )
              ],
            )
          )
        )
      ),
    );
  }
}
