import 'dart:convert';

import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/requests/edit_user_profile_request.dart';
import 'package:brunos_kitchen/models/requests/forgot_password_request.dart';
import 'package:brunos_kitchen/models/requests/social_sign_in_request.dart';
import 'package:brunos_kitchen/models/requests/user_register_request.dart';

import '../models/requests/sign_in_request.dart';
import '../models/responses/auth_response.dart';
import '../utils/enums.dart';
import 'package:http/http.dart' as http;
import '../utils/shared_pref .dart';
import 'api_base_helper.dart';

class AuthApiServices {
  final SharedPref _sharedPref = SharedPref();
  final ApiBaseHelper _httpService = ApiBaseHelper();

  Future<AuthResponse> signInApi({required SignInRequest signInRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.signIn,
        requestType: 'POST',
        requestBody: signInRequest,
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(parsed);
    if (authResponse.isSuccess!) {
      _sharedPref.save(
          SharedPreferencesKeys.authToken.text, authResponse.data!.clientToken);
    }
    return authResponse;
  }
  Future<AuthResponse> userRegisterApi({required UserRegisterRequest userRegisterRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.signUp,
        requestType: 'POST',
        requestBody: userRegisterRequest,
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(parsed);
    if (authResponse.isSuccess!) {
      _sharedPref.save(
          SharedPreferencesKeys.authToken.text, authResponse.data!.clientToken);
    }
    return authResponse;
  }

  Future<AuthResponse> guestUserRegisterApi({required UserRegisterRequest userRegisterRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.guest,
        requestType: 'POST',
        requestBody: userRegisterRequest,
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(parsed);
    if (authResponse.isSuccess!) {
      _sharedPref.save(
          SharedPreferencesKeys.authToken.text, authResponse.data!.clientToken);
    }
    return authResponse;
  }

  Future<BaseResponseModel> forgotPasswordApi({required ForgotPasswordRequest forgotPasswordRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.forgotPassword,
        requestType: 'POST',
        requestBody: forgotPasswordRequest,
        params: '');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<BaseResponseModel> checkPhoneNumberApi({required String phoneNumber}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.checkPhoneNumber,
        requestType: 'GET',
        requestBody: '',
        params: 'phoneNumber=$phoneNumber');
    final parsed = json.decode(response.body);
    BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(parsed);
    return baseResponseModel;
  }

  Future<AuthResponse> socialMediaLoginApi({required SocialSignInRequest socialSignInRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.socialLogin,
        requestType: 'POST',
        requestBody: socialSignInRequest,
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(parsed);
    if (authResponse.isSuccess!) {
      _sharedPref.save(
          SharedPreferencesKeys.authToken.text, authResponse.data!.clientToken);
    }
    return authResponse;
  }

  Future<AuthResponse> splashApi() async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.splash,
        requestType: 'GET',
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(parsed);
    return authResponse;
  }

  Future<AuthResponse> editUserProfileApi({required EditUserProfileRequest editUserProfileRequest}) async {
    final response = await _httpService.httpRequest(
        endPoint: EndPoints.editUserProfile,
        requestType: 'PUT',
        requestBody: editUserProfileRequest,
        params: '');
    final parsed = json.decode(response.body);
    AuthResponse authResponse = AuthResponse.fromJson(parsed);
    return authResponse;
  }


}
