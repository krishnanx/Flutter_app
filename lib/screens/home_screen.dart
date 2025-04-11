import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter_task/models/product.dart";
import "package:flutter_task/screens/cart.dart";
import "package:flutter_task/widgets/feature_cards.dart";
import "package:flutter_task/widgets/category_select.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/details_screen.dart';
import "package:flutter_task/providers/product_providers.dart";
import "package:flutter_task/widgets/popular_cards.dart";
import 'package:another_flushbar/flushbar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedCategory = "electronics";

  @override
  Widget build(BuildContext context) {
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

    categorySelect((category) {
      setState(() {
        selectedCategory = category;
      });
      print("Selected category: $selectedCategory");
    });
    final featuredProducts = ref.watch(featuredProductsProvider);
    final popularProducts = ref.watch(
      categoryProductProvider(selectedCategory),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
            child: appbar(context),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured section
            const Text(
              "Featured",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),

            _featuredSpace(
              context,
              featuredProducts,
              _showErrorFlushbar,
              _errorShown,
            ),

            const SizedBox(height: 40),

            // Category section
            categoryHeading(),
            const SizedBox(height: 10),

            categorySelect((category) {
              setState(() {
                selectedCategory = category;
              });
            }),

            const SizedBox(height: 30),
            _popularSpaceHeading(),

            // Popular Products section
            const SizedBox(height: 10),

            _popularSpace(
              context,
              popularProducts,
              _showErrorFlushbar,
              _errorShown,
            ),
          ],
        ),
      ),
    );
  }
}

Widget appbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // User greeting
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/Sun.svg', width: 18, height: 18),
                const SizedBox(width: 5),
                const Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Text(
            "Krishnan E",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
        ],
      ),

      // Cart Icon
      GestureDetector(
        onTap: () {
          // Your action here (e.g., navigate to cart screen)
          Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()));
        },
        child: SvgPicture.asset('assets/icons/Buy.svg', width: 24, height: 24),
      ),
    ],
  );
}

Widget _featuredSpace(
  BuildContext context,
  AsyncValue<List<Product>> featuredProducts,
  void Function(BuildContext, String) showErrorFlushbar,
  bool errorShown,
) {
  return SizedBox(
    height: 172,
    child: featuredProducts.when(
      data:
          (products) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FeatureCards(
                  title: products[index].title,
                  image: products[index].image,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(product: products[index]),
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
  );
}

Widget categoryHeading() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text(
        "Category",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      ),
      Text(
        "See All",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Color(0xFF70B9BE),
        ),
      ),
    ],
  );
}

Widget categorySelect(void Function(String) onCategorySelected) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [CategorySelect(onCategorySelected: onCategorySelected)],
    ),
  );
}

Widget _popularSpaceHeading() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text(
        "Popular Products",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      ),
      Text(
        "See All",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Color(0xFF70B9BE),
        ),
      ),
    ],
  );
}

Widget _popularSpace(
  BuildContext context,
  AsyncValue<List<Product>> popularProducts,
  void Function(BuildContext, String) showErrorFlushbar,
  bool errorShown,
) {
  return SizedBox(
    height: 320,
    child: popularProducts.when(
      data:
          (products) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: PopularCards(
                  product: products[index],
                  showDetails: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(product: products[index]),
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
  );
}
