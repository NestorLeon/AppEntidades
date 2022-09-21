import 'package:ejemplo_1/classes/ordenamiento.dart';
import 'package:ejemplo_1/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  Ordenamiento.poblarLista();

  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          iconSize: 25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
  );
}
