import "package:flutter/material.dart";

class PopularSearch extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const PopularSearch({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 109,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          image,
                          width: 84,
                          height: 84,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Background image
          ],
        ),
      ),
    );
  }
}
