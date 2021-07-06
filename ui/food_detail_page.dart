import 'package:example_tutorial/dribble/Dmitry%20Lauretski/Food%20Delivery%20App/image.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({Key? key, required this.imageAsset}) : super(key: key);
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          3,
                          (index) => Container(
                                height: 12,
                                width: index == 0 ? 35 : 12,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.grey.shade400),
                              )).toList(),
                    ),
                    Icon(Icons.favorite_border_outlined, color: Colors.white)
                  ],
                ),
              ),
              Flexible(
                  flex: 3,
                  child: Container(
                    //color: Colors.blue,
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width * 0.5,
                      height: size.width * 0.5,
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Image.asset(imageAsset, fit: BoxFit.contain)),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Musseles',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      '\$16,00',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.red[200]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    buildContainer(context, '30m', Icons.watch_later_outlined),
                    const SizedBox(width: 8),
                    buildContainer(context, '4.5', Icons.star_border_outlined)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  height: 60,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate consequat velit, ac auctor magna venenatis eu. Nulla vehicula id odio non finibus. Maecenas molestie purus pharetra ullamcorper suscipit. In ac sapien eget mauris imperdiet iaculis eget vel turpis.',
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              )
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              //   child: Container(
              //       height: 60,
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //           color: Colors.deepPurple,
              //           borderRadius: BorderRadius.circular(15)),
              //       child: Text(
              //         'Add to cart',
              //         style: Theme.of(context)
              //             .textTheme
              //             .button!
              //             .copyWith(color: Colors.white),
              //       )),
              // )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context, String text, IconData icon) =>
      Container(
        width: 80,
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: Colors.white),
            Text(text, style: TextStyle(color: Colors.white))
          ],
        ),
      );
}
