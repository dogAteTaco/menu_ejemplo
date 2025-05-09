import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with Header, CustomText{
  
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    
    return TemplateScreen(
      backgroundColor: const Color(0xFF7A9BEE),
      header: getHeader(
        widgetChildText: getHeaderText(text: 'Cart', fontSize: 18.0),
        context: context,
        itemCount: cartProvider.cartCount,
      ),
      isDetailScreen: true,
      body: Placeholder(),
    );
  }

}