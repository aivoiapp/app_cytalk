import 'package:flutter/material.dart';

Color colorBase(bool isDarkMode) => isDarkMode ? Colors.black : Colors.white;
Color colorBottomNavegation(bool isDarkMode) =>
    isDarkMode ? const Color(0xff222222) : Colors.white;
Color colorAppBar(bool isDarkMode) =>
    isDarkMode ? const Color.fromARGB(255, 42, 47, 53) : Colors.white60;

Color colorBell(bool isDarkMode) =>
    isDarkMode ? const Color.fromARGB(255, 42, 47, 53) : Colors.white;

Color colorSelectCategory(bool isDarkMode) => isDarkMode
    ? const Color.fromARGB(146, 80, 117, 168)
    : const Color(0xffe1f7f6);

Color colorHead(bool isDarkMode) =>
    isDarkMode ? Colors.red.shade900 : const Color(0xfffa6e68);

Color colorSexo(bool isDarkMode) => isDarkMode
    ? const Color.fromARGB(255, 240, 222, 111)
    : const Color(0xfffaf0af);

Color colorEdad(bool isDarkMode) => isDarkMode
    ? const Color.fromARGB(255, 191, 134, 133)
    : const Color(0xfffde0df);

Color colorPeso(bool isDarkMode) => isDarkMode
    ? const Color.fromARGB(255, 177, 153, 197)
    : const Color(0xffefdbff);

Color colorVacunado(bool isDarkMode) => isDarkMode
    ? const Color.fromARGB(255, 89, 212, 118)
    : const Color(0xff7cd991);

Color colorLocation(bool isDarkMode) =>
    isDarkMode ? Colors.blue : const Color(0xff8ebbe3);

Color colorLocationFondo(bool isDarkMode) =>
    isDarkMode ? Colors.blue.shade100 : const Color(0xffe7f1f9);

Color colorBubleFondo(bool isDarkMode) =>
    isDarkMode ? Colors.grey.shade400 : const Color(0xffeaefef);

Color colorBubleIcon(bool isDarkMode) =>
    isDarkMode ? Colors.black : const Color(0xff5c6364);

Color colorTopDetailAnimal(bool isDarkMode) =>
    isDarkMode ? Colors.black : const Color(0xfff8fafa);

Color colorSearch(bool isDarkMode) =>
    isDarkMode ? const Color(0xff222222) : Colors.grey.shade200;
