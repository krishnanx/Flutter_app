import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/next_button.dart';

class EditorsChoice extends StatelessWidget {
  final String title;
  final String image;

  const EditorsChoice({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 327,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align start of row
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                width: 108,
                height:
                    80, // adjust this to fit nicely within 100 container height
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
