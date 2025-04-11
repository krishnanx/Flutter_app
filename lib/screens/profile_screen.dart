import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/widgets/editors_choice.dart';
import 'package:flutter_task/widgets/popular_cards.dart';
import '../models/product.dart';
import '../providers/favorite_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});
  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProductIds = ref.watch(favoriteProvider);
    final allProductsAsync = ref.watch(allProductsProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    "assets/icons/Setting.svg",
                    width: 20,
                    height: 21,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 20,
          bottom: 60,
        ),
        child: Column(
          children: [
            _accDisplay(),
            SizedBox(height: 30),
            _favouritesHeading(context),
            SizedBox(height: 20),
            allProductsAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) {
                return const Center(child: Text("Error loading favorites"));
              },
              data: (allProducts) {
                final favoriteProducts =
                    allProducts
                        .where(
                          (product) => favoriteProductIds.contains(product.id),
                        )
                        .toList();
                return _favourites(context, favoriteProducts);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _accDisplay() {
  return Container(
    width: double.infinity,
    child: EditorsChoice(
      title: "Krishnan E",
      image:
          "https://media-cdn.tripadvisor.com/media/photo-s/15/d2/fe/2d/complesso-nuragico-di.jpg",
      desc: "Flutter Develeper",
      onTap: () => {},
      Height: 50,
      Width: 50,
      borderR: 25,
      fontSize: 18,
    ),
  );
}

Widget _favouritesHeading(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 40,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Favorites",
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
        ),
      ],
    ),
  );
}

Widget _favourites(BuildContext context, List<Product> favoriteProducts) {
  if (favoriteProducts.isEmpty) {
    return const Text("No favorites yet!");
  }
  return SizedBox(
    // or MediaQuery.of(context).size.height * 0.5, etc.
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 0),
      itemCount: favoriteProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final item = favoriteProducts[index];
        return PopularCards(product: item, onTap: () {}, showDetails: false);
      },
    ),
  );
}
