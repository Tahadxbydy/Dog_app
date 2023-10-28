import 'dart:math';

import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/cart_model.dart';
import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/recipe_model.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'enums.dart';

int calculateDailyIntake(
    {required RecipeModel recipeModel,
    required String puppyActivityLevel,
    required num currentWeight}) {
  final int activityLevel = puppyActivityLevel == Puppy.active.text
      ? 110
      : puppyActivityLevel == Puppy.lessActive.text
          ? 95
          : 125;

  final num dailyIntake = (activityLevel *
          pow(currentWeight, 0.75) /
          recipeModel.caloriesContentNo!) *
      1000;

  final int roundDailyIntake = dailyIntake.floor();

  return roundDailyIntake;
}

int calculateFeedingPlan(
    {required RecipeModel recipeModel, required PuppyModel puppyModel, num? gramsForTransitional}) {
  final int dailyIntake = calculateDailyIntake(
      recipeModel: recipeModel,
      puppyActivityLevel: puppyModel.activityLevel!,
      currentWeight: puppyModel.currentWeight!);
  final double perTime = (gramsForTransitional ?? dailyIntake) / puppyModel.feedingRoutine!;
  return perTime.floor();
}

int calculateFinalPricePerDay({required RecipeModel recipeModel}) {
  final PuppyModel puppy = navigatorKey.currentContext!
      .read<AuthViewModel>()
      .getAuthResponse
      .data!
      .pet!;
  final int dailyInTake = calculateDailyIntake(
      recipeModel: recipeModel,
      puppyActivityLevel: puppy.activityLevel!,
      currentWeight: puppy.currentWeight!);
  final num pricePerDay = dailyInTake * recipeModel.pricePerKG! / 1000;
  return pricePerDay.round();
}

num calculateTransitionalGram(
    {required RecipeModel recipeModel,
    required int percentage,
    required int days,
    required bool calculatePrice}) {
  final PuppyModel puppy = navigatorKey.currentContext!
      .read<AuthViewModel>()
      .getAuthResponse
      .data!
      .pet!;
  final int dailyInTake = calculateDailyIntake(
      recipeModel: recipeModel,
      puppyActivityLevel: puppy.activityLevel!,
      currentWeight: puppy.currentWeight!);
  final num gramWithPercent = ((percentage / 100) * dailyInTake) * days;

  return gramWithPercent;
}

num calculateTransitionalPrice(
    {required num gramWithPercent, required int pricePerKG}) {
  final num priceWithPercent = gramWithPercent * pricePerKG / 1000;
  return priceWithPercent.round();
}

num calculatePlanTotal({required List<RecipeModel> listOfItems}) {
  final num finalPriceSum = listOfItems.fold(0, (i, element) {
    return i + element.finalPrice!;
  });
  return finalPriceSum;
}

num calculateCartTotal({required List<CartModel> cartItems}) {
  final num finalPriceSum = cartItems.fold(0, (i, element) {
    return i + element.planTotal;
  });
  return finalPriceSum;
}
