import 'dart:convert';

import 'ingredient_model.dart';

class RecipeModel {
  String? sId;
  int? createdOnDate;
  String? name;
  bool? isFeatured;
  String? userId;
  List<Ingredient>? ingredient;
  String? description;
  String? details;
  String? instructions;
  List<String>? nutrition;
  int? pricePerKG;
  int? isComboRecipe;
  num? finalPrice;
  List<String>? media;
  List<ItemSizes>? sizes;
  ItemSizes? selectedItemSize;
  String? recipeNo;
  String? lifeStage;
  int? totalDays;
  int? quantity;
  String? category;
  int? caloriesContentNo;

  //Ingredient? ingredients;
  String? ingredientsComposition;

  RecipeModel(
      {this.sId,
        this.createdOnDate,
        this.name,
        this.isFeatured,
        this.userId,
        this.ingredient,
        this.description,
        this.details,
        this.instructions,
        this.nutrition,
        this.pricePerKG,
        this.media,
        this.recipeNo,
        this.lifeStage,
        this.caloriesContentNo,
        this.quantity,
        this.finalPrice,
        this.isComboRecipe,
        this.sizes,
        this.selectedItemSize,
        // this.ingredients,
        this.totalDays,
        this.category,
        this.ingredientsComposition});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdOnDate = json['createdOnDate'];
    name = json['name'];
    isFeatured = json['isFeatured'];
    userId = json['userId'];
    finalPrice = json['finalPrice'] ?? json['pricePerKG'];
    if (json['ingredient'] != null) {
      ingredient = <Ingredient>[];
      json['ingredient'].forEach((v) {
        ingredient!.add(new Ingredient.fromJson(v));
      });
    }
    description = json['description'];
    isComboRecipe = json['isComboRecipe'];
    totalDays = json['totalDays'] ?? 1;
    quantity = json['quantity'] ?? 1;
    details = json['details'];
    instructions = json['instructions'];
    nutrition = json['nutrition'].split(",");
    if (json['sizes'] != null) {
      sizes = <ItemSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(ItemSizes.fromJson(v));
      });
      if(sizes!.isNotEmpty){
        selectedItemSize = sizes![0];
        pricePerKG = sizes![0].price;
      }
      else{
        pricePerKG = json['pricePerKG'];
      }
    }
    else{
      sizes = <ItemSizes>[];
      pricePerKG = json['pricePerKG'];
    }
    media = json['media'].cast<String>();
    category = json['category'];
    recipeNo = json['recipeNo'];
    lifeStage = json['lifeStage'];
    caloriesContentNo = json['caloriesContentNo'];
    //  ingredients = json['ingredients'];
    ingredientsComposition = json['ingredientsComposition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdOnDate'] = this.createdOnDate;
    data['name'] = this.name;
    data['isFeatured'] = this.isFeatured;
    data['isComboRecipe'] = this.isComboRecipe;
    data['userId'] = this.userId;
    data['totalDays'] = this.totalDays ?? 1;
    data['quantity'] = this.quantity ?? 1;
    data['finalPrice'] = this.finalPrice ?? this.pricePerKG;
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient!.map((v) => v.toJson()).toList();
    }
    if (this.nutrition != null) {
      data['nutrition'] = jsonEncode(this.nutrition);
    }
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    data['selectedItemSize'] = this.selectedItemSize;
    data['description'] = this.description;
    data['details'] = this.details;
    data['instructions'] = this.instructions;
    // data['nutrition'] = this.nutrition;
    data['pricePerKG'] = this.pricePerKG;
    data['media'] = this.media;
    data['recipeNo'] = this.recipeNo;
    data['lifeStage'] = this.lifeStage;
    data['category'] = this.category;
    data['caloriesContentNo'] = this.caloriesContentNo;
    //  data['ingredients'] = this.ingredients;
    data['ingredientsComposition'] = this.ingredientsComposition;
    return data;
  }
}

class ItemSizes {
  String? name;
  int? price;

  ItemSizes({this.name, this.price});

  ItemSizes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
