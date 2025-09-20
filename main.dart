import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // ✅ Replaced skeleton_text

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skeleton Loader',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("GeeksForGeeks"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemCount: 5,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const ShimmerListTile(); // ✅ Reusable component
          },
        ),
      ),
    );
  }
}

// ✅ NEW: Reusable shimmer tile widget
class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black12,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // 🖼️ Avatar placeholder
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              // 📝 Text lines
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📌 First line
                    Container(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // 📌 Second line
                    Container(
                      height: 14,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
