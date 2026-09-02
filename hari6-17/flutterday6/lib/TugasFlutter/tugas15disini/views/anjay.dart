import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/models/market_models.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/services/api_services_tugas.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/services/dio_client.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/views/anjay2.dart';
import 'package:flutterday6/extension/navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Anjay extends StatefulWidget {
  const Anjay({super.key});

  @override
  State<Anjay> createState() => _AnjayState();
}

class _AnjayState extends State<Anjay> {
  late final ApiService _apiService;
  late Future<List<Market>> _marketFuture;
  Category? _selectedCategory;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _marketFuture = _apiService.getAllPosts();
  }

  void refreshList() {
    setState(() {
      _marketFuture = _apiService.getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0E5EC),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 100, 40, 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffE0E5EC),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFA3B1C6),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 6,
                    offset: const Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurStyle: BlurStyle.normal,
                    blurRadius: 6,
                    offset: const Offset(-4, -4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSansLimbu(
                    fontSize: 16,
                    color: Color(0xff75777B),
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Color(0xff75777B),
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = null;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffE0E5EC),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: _selectedCategory == null
                          ? [
                              const BoxShadow(
                                color: Color(0xFFA3B1C6),
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                              const BoxShadow(
                                color: Colors.white,
                                blurRadius: 4,
                                offset: Offset(-2, -2),
                              ),
                            ]
                          : [
                              const BoxShadow(
                                color: Color(0xFFA3B1C6),
                                blurRadius: 6,
                                offset: Offset(4, 4),
                              ),
                              const BoxShadow(
                                color: Colors.white,
                                blurRadius: 6,
                                offset: Offset(-4, -4),
                              ),
                            ],
                    ),
                    child: Text(
                      "All",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: _selectedCategory == null
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: _selectedCategory == null
                            ? const Color(0xff0040E0)
                            : const Color(0xff75777B),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ...Category.values
                    .where((element) => element != Category.UNKNOWN)
                    .map((e) {
                      final isSelected = _selectedCategory == e;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = isSelected ? null : e;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffE0E5EC),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: isSelected
                                  ? [
                                      const BoxShadow(
                                        color: Color(0xFFA3B1C6),
                                        blurRadius: 4,
                                        offset: Offset(2, 2),
                                      ),
                                      const BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 4,
                                        offset: Offset(-2, -2),
                                      ),
                                    ]
                                  : [
                                      const BoxShadow(
                                        color: Color(0xFFA3B1C6),
                                        blurRadius: 6,
                                        offset: Offset(4, 4),
                                      ),
                                      const BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 6,
                                        offset: Offset(-4, -4),
                                      ),
                                    ],
                            ),
                            child: Text(
                              e.label,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                color: isSelected
                                    ? const Color(0xff0040E0)
                                    : const Color(0xff75777B),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: FutureBuilder(
              future: _marketFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada data post.'));
                }
                final List<Market> aposts = snapshot.data!;
                final List<Market> posts = aposts.where((e) {
                  final matchesCategory =
                      _selectedCategory == null ||
                      e.category == _selectedCategory;
                  final matchesSearch = (e.title ?? '').toLowerCase().contains(
                    _searchQuery.toLowerCase(),
                  );
                  return matchesCategory && matchesSearch;
                }).toList();
                if (posts.isEmpty) {
                  return Center(child: Text('Tidak ada data produk.'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
                  clipBehavior: Clip.hardEdge,
                  itemCount: posts.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 50),
                  itemBuilder: (BuildContext context, int index) {
                    final post = posts[index];
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color(0xffE0E5EC),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurStyle: BlurStyle.normal,
                            blurRadius: 16,
                            offset: Offset(-9, -9),
                          ),
                          BoxShadow(
                            color: Color(0xffA3B1C6),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 16,
                            offset: Offset(9, 9),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          if (post.image != null && post.image!.isNotEmpty)
                            Center(
                              child: Container(
                                padding: EdgeInsets.all(40),
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Color(0xffE0E5EC),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurStyle: BlurStyle.normal,
                                      blurRadius: 16,
                                      offset: Offset(-9, -9),
                                    ),
                                    BoxShadow(
                                      color: Color(0xffA3B1C6),
                                      blurStyle: BlurStyle.normal,
                                      blurRadius: 16,
                                      offset: Offset(9, 9),
                                    ),
                                  ],
                                ),
                                child: Image.network(
                                  post.image!,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.broken_image, size: 50),
                                ),
                              ),
                            ),
                          SizedBox(height: 32),
                          Text(post.category?.label ?? 'Unknown'),
                          Text(
                            post.title ?? "",
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            post.description ?? "",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "\$${post.price.toString()}",
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              color: Color(0xff0040E0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    context.push(Anjay2(market: post));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xffE0E5EC),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurStyle: BlurStyle.normal,
                                          blurRadius: 16,
                                          offset: Offset(-9, -9),
                                        ),
                                        BoxShadow(
                                          color: Color(0xffA3B1C6),
                                          blurStyle: BlurStyle.normal,
                                          blurRadius: 16,
                                          offset: Offset(9, 9),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Center(
                                        child: Text(
                                          "See Details",
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            color: Color(0xff0040E0),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xffE0E5EC),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurStyle: BlurStyle.normal,
                                        blurRadius: 16,
                                        offset: Offset(-9, -9),
                                      ),
                                      BoxShadow(
                                        color: Color(0xffA3B1C6),
                                        blurStyle: BlurStyle.normal,
                                        blurRadius: 16,
                                        offset: Offset(9, 9),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment: .center,
                                      children: [
                                        Icon(
                                          Icons.add_shopping_cart,
                                          color: Color(0xff0040E0),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Add To Cart",
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            color: Color(0xff0040E0),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
