import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/search.dart';
import 'package:flutter_task/widgets/category_select.dart';
import 'package:flutter_task/widgets/popular_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_task/providers/product_providers.dart";
import 'package:flutter_task/widgets/editors_choice.dart';
import 'package:flutter_task/screens/details_screen.dart';
import 'package:flutter_task/models/product.dart';
import 'package:another_flushbar/flushbar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String selectedCategory = "electronics";
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final popularProducts = ref.watch(
      categoryProductProvider(selectedCategory),
    );
    final editorsChoice = ref.watch(categoryProductProvider(selectedCategory));
    bool _errorShown = false;
    void _showErrorFlushbar(BuildContext context, String message) {
      if (_errorShown) return;

      _errorShown = true;

      Flushbar(
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: Colors.red.shade400,
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.error_outline, color: Colors.white),
      ).show(context);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: BackButton()),

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
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: Search(controller: searchController),
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
            SizedBox(height: 20),
            _popular(popularProducts, _showErrorFlushbar, _errorShown),
            SizedBox(height: 40),
            _editors(editorsChoice, _showErrorFlushbar, _errorShown),
          ],
        ),
      ),
    );
  }

  Widget _popular(
    AsyncValue<List<Product>> popularProducts,
    void Function(BuildContext, String) showErrorFlushbar,
    bool errorShown,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Popular Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),

            Text(
              "View All",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF70B9BE),
              ),
            ),
          ],
        ),
        Center(
          child: SizedBox(
            height: 174,
            child: popularProducts.when(
              data:
                  (products) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: PopularSearch(
                          title: products[index].title,
                          image: products[index].image,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) =>
                                        DetailsScreen(product: products[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (err, stack) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showErrorFlushbar(context, "Check your network");
                });
                return const Center(child: Text("Something went wrong"));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _editors(
    AsyncValue<List<Product>> editorsChoice,
    void Function(BuildContext, String) showErrorFlushbar,
    bool errorShown,
  ) {
    return (Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Editors Choice",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),

            Text(
              "View All",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF70B9BE),
              ),
            ),
          ],
        ),
        Center(
          child: SizedBox(
            height: 300,
            child: editorsChoice.when(
              data:
                  (products) => ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: EditorsChoice(
                          title: products[index].title,
                          image: products[index].image,

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) =>
                                        DetailsScreen(product: products[index]),
                              ),
                            );
                          },
                          Width: 108,
                          Height: 80,
                        ),
                      );
                    },
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (err, stack) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showErrorFlushbar(context, "Check your network");
                });
                return const Center(child: Text("Something went wrong"));
              },
            ),
          ),
        ),
      ],
    ));
  }
}
