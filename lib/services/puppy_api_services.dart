import 'dart:convert';

import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/add_breed_request.dart';
import 'package:brunos_kitchen/models/requests/edit_puppy_request.dart';
import 'package:brunos_kitchen/models/requests/register_puppy_request.dart';
import 'package:brunos_kitchen/models/responses/breeds_response.dart';

import '../models/responses/puppies_response.dart';
import '../utils/enums.dart';
import 'api_base_helper.dart';

class PuppyApiServices {
  final ApiBaseHelper _httpService = ApiBaseHelper();

 /* Future<BreedsResponse> breedsApi() async {
    ApiBaseHelper httpService = ApiBaseHelper();
    final response = await httpService.httpRequest(
        endPoint: EndPoints.breeds,
        requestType: 'GET',
        requestBody: '',
        params: '');
    final parsed = json.decode(response.body);
    BreedsResponse breedsResponse = BreedsResponse.fromJson(parsed);
    return breedsResponse;
  }*/

  Future<BaseResponseModel> addBreedsApi({required AddBreedRequest addBreedRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.addBreeds,
        requestType: 'POST',
        requestBody: addBreedRequest,
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BaseResponseModel> addPuppyApi({required RegisterPuppyRequest registerPuppyRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.registerPuppy,
        requestType: 'POST',
        requestBody: registerPuppyRequest,
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BreedsResponse> allBreedsApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.breeds,
        requestType: 'GET',
        params: '');
    final parsed = json.decode(response.body);
    BreedsResponse breedsResponse = BreedsResponse.fromJson(parsed);
    return breedsResponse;
  }

  Future<PuppiesResponse> puppiesApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.puppies,
        requestType: 'GET',
        params: '');
    final parsed = json.decode(response.body);
    PuppiesResponse puppiesResponse = PuppiesResponse.fromJson(parsed);
    return puppiesResponse;
  }

  Future<BaseResponseModel> editPuppyApi({required EditPuppyRequest editPuppyRequest, required String puppyId}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.registerPuppy,
        requestType: 'PUT',
        requestBody: editPuppyRequest,
        params: puppyId);
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BaseResponseModel> deletePuppyApi({required String puppyId}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.registerPuppy,
        requestType: 'DEL',
        params: puppyId);
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BaseResponseModel> defaultPuppy({required String puppyId}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.defaultPuppy,
        requestType: 'PUT',
        requestBody: '',
        params: puppyId);
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }


}
