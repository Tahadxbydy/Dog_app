import 'dart:io';

import 'package:brunos_kitchen/models/address_model.dart';
import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/requests/edit_user_profile_request.dart';
import 'package:brunos_kitchen/models/requests/forgot_password_request.dart';
import 'package:brunos_kitchen/models/requests/user_register_request.dart';
import 'package:brunos_kitchen/services/auth_api_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/requests/sign_in_request.dart';
import '../models/requests/social_sign_in_request.dart';
import '../models/responses/auth_response.dart';
import '../screens/bottom_navigation_screen.dart';
import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../utils/enums.dart';
import '../utils/shared_pref .dart';

class AuthViewModel with ChangeNotifier {
  String _otpRouteFrom = Screens.registerUser.text;
  String _registerRouteFrom = Screens.login.text;
  bool _securePassword = true;
  final AuthApiServices _authApiServices = AuthApiServices();
  AuthResponse _authResponse = AuthResponse();
  final SharedPref _sharedPref = SharedPref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _countryCode = '+971';
  String? _fcmToken;
  String _operatingSystem = '';
  String _verificationId = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _nameFieldError = '';
  String _emailFieldError = '';
  String _phoneFieldError = '';
  String _passwordFieldError = '';
  String _confirmPasswordFieldError = '';

  bool get getSecurePassword => _securePassword;

  void setSecurePassword (){
    _securePassword = !_securePassword;
    notifyListeners();
  }

  String get getCountryCode => _countryCode;

  void setCountryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  void setAddress(AddressModel value){
    _authResponse.data!.location = value;
    notifyListeners();
  }

  void setPuppy(PuppyModel value){
    _authResponse.data!.pet = value;
    notifyListeners();
  }

  AuthResponse get getAuthResponse => _authResponse;

  void setAuthResponse(AuthResponse value) {
    _authResponse = value;
    _emailController.text = _authResponse.data!.email!;
    _phoneController.text = _authResponse.data!.phoneNumber!;
    _nameController.text = _authResponse.data!.fullName!;
    notifyListeners();
  }

  String get getNameFieldError => _nameFieldError;

  void setNameFieldError(String value) {
    _nameFieldError = value;
    notifyListeners();
  }

  String get getEmailFieldError => _emailFieldError;

  void setEmailFieldError(String value) {
    _emailFieldError = value;
    notifyListeners();
  }

  String get getPhoneFieldError => _phoneFieldError;

  void setPhoneFieldError(String value) {
    _phoneFieldError = value;
    notifyListeners();
  }

  String get getPasswordFieldError => _passwordFieldError;

  void setPasswordFieldError(String value) {
    _passwordFieldError = value;
    notifyListeners();
  }

  String get getConfirmPasswordFieldError => _confirmPasswordFieldError;

  void setConfirmPasswordFieldError(String value) {
    _confirmPasswordFieldError = value;
    notifyListeners();
  }
  String get getRegisterRouteFrom => _registerRouteFrom;

  void setRegisterRouteFrom(String value) {
    _registerRouteFrom = value;
    notifyListeners();
  }

  String get getOtpRouteFrom => _otpRouteFrom;

  void setOtpRouteFrom(String value) {
    _otpRouteFrom = value;
    notifyListeners();
  }

  TextEditingController get getOtpController => _otpController;

  TextEditingController get getNameController => _nameController;

  TextEditingController get getEmailController => _emailController;

  TextEditingController get getPhoneController => _phoneController;

  TextEditingController get getPasswordController => _passwordController;

  TextEditingController get getConfirmPasswordController =>
      _confirmPasswordController;

  bool nameValidation() {
    if (_nameController.text.isEmpty) {
      setNameFieldError('Please Enter Name');
      return false;
    } else {
      setNameFieldError('');
      return true;
    }
  }

