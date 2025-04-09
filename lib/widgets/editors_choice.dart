import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/next_button.dart';

class EditorsChoice extends StatelessWidget {
  final double Width;
  final double Height;
  final String title;
  final String image;
  final String? desc;
  final double? borderR;
  final double? fontSize;
  final VoidCallback onTap;

  const EditorsChoice({
    super.key,
    required this.title,
    required this.image,
    this.desc,
    this.borderR,
    this.fontSize,
    required this.onTap,
    required this.Width,
    required this.Height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderR ?? 15),
                child: Image.network(
                  image,
                  width: Width,
                  height: Height,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: fontSize ?? 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (desc != null)
                      Text(
                        desc!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              NextButton(), // optional icon, not interactive now
            ],
          ),
        ),
      ),
    );
  }
}
