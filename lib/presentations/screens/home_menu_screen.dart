import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/provider/cart_provider.dart';
import 'package:example_menu/presentations/widgets/botton_search.dart';
import 'package:example_menu/presentations/widgets/build_food_item.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen>
    with CustomText, Header {
  bool isSearchActive = false;
  late List<Food> searchResults;
  late List<Food> foodList;

  @override
  void initState() {
    super.initState();
    foodList = Foods.foods;
    searchResults = foodList;
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return TemplateScreen(
      backgroundColor: Color(0xFF21BFBD),
      header: getHeader(context: context, itemCount: cartProvider.cartCount),
      headerWidgetText: Row(
        children: [
          getHeaderText(text: 'Healthy', fontWeight: FontWeight.bold),
          SizedBox(width: 5),
          getHeaderText(text: 'Food'),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            primary: false,
            padding: EdgeInsets.only(left: 25.0, right: 20.0),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.58,
                  child: ListView.builder(
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return BuildFoodItem(food: foodList[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
          if (isSearchActive)
            _searchWidget(
              searchResults,
              _closeSearch,
              _searchController,
              _onSearchChanged,
            ),
        ],
      ),
      floatingActionButton: BottonSearch(onPressed: _toggleSearch),
    );
  }

  // Widget que contiene el campo de busqueda y la lista de resultados
  Stack _searchWidget(
    List<Food> searchResults,
    VoidCallback onClose,
    TextEditingController controller,
    Function(String) onChanged,
  ) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onClose,
          child: Container(color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSearchField(controller, onChanged),
                  _buildSearchListItems(searchResults),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Campo de busqueda
  Padding _buildSearchField(
    TextEditingController controller,
    Function(String) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search food...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  // Lista de resultados de busqueda
  SizedBox _buildSearchListItems(List<Food> searchResults) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        children:
            searchResults
                .map(
                  (item) => ListTile(
                    title: Text(item.foodName),
                    onTap: () {
                      _resetSearch();
                      context.push('/detail/${item.id}');
                    },
                  ),
                )
                .toList(),
      ),
    );
  }

  final TextEditingController _searchController = TextEditingController();

  // Reinicia la busqueda
  void _resetSearch() {
    setState(() {
      searchResults = foodList;
      isSearchActive = false;
      _searchController.clear();
    });
  }

  // Cambia el estado de busqueda
  // y filtra la lista de resultados
  void _onSearchChanged(String query) {
    setState(() {
      searchResults =
          foodList
              .where(
                (f) => f.foodName.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  // Cierra el widget de busqueda
  void _closeSearch() {
    _resetSearch();
  }

  // Cambia el estado de busqueda
  void _toggleSearch() {
    setState(() {
      isSearchActive = !isSearchActive;
    });
  }
}