  bool emailValidation() {
    if (_emailController.text.isEmpty) {
      setEmailFieldError('Please Enter Email');
      return false;
    }
    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text)){
      setEmailFieldError('Please Enter Valid Email');
      return false;
    }
    else {
      setEmailFieldError('');
      return true;
    }
  }

  bool phoneValidation() {
    if (_phoneController.text.isEmpty) {
      setPhoneFieldError('Please Enter Phone Number');
      return false;
    } else {
      setPhoneFieldError('');
      return true;
    }
  }

  bool passwordValidation() {
    if (_passwordController.text.isEmpty) {
      setPasswordFieldError('Please Enter Password');
      return false;
    }
    else if(_passwordController.text.length != 8){
      setPasswordFieldError('Password length must be of 8 characters');
      return false;
    }
    else {
      setPasswordFieldError('');
      return true;
    }
  }

  bool confirmPasswordValidation() {
    if (_confirmPasswordController.text.isEmpty) {
      setConfirmPasswordFieldError('Password didn\'t matched');
      return false;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      setConfirmPasswordFieldError('Password didn\'t matched');
      return false;
    } else {
      setConfirmPasswordFieldError('');
      return true;
    }
  }

  bool signInValidation() {
    if (emailValidation() && passwordValidation()) {
      return true;
    } else {
      return false;
    }
  }

  bool userRegistrationValidation() {
    if (nameValidation() &&
        emailValidation() &&
        phoneValidation() &&
        passwordValidation() &&
        confirmPasswordValidation()) {
      return true;
    } else {
      return false;
    }
  }

  bool forgotPasswordValidation() {
    if (passwordValidation() && confirmPasswordValidation()) {
      return true;
    } else {
      return false;
    }
  }

  void callLogOut(){
    _sharedPref.remove(SharedPreferencesKeys.authToken.text);
  }

  Future<bool> callSignInApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final SignInRequest signInRequest = SignInRequest(
          password: _passwordController.text,
          email: _emailController.text,
          deviceToken: _fcmToken ?? '',
          deviceType: _operatingSystem);

      final AuthResponse response =
          await _authApiServices.signInApi(signInRequest: signInRequest);
      if (response.isSuccess!) {
        setAuthResponse(response);
        //  setImageSlider();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> editUserProfileApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final EditUserProfileRequest editUserProfileRequest =
          EditUserProfileRequest(
              fullName: _nameController.text,
              phoneNumber: _phoneController.text);

      final AuthResponse response = await _authApiServices.editUserProfileApi(
          editUserProfileRequest: editUserProfileRequest);
      if (response.isSuccess!) {
        setAuthResponse(response);
        //  setImageSlider();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callUserRegisterApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final UserRegisterRequest userRegisterRequest = UserRegisterRequest(
          password: _passwordController.text,
          email: _emailController.text,
          deviceToken: _fcmToken ?? '',
          deviceType: _operatingSystem,
          fullName: _nameController.text,
          phoneNumber: _countryCode + _phoneController.text);

      final AuthResponse response = await _authApiServices.userRegisterApi(
          userRegisterRequest: userRegisterRequest);
      if (response.isSuccess!) {
        setAuthResponse(response);
        //  setImageSlider();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callGuestUserRegisterApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final UserRegisterRequest userRegisterRequest = UserRegisterRequest(
          password: '',
          email: '',
          deviceToken: _fcmToken ?? '',
          deviceType: _operatingSystem,
          fullName: 'Guest',
          phoneNumber: '');

      final AuthResponse response = await _authApiServices.guestUserRegisterApi(
          userRegisterRequest: userRegisterRequest);
      if (response.isSuccess!) {
        setAuthResponse(response);
        //  setImageSlider();
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }


  Future<bool> callForgotPasswordApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final ForgotPasswordRequest forgotPasswordRequest = ForgotPasswordRequest(
          password: _passwordController.text,
          phoneNumber: _phoneController.text,
          otp: '2521');

      final BaseResponseModel response = await _authApiServices
          .forgotPasswordApi(forgotPasswordRequest: forgotPasswordRequest);
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> callSocialMediaLoginApi(
      {required SocialSignInRequest userDetails}) async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final AuthResponse response = await _authApiServices.socialMediaLoginApi(
          socialSignInRequest: userDetails);
      if (response.isSuccess!) {
        setAuthResponse(response);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError('${response.message}');
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> checkPhoneNumber({required bool checkType}) async {
    EasyLoading.show(status: 'Please Wait');

    try {
      final BaseResponseModel response =
          await _authApiServices.checkPhoneNumberApi(
              phoneNumber: _countryCode + _phoneController.text);
      if (response.isSuccess!) {
        if (!checkType) {
          EasyLoading.showError('${response.message}');
        } else {
          EasyLoading.dismiss();
        }
        return true;
      } else {
        if (checkType) {
          EasyLoading.showError('${response.message}');
        } else {
          EasyLoading.dismiss();
        }
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  Future<bool> verifyNumber() async {
    EasyLoading.show(status: 'Sending OTP');
    bool returnValue = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: _countryCode + _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.signInWithCredential(credential);
        EasyLoading.dismiss();
        returnValue = true;
      },
      timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {
        EasyLoading.showToast(e.toString());
        returnValue = false;
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        EasyLoading.dismiss();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return returnValue;
  }

  Future<bool> verifyOTP() async {
    try {
      EasyLoading.show(status: 'Verify OTP');

      final credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: _verificationId, smsCode: _otpController.text));
      EasyLoading.dismiss();

      return credentials.user != null ? true : false;
    } catch (exception) {
      EasyLoading.showToast(exception.toString());
      return false;
    }
  }

  Future<Widget> checkSplash() async {
    //PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //setVersion(packageInfo.version);
    // setBuild(packageInfo.buildNumber);
    _fcmToken = await _firebaseMessaging.getToken();
    print(_fcmToken);
    if (Platform.isAndroid) {
      _operatingSystem = 'Android';
    } else {
      _operatingSystem = 'iOS';
    }
    final authToken =
        await _sharedPref.read(SharedPreferencesKeys.authToken.text);
    await Future.delayed(const Duration(seconds: 4), () {});
    if (authToken == null) {
      return const IntroSlidesScreen();
    } else {
      Widget routeTo = const LoginScreen();
      await callSplash(showLoader: false).then((value) {
        if (value) {
          routeTo = const BottomNavigationScreen();
        } else {
          routeTo = const LoginScreen();
        }
      });
      return routeTo;
    }
  }

  Future<bool> signInWithGoogle() async {
    EasyLoading.show(status: 'Please Wait...');
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userDetails =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userDetails.user != null) {
        // await getUserToken();
        //  final bool loginStatus =
        final SocialSignInRequest socialSignInRequest = SocialSignInRequest(
            clientId: userDetails.user!.uid,
            email: userDetails.user!.email!,
            fullName: userDetails.user!.displayName!,
            phoneNumber: userDetails.user!.phoneNumber ?? '+923340394150',
            deviceType: _operatingSystem,
            deviceToken: _fcmToken ?? '',
            media: userDetails.user!.photoURL!,
            platform: 'Google');

        return await callSocialMediaLoginApi(userDetails: socialSignInRequest);
      } else {
        EasyLoading.showError('Something Went Wrong');
        return false;
      }
    } else {
      EasyLoading.showError('Something Went Wrong');
      return false;
    }
  }

  Future<bool> signInWithFacebook() async {
    EasyLoading.show(status: 'Please Wait...');

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      final userDetails = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      if (userDetails.user != null) {
        //await getUserToken();

        final SocialSignInRequest socialSignInRequest = SocialSignInRequest(
            clientId: userDetails.user!.uid,
            email: userDetails.user!.email!,
            fullName: userDetails.user!.displayName!,
            phoneNumber: userDetails.user!.phoneNumber ?? '+923340394150',
            deviceType: _operatingSystem,
            deviceToken: _fcmToken ?? '',
            media: userDetails.user!.photoURL!,
            platform: 'Facebook');
        return await callSocialMediaLoginApi(userDetails: socialSignInRequest);
      } else {
        EasyLoading.showError('Something Went Wrong');
        return false;
      }
    } else {
      EasyLoading.showError('Something Went Wrong');
      return false;
    }
  }


  void clearFieldsData() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _securePassword = true;
    _confirmPasswordController.clear();
    setNameFieldError('');
    setEmailFieldError('');
    setPhoneFieldError('');
    setPasswordFieldError('');
    setConfirmPasswordFieldError('');
  }

  Future <bool> callSplash({required bool showLoader}) async{
    if(showLoader){
      EasyLoading.show(status: 'Please Wait...');
    }
    try {
      final AuthResponse response = await _authApiServices.splashApi();
      if (response.isSuccess!) {
        setAuthResponse(response);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError(response.message!);
        return false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }
}
