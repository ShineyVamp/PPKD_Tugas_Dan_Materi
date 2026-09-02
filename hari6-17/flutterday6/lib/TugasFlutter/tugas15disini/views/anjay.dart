import 'package:flutter/material.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/models/market_models.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/services/api_services_tugas.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/services/dio_client.dart';
import 'package:google_fonts/google_fonts.dart';

class Anjay extends StatefulWidget {
  const Anjay({super.key});

  @override
  State<Anjay> createState() => _AnjayState();
}

class _AnjayState extends State<Anjay> {
  late final ApiService _apiService;
  late Future<List<Market>> _marketFuture;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffE0E5EC),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFA3B1C6).withValues(alpha: 0.8),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 6,
                    offset: const Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.8),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 6,
                    offset: const Offset(-4, -4),
                  ),
                ],
              ),
              child: TextField(
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
                  final List<Market> posts = snapshot.data!;
                  return ListView.separated(
                    itemCount: posts.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                    itemBuilder: (BuildContext context, int index) {
                      final post = posts[index];
                      return Container(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            if (post.image != null && post.image!.isNotEmpty)
                              Center(
                                child: Image.network(
                                  post.image!,
                                  height: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.broken_image, size: 50),
                                ),
                              ),
                            Text(post.category?.label ?? 'Unknown'),
                            Text(
                              post.title ?? "",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              post.description ?? "",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\$${post.price.toString()}",
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                color: Color(0xff0040E0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
      ),
    );
  }
}
