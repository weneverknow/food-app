import 'package:example_tutorial/dribble/Dmitry%20Lauretski/Food%20Delivery%20App/model/food_list.dart';
import 'package:example_tutorial/dribble/Dmitry%20Lauretski/Food%20Delivery%20App/ui/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widget/icon_category.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({Key? key}) : super(key: key);

  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int itemCart = 0;

  Tween<Offset> _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
  List<Widget> _iconCategory = [];
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      addCategoryIcon();
    });
    super.initState();
  }

  final imageUrl = [
    'assets/images/food-icon-png.png',
    'assets/images/burger.png',
    'assets/images/dish.png',
    'assets/images/sushi.png'
  ];
  final titleIcon = ['All', 'Burgers', 'Dishes', 'Sushi'];

  void addCategoryIcon() {
    // _iconCategory = [
    //   IconCategory(
    //     image: 'assets/images/food-icon-png.png',
    //     title: 'All',
    //     selected: true,
    //   ),
    //   IconCategory(
    //     image: 'assets/images/burger.png',
    //     title: 'Burgers',
    //   ),
    //   IconCategory(
    //     image: 'assets/images/dish.png',
    //     title: 'Dishes',
    //   ),
    //   IconCategory(
    //     image: 'assets/images/sushi.png',
    //     title: 'Sushi',
    //   )
    // ];

    Future ft = Future(() {});
    List.generate(imageUrl.length, (index) {
      ft = ft.then((value) {
        return Future.delayed(Duration(milliseconds: 500), () {
          _iconCategory.add(
            IconCategory(
                title: titleIcon[index],
                image: imageUrl[index],
                selected: (index == 0 ? true : false)),
          );
          _listKey.currentState!.insertItem(_iconCategory.length - 1);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/clerk.png'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.black54),
                        hintText: 'search',
                        hintStyle: TextStyle(color: Colors.black54)),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: 90,
                //color: Colors.red[100],
                padding: EdgeInsets.symmetric(horizontal: 20),
                //alignment: Alignment.center,
                child: Center(
                  child: AnimatedList(
                      //shrinkWrap: true,
                      key: _listKey,
                      scrollDirection: Axis.horizontal,
                      initialItemCount: _iconCategory.length,
                      itemBuilder: (context, index, animation) {
                        return SlideTransition(
                          position: animation.drive(_offset),
                          child: _iconCategory[index],
                        );
                      }),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconCategory(
              //         image: 'assets/images/food-icon-png.png',
              //         title: 'All',
              //         selected: true,
              //       ),
              //       IconCategory(
              //         image: 'assets/images/burger.png',
              //         title: 'Burgers',
              //       ),
              //       IconCategory(
              //         image: 'assets/images/dish.png',
              //         title: 'Dishes',
              //       ),
              //       IconCategory(
              //         image: 'assets/images/sushi.png',
              //         title: 'Sushi',
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Popular',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.5),
                      physics: BouncingScrollPhysics(),
                      //childAspectRatio: 0.6,
                      itemCount: foodLists.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            //width: size.width * 0.3,
                            height: 250,

                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodDetailPage(
                                                  imageAsset: index.isEven
                                                      ? 'assets/images/salad.png'
                                                      : 'assets/images/pizza.png',
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 50),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //mainAxisAlignment:
                                      //  MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Image.asset(
                                            index.isEven
                                                ? 'assets/images/salad.png'
                                                : 'assets/images/pizza.png',
                                            width: 110,
                                            height: 110,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          child: Text(
                                            (foodLists[index].name.trim())
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$ ',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.red[300]),
                                            ),
                                            Text('${foodLists[index].price},00',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        color: Colors.red[300]))
                                          ],
                                        ),
                                        //const SizedBox(height: 30),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        itemCart += 1;
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.deepPurple),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                ),
              )
            ],
          ),
          //bottom nav bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.black12, offset: Offset(0, -1))
              ]),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.deepPurple,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.pin_drop_outlined,
                        color: Colors.grey[400],
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.grey[400],
                        size: 30,
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: itemCart > 0 ? 5 : 0,
                        vertical: itemCart > 0 ? 3 : 0),
                    decoration: BoxDecoration(
                        color: itemCart > 0
                            ? Colors.yellow[700]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: itemCart > 0
                                  ? Colors.white
                                  : Colors.grey[400],
                              size: 30,
                            )),
                        itemCart > 0
                            ? Text(
                                '$itemCart',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
