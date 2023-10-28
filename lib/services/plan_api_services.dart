import 'dart:convert';

import 'package:brunos_kitchen/models/responses/recipes_list_response.dart';

import '../utils/enums.dart';
import 'api_base_helper.dart';

class PlanApiServices {
  final ApiBaseHelper _httpService = ApiBaseHelper();

  Future<RecipesListResponse> allRecipes() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.allRecipes, requestType: 'GET', params: '');
    final parsed = json.decode(response.body);
    RecipesListResponse recipesListResponse = RecipesListResponse.fromJson(parsed);
    return recipesListResponse;
  }

}