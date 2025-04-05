import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter_task/widgets/feature_cards.dart";
import "package:flutter_task/widgets/category_select.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

import "package:flutter_task/providers/product_providers.dart";
import "package:flutter_task/widgets/popular_cards.dart";

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredProducts = ref.watch(featuredProductsProvider);
    final PopularProducts = ref.watch(popularProductProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Increase height if needed

        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Sun.svg',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Good Morning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ), // Bold text),
                        ],
                      ),
                    ),
                    Text(
                      "Krishnan E",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Buy.svg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 16.0,
            right: 16.0,
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Featured",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),

                    child: SizedBox(
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
                                  ),
                                );
                              },
                            ),

                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error:
                            (err, stack) => Center(child: Text("Error: $err")),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF70B9BE),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(children: [CategorySelect()]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "Popular Products",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF70B9BE),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),

                      child: SizedBox(
                        height: 300,
                        child: PopularProducts.when(
                          data:
                              (products) => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: PopularCards(
                                      title: products[index].title,
                                      image: products[index].image,
                                      price: products[index].price,
                                    ),
                                  );
                                },
                              ),

                          loading:
                              () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          error:
                              (err, stack) =>
                                  Center(child: Text("Error: $err")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
