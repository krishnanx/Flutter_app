import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/search.dart';
import 'package:flutter_task/widgets/category_select.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = "electronics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Align(alignment: Alignment.centerLeft, child: BackButton()),
              const Center(
                child: Text(
                  "Search",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: const Search(),
            ),
            const SizedBox(height: 20),

            // Category Select with callback
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategorySelect(
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                      print("Selected category: $selectedCategory");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
