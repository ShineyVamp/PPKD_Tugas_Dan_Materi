import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/models/market_models.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Anjay2 extends StatelessWidget {
  final Market market;

  const Anjay2({super.key, required this.market});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE0E5EC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xffE0E5EC),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          offset: Offset(-5, -5),
                        ),
                        BoxShadow(
                          color: Color(0xffA3B1C6),
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xff75777B),
                      size: 20,
                    ),
                  ),
                ),
                Text(
                  "Details",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff75777B),
                  ),
                ),
                const SizedBox(width: 52),
              ],
            ),
            const SizedBox(height: 30),
            if (market.image != null && market.image!.isNotEmpty)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: const Color(0xffE0E5EC),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 16,
                        offset: Offset(-9, -9),
                      ),
                      BoxShadow(
                        color: Color(0xffA3B1C6),
                        blurRadius: 16,
                        offset: Offset(9, 9),
                      ),
                    ],
                  ),
                  child: Image.network(
                    market.image!,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            const SizedBox(height: 32),
            Text(
              market.category?.label ?? 'Unknown',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              market.title ?? "",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            // SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.star_rounded, color: Colors.amber, size: 24),
                const SizedBox(width: 6),
                Text(
                  market.rating?.rate != null
                      ? market.rating!.rate.toString()
                      : "0.0",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "(${market.rating?.count ?? 0} reviews)",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xff75777B),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 16),
            Text(
              "\$${market.price.toString()}",
              style: GoogleFonts.inter(
                fontSize: 28,
                color: const Color(0xff0040E0),
                fontWeight: FontWeight.w700,
              ),
            ),
            // SizedBox(height: 24),
            Text(
              "Description",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              market.description ?? "",
              style: GoogleFonts.inter(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: const Color(0xff4A4C50),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xffE0E5EC),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 16,
                    offset: Offset(-9, -9),
                  ),
                  BoxShadow(
                    color: Color(0xffA3B1C6),
                    blurRadius: 16,
                    offset: Offset(9, 9),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_shopping_cart,
                      color: Color(0xff0040E0),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Add To Cart",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: const Color(0xff0040E0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
