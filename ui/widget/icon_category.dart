import 'package:flutter/material.dart';

class IconCategory extends StatelessWidget {
  const IconCategory({
    required this.title,
    required this.image,
    this.selected = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final String image;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: selected ? Colors.deepPurple : Colors.grey[300]),
            alignment: Alignment.center,
            child: Image.asset(
              image,
              width: 35,
              height: 35,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: selected ? Colors.black : Colors.grey[500]),
          )
        ],
      ),
    );
  }
}
