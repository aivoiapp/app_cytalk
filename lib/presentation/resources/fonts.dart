import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart'; // Importa tus colores

class AppTextStyles {
  // Títulos Grandes (Ej: "Cómo te llamas?")
  static TextStyle get headlineLarge => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Títulos Medios (Ej: "Prueba de Nivel")
  static TextStyle get headlineMedium => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 67, 61, 61),
  );

  // Subtítulos (Ej: "Nos encantaría conocerte")
  static TextStyle get subtitle => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: const Color.fromARGB(255, 53, 49, 49),
  );

  static TextStyle get itensGender => GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: const Color.fromARGB(255, 53, 49, 49),
  );

  // Texto del cuerpo (Ej: Descripción en Test Intro)
  static TextStyle get body => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
  );

  // Texto de Labels (Ej: "Nombre", "Edad")
  static TextStyle get label => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Semi-bold
    color: AppColors.primaryText,
  );

  // Texto dentro de Inputs
  static TextStyle get input => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: const Color.fromARGB(255, 26, 24, 24),
  );

  // Texto de Placeholders
  static TextStyle get placeholder => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.placeholderText,
  );

  // Texto de Botones
  static TextStyle get button => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    letterSpacing: 0.5,
  );

  // Texto para opciones de radio
  static TextStyle get radioLabel => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
  );

  // Texto pequeño (Ej: Nivel A2 en quiz)
  static TextStyle get caption => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
  );

  // Texto para la cuenta atrás (grande)
  static TextStyle get timer => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );
}
