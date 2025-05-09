import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin Header {
  AppBar getHeader({
    Widget? widgetChildText,
    BuildContext? context,
    required int itemCount,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: widgetChildText,
      leading:
          (context != null && Navigator.canPop(context))
              ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  context.pop();
                },
              )
              : SizedBox.shrink(),

      actions: [
        IconButton(
          color: Colors.white,
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_basket, size: 24.0),
              SizedBox(width: 4.0),
              Text(
                itemCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onPressed: () {
            context != null
                ? context.push('/cart')
                : Navigator.of(context!).pushNamed('/cart');
          },
        ),
      ],
    );
  }
}
