import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = "Male";
  String weightUnit = "Kg";
  String heightUnit = "cm";

  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.filter_list, color: Color(0xFF2C3E50)),
                    Icon(Icons.notifications_rounded, color: Color(0xFF2C3E50)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello Rupesh !",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1ECFB0).withOpacity(0.15),
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Gender",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1ECFB0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: _genderCard(
                                  "Male",
                                  color: Color(0xFF1ECFB0),
                                ),
                              ),
                              const SizedBox(width: 17),
                              Expanded(
                                child: _genderCard(
                                  "Female",
                                  color: Color(0xFF1ECFB0),
                                ),
                              ),
                            ],
                          ),
                          _sectionLabel("Age", "Years"),
                          const SizedBox(height: 8),
                          _inputField(ageController, "e.g. 22", null, null),
                          const SizedBox(height: 18),
                      
                          _sectionLabel("Weight", weightUnit),
                          const SizedBox(height: 8),
                          _inputField(
                            weightController,
                            "e.g. 65",
                            weightUnit,
                            () => setState(
                              () =>
                                  weightUnit = weightUnit == 'Kg' ? 'LBS' : 'KG',
                            ),
                          ),
                          const SizedBox(height: 18),
                      
                          _sectionLabel("Height", heightUnit),
                          const SizedBox(height: 8),
                          _inputField(
                            heightController,
                            "e.g. 170",
                            heightUnit,
                            () => setState(
                              () => heightUnit = heightUnit == 'Cm' ? 'Ft' : 'Cm',
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: _calculateBMI,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1ECFB0),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              child: Text(
                                "Calculate BMI",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )
                        ],
                      ),
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

  Widget _genderCard(String gender, {required Color color}) {
    final bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.15) : const Color(0xFFF7F9FA),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: isSelected ? color : const Color(0xFFE8ECEF),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  gender == "Male" ? "assets/male.png" : "assets/female.png",
                  fit: BoxFit.cover,
                  width: 52,
                  height: 52,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gender,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? color : const Color(0xFFAAAAAA),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String label, String unit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
        Text(
          unit,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }

  Widget _inputField(
    TextEditingController controller,
    String hint,
    String? unit,
    VoidCallback? onUnitTap,
  ) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FAF7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD0EDE5), width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: const Color(0xFF1A1A2E),
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFFBBBBBB),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (unit != null)
            GestureDetector(
              onTap: onUnitTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1ECFB0).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      unit,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1ECFB0),
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.swap_vert_rounded,
                      color: Color(0xFF0BA383),
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _calculateBMI() {
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);
    final int? age = int.tryParse(ageController.text);

    if (weight == null || height == null || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please Fill all fields",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: const Color(0xFF1ECFB0),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    double weightInKg = weightUnit == 'Lbs' ? weight * 0.453592 : weight;
    double heightInCm = heightUnit == 'Ft' ? height * 30.48 : height;
    double heightInM = heightInCm / 100;
    double bmi = weightInKg / (heightInM * heightInM);

    Navigator.push(
      context,
    MaterialPageRoute(
        builder: (_) => ResultPage(
          bmi: bmi,
          age: age,
          weight: weightInKg,
          height: heightInCm,
          gender: selectedGender,
        ),
    ),
    );
  }
}
