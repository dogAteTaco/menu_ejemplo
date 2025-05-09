import 'package:example_menu/domain/models/cart_item.dart';
import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/food_text.dart';
import 'package:example_menu/presentations/widgets/quantity_button.dart';
import 'package:example_menu/utils/string_formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BuildCartItem extends StatefulWidget with FoodText {
  final Food food;
  final int quantity;

  BuildCartItem({super.key, required this.food, required this.quantity});

  @override
  State<BuildCartItem> createState() => _BuildCartItemState();
}

class _BuildCartItemState extends State<BuildCartItem> with CustomText {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return InkWell(
      onTap: () {
        context.push('/detail/${widget.food.id}');
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: widget.food.imgPath,
                child: Image(
                  image: AssetImage(widget.food.imgPath),
                  fit: BoxFit.cover,
                  width: 75.0,
                  height: 75.0,
                ),
              ),
              SizedBox(width: 20.0),
              getFoodInformation(),
              SizedBox(width: 20.0),
              _buildQuantitySelector(cartProvider.getCartItemById(widget.food.id)),
              IconButton(
                onPressed: () {
                  cartProvider.removeFromCart(widget.food.id);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(CartItem cartItem) {
    final cartProvider = context.watch<CartProvider>();
    
    return Container(
      width: 125.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        color: const Color(0xFF7A9BEE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildQuantityButton(
            icon: Icons.remove,
            color: const Color(0xFF7A9BEE),
            onTap: (){cartProvider.decreaseQuantitybyId(cartItem.id);},
          ),
          getBodyText(
            text: '${cartItem.quantity}',
            fontSize: 15,
            colorText: Colors.white,
          ),
          buildQuantityButton(
            icon: Icons.add,
            color: Colors.white,
            iconColor: const Color(0xFF7A9BEE),
            onTap: (){cartProvider.addToCart(cartItem.id);},
          ),
        ],
      ),
    );
  }
  Expanded getFoodInformation() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getFoodName(),
          SizedBox(height: 5.0),
          getPrice(),
        ],
      ),
    );
  }

  Widget getFoodName() {
    return widget.getFoodText(widget.food.foodName, fontWeight: FontWeight.bold);
  }

  Widget getPrice() {
    return widget.getFoodText(
      formatAsCurrency(widget.food.price),
      fontSize: 15,
      colorText: Colors.white,
    );
  }
}
