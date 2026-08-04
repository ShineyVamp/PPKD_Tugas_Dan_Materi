import 'package:flutter/material.dart';

class CustomGlowingNavBar extends StatefulWidget {
  const CustomGlowingNavBar({super.key});

  @override
  State<CustomGlowingNavBar> createState() => _CustomGlowingNavBarState();
}

class _CustomGlowingNavBarState extends State<CustomGlowingNavBar> {
  int _selectedIndex = 0;

  // Daftar ikon navigasi
  final List<IconData> _icons = [Icons.home_outlined, Icons.search_rounded];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Center(
        child: Text(
          'Halaman Terpilih: $_selectedIndex',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 20, right: 20),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFF0F0F11), // Warna latar belakang gelap
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Menghitung lebar responsif untuk tiap item
              final double itemWidth = constraints.maxWidth / _icons.length;
              const double circleSize = 50.0;

              return Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // 1. Indikator Ungu Bercahaya yang Bergerak (Animated Glow Circle)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves
                        .easeOutSine, // Memberikan efek membal/elastis halus
                    left:
                        _selectedIndex * itemWidth +
                        (itemWidth - circleSize) / 2,
                    child: Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFA020F0), // Ungu muda terang
                            Color(0xFF6B00D7), // Ungu tua
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),

                  // 2. Baris Ikon Navigasi
                  Row(
                    children: List.generate(_icons.length, (index) {
                      final isSelected = _selectedIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Center(
                            child: Icon(
                              _icons[index],
                              color: isSelected ? Colors.white : Colors.white54,
                              size: 26,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
