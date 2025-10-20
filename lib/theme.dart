
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
   brightness: Brightness.dark,
  //  primarySwatch: Colors.indigo,
  //  primarySwatch: Color(0xFF4B2AD6),
  primaryColor: Color(0xFF4B2AD6),
   scaffoldBackgroundColor: Color(0xFF0D0E1A),
   cardColor:  Color(0xFF1C1F2E),
   hintColor: Color(0xFFE7E9F3),

   textTheme: TextTheme(
     displaySmall: GoogleFonts.poppins(
            color: Colors.grey[400],
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none
            ),
   )
 ); 