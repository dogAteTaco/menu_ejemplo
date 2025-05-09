import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/domain/models/info_card.dart';

class Foods {
  static const String _basePath = 'assets/images/plates';
  static final List<Food> foods = [
    Food(
      id: 1,
      imgPath: '$_basePath/plate1.png',
      foodName: 'Salmon bowl',
      price: 24.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '300', 'G'),
        InfoCard(carType.CALORIES, '367', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, B6', 'VIT'),
        InfoCard(carType.AVAIL, 'NO', 'AV'),
      ],
    ),
    Food(
      id: 2,
      imgPath: '$_basePath/plate2.png',
      foodName: 'Spring bowl',
      price: 22.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '250', 'G'),
        InfoCard(carType.CALORIES, '300', 'CAL'),
        InfoCard(carType.VITAMINS, 'C, D', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 3,
      imgPath: '$_basePath/plate6.png',
      foodName: 'Avocado bowl',
      price: 26.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '250', 'G'),
        InfoCard(carType.CALORIES, '300', 'CAL'),
        InfoCard(carType.VITAMINS, 'C, D', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 4,
      imgPath: '$_basePath/plate5.png',
      foodName: 'Berry bowl',
      price: 24.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '300', 'G'),
        InfoCard(carType.CALORIES, '367', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, B6', 'VIT'),
        InfoCard(carType.AVAIL, 'NO', 'AV'),
      ],
    ),
    Food(
      id: 5,
      imgPath: '$_basePath/plate7.png',
      foodName: 'Quinoa Salad',
      price: 22.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '200', 'G'),
        InfoCard(carType.CALORIES, '250', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, C', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 6,
      imgPath: '$_basePath/plate8.png',
      foodName: 'Grilled Salmon',
      price: 35.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '180', 'G'),
        InfoCard(carType.CALORIES, '320', 'CAL'),
        InfoCard(carType.VITAMINS, 'D, B12', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 7,
      imgPath: '$_basePath/plate9.png',
      foodName: 'Chicken Wrap',
      price: 20.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '220', 'G'),
        InfoCard(carType.CALORIES, '290', 'CAL'),
        InfoCard(carType.VITAMINS, 'B6, C', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 8,
      imgPath: '$_basePath/plate10.png',
      foodName: 'Lentil Soup',
      price: 18.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '300', 'G'),
        InfoCard(carType.CALORIES, '210', 'CAL'),
        InfoCard(carType.VITAMINS, 'B1, B9', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 9,
      imgPath: '$_basePath/plate11.png',
      foodName: 'Kale Smoothie',
      price: 15.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '400', 'ML'),
        InfoCard(carType.CALORIES, '180', 'CAL'),
        InfoCard(carType.VITAMINS, 'K, C', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 10,
      imgPath: '$_basePath/plate12.png',
      foodName: 'Tofu Stir-fry',
      price: 23.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '250', 'G'),
        InfoCard(carType.CALORIES, '270', 'CAL'),
        InfoCard(carType.VITAMINS, 'B1, C', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 11,
      imgPath: '$_basePath/plate13.png',
      foodName: 'Greek Yogurt Bowl',
      price: 19.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '200', 'G'),
        InfoCard(carType.CALORIES, '190', 'CAL'),
        InfoCard(carType.VITAMINS, 'B12, D', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 12,
      imgPath: '$_basePath/plate4.png',
      foodName: 'Grilled Chicken Teriyaki',
      price: 21.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '180', 'G'),
        InfoCard(carType.CALORIES, '260', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, B2', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
    Food(
      id: 15,
      imgPath: '$_basePath/plate3.png',
      foodName: 'Grilled Chicken',
      price: 25.00,
      infoCards: [
        InfoCard(carType.WEIGHT, '300', 'G'),
        InfoCard(carType.CALORIES, '280', 'CAL'),
        InfoCard(carType.VITAMINS, 'A, C', 'VIT'),
        InfoCard(carType.AVAIL, 'YES', 'AV'),
      ],
    ),
  ];
}
