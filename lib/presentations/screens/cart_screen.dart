import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:example_menu/presentations/widgets/build_cart_item.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/template_screen.dart';
import 'package:example_menu/utils/string_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with Header, CustomText {
  @override
  Widget build(BuildContext context) {
    final foodList = Foods.foods;
    final cartProvider = context.watch<CartProvider>();

    return TemplateScreen(
      backgroundColor: const Color(0xFF7A9BEE),
      header: getHeader(
        widgetChildText: getHeaderText(text: 'Cart', fontSize: 18.0),
        context: context,
        itemCount: cartProvider.cartCount,
      ),
      isDetailScreen: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.58,
                    child: ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        int foodIndex = foodList.indexWhere(
                          (food) => food.id == cartProvider.cartItems[index].id,
                        );
                        return BuildCartItem(
                          food: foodList[foodIndex],
                          quantity: cartProvider.cartItems[index].quantity,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildTotalPrice(),
        ],
      ),
    );
  }

  Widget _buildTotalPrice() {
    final cartProvider = context.watch<CartProvider>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        height: 60.0,
        child: Center(
          child: Text(
            'Total: ${formatAsCurrency(cartProvider.getCartTotal())}',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
