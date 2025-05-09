import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:example_menu/presentations/widgets/food_text.dart';
import 'package:example_menu/utils/string_formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BuildFoodItem extends StatelessWidget with FoodText {
  final Food food;

  const BuildFoodItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return InkWell(
      onTap: () {
        print('el click de la imagen de comida ${food.id}');
        context.push('/detail/${food.id}');
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: food.imgPath,
                child: Image(
                  image: AssetImage(food.imgPath),
                  fit: BoxFit.cover,
                  width: 75.0,
                  height: 75.0,
                ),
              ),
              SizedBox(width: 20.0),
              getFoodInformation(),
              IconButton(onPressed: () {
                cartProvider.addToCart(food.id, 1);
              }, icon: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }

  Expanded getFoodInformation() {
    return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFoodName(),
                      SizedBox(height: 5.0),
                      getPrice(),
                    ],
                  ),
                ],
              ),
            );
  }

  Widget getFoodName() {
    return getFoodText(food.foodName, fontWeight: FontWeight.bold);
  }

  Widget getPrice() {
    return getFoodText(formatAsCurrency(food.price), fontSize: 15, colorText: Colors.grey);
  }
}
