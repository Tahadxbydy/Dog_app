import 'package:brunos_kitchen/utils/images.dart';

class FoodCategory {
  String? image;
  String? name;

  FoodCategory(this.name, this.image);
}

List<FoodCategory> foodCategoryList = [
  FoodCategory('Freshly cooked', freshlyCooked),
  FoodCategory('Well balanced nutrient blend', wellBalancedNutrientBlend),
  FoodCategory('Doorstep delivery', doorstepDelivery),
  FoodCategory('Long shelf life', longShelfLife),
  FoodCategory('Human grade ingredients', humanGradeIngredients),
  FoodCategory('AAFCO compliant', aafcoCompliant),
  FoodCategory('Customized meals', customizedMeals),
  FoodCategory('Vet Developed', vetDeveloped)
];



