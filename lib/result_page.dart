import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final int age;
  final double weight;
  final double height;
  final String gender;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
  });

  String get _bmiCategory {
    if (bmi < 16) return "Very Severely Underweight";
    if (bmi < 17) return "Severely Underweight";
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  Color get _bmiColor {
    if (bmi < 18.5) return const Color(0xFF4A90D9);
    if (bmi < 25) return const Color(0xFF1ECFB0);
    if (bmi < 30) return const Color(0xFFF5A623);
    return const Color(0xFFE74C3C);
  }

  String get _bmiMessage {
    if (bmi < 18.5) return "You are Underweight!";
    if (bmi < 25) return "You have Normal body weight!";
    if (bmi < 30) return "You are Overweight!";
    return "You are Obese!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB2F0E0), Color(0xFF80E8D0), Color(0xFF4DD9C0)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_rounded,
                          color: Color(0xFF2C3E50)),
                    ),
                    const Icon(Icons.notifications_rounded,
                        color: Color(0xFF2C3E50)),
                  ],
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your BMI Result",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2C3E50),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1ECFB0).withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
                    child: Column(
                      children: [

                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _bmiColor,
                              width: 8,
                            ),
                            color: _bmiColor.withOpacity(0.08),
                          ),
                          child: Center(
                            child: Text(
                              bmi.toStringAsFixed(1),
                              style: GoogleFonts.poppins(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2C3E50),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          _bmiMessage,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _bmiColor,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FAF7),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: const Color(0xFFD0EDE5), width: 1.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _infoItem("Age", "$age"),
                              _divider(),
                              _infoItem("Weight", "${weight.toStringAsFixed(1)} Kg"),
                              _divider(),
                              _infoItem("Height", "${height.toStringAsFixed(0)} Cm"),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "BMI Categories",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2C3E50),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              _categoryRow("Very Severely Underweight", "< 16", const Color(0xFF4A90D9), bmi < 16),
                              _categoryRow("Severely Underweight", "16.0 - 16.9", const Color(0xFF5BA8E8), bmi >= 16 && bmi < 17),
                              _categoryRow("Underweight", "17.0 - 18.4", const Color(0xFF7EC8F0), bmi >= 17 && bmi < 18.5),
                              _categoryRow("Normal", "18.5 - 24.9", const Color(0xFF1ECFB0), bmi >= 18.5 && bmi < 25),
                              _categoryRow("Overweight", "25.0 - 29.9", const Color(0xFFF5A623), bmi >= 25 && bmi < 30),
                              _categoryRow("Obese", "≥ 30.0", const Color(0xFFE74C3C), bmi >= 30),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),
                        
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1ECFB0),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              "Recalculate BMI",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF888888),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 36,
      color: const Color(0xFFD0EDE5),
    );
  }

  Widget _categoryRow(String label, String range, Color color, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? color.withOpacity(0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isActive ? color : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? color : const Color(0xFF555555),
              ),
            ),
          ),
          Text(
            range,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive ? color : const Color(0xFF888888),
            ),
          ),
        ],
      ),
    );
  }
}