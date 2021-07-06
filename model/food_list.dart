import 'package:faker/faker.dart';

class FoodList {
  final String name;
  final int price;

  FoodList({required this.name, required this.price});
}

Faker faker = Faker();
final random = RandomGenerator(seed: 63833423);

List<FoodList> foodLists = List.generate(
        10,
        (index) =>
            FoodList(name: faker.food.restaurant(), price: random.integer(30)))
    .toList();
