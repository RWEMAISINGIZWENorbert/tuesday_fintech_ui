import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' show min;

class StackedCard1 extends StatelessWidget {
  final double width;
  final double height;
  final String bankName;
  final String last4;

  const StackedCard1({
    Key? key,
    this.width = 320,
    this.height = 200,
    this.bankName = 'Dhaka\nBank Ltd',
    this.last4 = '0959',
  }) : super(key: key);

  Widget _cardLayer({
    required Color color,
    required double offsetX,
    required BorderRadius borderRadius,
    required double w,
    required double h,
    Gradient? gradient,
    double? top,
    double? bottom,
    double? right,
    double opacity = 1.0,
  }) {
    return Positioned(
      left: offsetX,
      top: top,
      right: right,
      bottom: bottom,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            gradient: gradient,
            color: gradient == null ? color : null,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.wifi_rounded,
                      color: Colors.white.withOpacity(0.3),
                      size: 22,
                    ),
                    const Spacer(),
                    // Overlapping circles icon
                    SizedBox(
                      height: 40,
                      width: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.06),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 14,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.06),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(22);
    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveW = constraints.maxWidth.isFinite
            ? min(width, constraints.maxWidth)
            : width;
        final effectiveH = constraints.maxHeight.isFinite
            ? min(height, constraints.maxHeight)
            : height;

        return SizedBox(
          width: effectiveW + 400, // Increased to accommodate wider spacing
          height: effectiveH,
          child: Stack(
            fit: StackFit.loose, // Allow children to size naturally
            clipBehavior: Clip.none,
            children: [
              // Back-most card (dark)
              _cardLayer(
                color: Color(0xFF0D1020),
                offsetX: 80,
                borderRadius: borderRadius,
                w: effectiveW,
                h: effectiveH - 40,
                opacity: 0.75,
              ),
              // Middle card (purple)
              _cardLayer(
                color: Colors.deepPurple,
                offsetX: 40,
                borderRadius: borderRadius,
                w: effectiveW - 20,
                h: effectiveH - 20,
                gradient: LinearGradient(
                  colors: [Color(0xFF5B3FE7), Color(0xFF4B2AD6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                opacity: 0.85,
              ),
              // Front card (main)
              Positioned(
                left: 0,
                child: Container(
                  width: effectiveW - 40,
                  height: effectiveH ,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [Color(0xFF171826), Color(0xFF0B0D14)],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft ,
                        // tileMode: TileMode.clamp,
                        colors: <Color>[
                         Color(0xFF171826),
                         Color.fromARGB(255, 46, 47, 59),
                         Color(0xFF0B0D14)
                        ]
                        ),
                    borderRadius: borderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row: logo and NFC
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // small diamond logo
                          Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.grid_view_rounded,
                                size: 14,
                                color: Color(0xFF1A1B29),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.wifi_rounded,
                            color: Colors.white38,
                            size: 22,
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Bank name
                      Text(
                        bankName,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 26,
                          height: 1.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      // Card number label + masked number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card number',
                            style: GoogleFonts.poppins(
                              color: Colors.white38,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                '**** ****',
                                style: GoogleFonts.poppins(
                                  color: Colors.white54,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                last4,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              // Overlapping circles (mastercard-like)
                              SizedBox(
                                height: 55,
                                width: 50,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      right: 14,
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.06),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.06),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}