import 'dart:io';

import 'package:brunos_kitchen/main.dart';
import 'package:brunos_kitchen/models/base_response_model.dart';
import 'package:brunos_kitchen/models/puppy_model.dart';
import 'package:brunos_kitchen/models/requests/edit_puppy_request.dart';
import 'package:brunos_kitchen/models/requests/register_puppy_request.dart';
import 'package:brunos_kitchen/models/responses/breeds_response.dart';
import 'package:brunos_kitchen/models/responses/puppies_response.dart';
import 'package:brunos_kitchen/route_generator.dart';
import 'package:brunos_kitchen/services/puppy_api_services.dart';
import 'package:brunos_kitchen/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../utils/food_category_list_data.dart';
import '../screens/logIn_screen.dart';
import '../screens/intro_slides_screen.dart';
import '../services/firebase_upload_image_service.dart';
import '../utils/date_time_formatter.dart';
import '../utils/enums.dart';
import '../utils/image_genrator.dart';
import '../utils/shared_pref .dart';

class PuppyViewModel with ChangeNotifier {
  String _routeToPuppyFrom = Screens.home.text;
  final FirebaseUploadImageService _firebaseUploadImageService =
      FirebaseUploadImageService();
  final PuppyApiServices _puppyApiServices = PuppyApiServices();
  bool _isPuppyEdit = false;
  int _feedingRoutine = 1;
  final ImageGenerator _imageGenerator = ImageGenerator();
  PuppiesResponse _puppiesResponse = PuppiesResponse();
  PuppyModel? _puppyDetail;
  final TextEditingController _puppyNameController = TextEditingController();
  String _puppyImage = '';
  CroppedFile? _imageFile;
  String _puppyGender = Puppy.boy.text;
 // bool _puppyIsSpayNeuter = true;
  final TextEditingController _puppyBreedController = TextEditingController();
  BreedsResponse _breedsResponse = BreedsResponse();
  List<BreedsData> _breedsList = [];
  String _puppyDob = 'MM   /   DD   /   YYYY';
  DateTime? _formatBirthDate;
  final TextEditingController _puppyCurrentWeight = TextEditingController();
   int _puppyActualWeight = PuppyWeight.idealWeight.value;
  String _puppyActivityLevel = Puppy.active.text;
  String _puppyNameFieldError = '';
  String _puppyBreedFieldError = '';
/*  String _puppyDobFieldError = '';*/

   String _currentWeightFieldError = '';
  // String _actualWeightFieldError = '';
/*
  String _puppyImageFieldError = '';
*/

  int get getFeedingRoutine => _feedingRoutine;

  void setFeedingRoutine (int value){
    _feedingRoutine = value;
    notifyListeners();
  }

  bool get getIsPuppyEdit => _isPuppyEdit;

  String get getPuppyImage => _puppyImage;

  void setIsPuppyEdit(bool value) {
    _isPuppyEdit = value;
    notifyListeners();
  }

  PuppyModel? get getPuppyDetail => _puppyDetail;

  void setPuppyDetail(PuppyModel value) {
    _puppyDetail = value;
    _isPuppyEdit = true;
    setSelectedPuppyModel(data: value);
    notifyListeners();
  }

  PuppiesResponse get getPuppiesResponse => _puppiesResponse;

  void setPuppiesResponse(PuppiesResponse value) {
    _puppiesResponse = value;
    notifyListeners();
  }

  TextEditingController get getPuppyCurrentWeight => _puppyCurrentWeight;

  /*void setPuppyCurrentWeight(int value) {
    _puppyCurrentWeight = value;
    notifyListeners();
  }*/

  int get getPuppyActualWeight => _puppyActualWeight;

   void setPuppyActualWeight(int value) {
    _puppyActualWeight = value;
    notifyListeners();
  }

  CroppedFile? get getImageFile => _imageFile;

  void setImageFile(CroppedFile value) {
    _imageFile = value;
    notifyListeners();
  }

  List<BreedsData> get getBreedslist => _breedsList;

  void setBreedsList(List<BreedsData> value) {
    _breedsList = value;
    notifyListeners();
  }

  TextEditingController get getPuppyBreedController => _puppyBreedController;

  String get getPuppyActivityLevel => _puppyActivityLevel;

  void setPuppyActivityLevel(String value) {
    _puppyActivityLevel = value;
    notifyListeners();
  }

  String get getPuppyDob => _puppyDob;

  void setPuppyDob(DateTime value) {
    _formatBirthDate = value;
    _puppyDob = DateTimeFormatter.showDateFormat2(value);
    notifyListeners();
  }

 // String get getPuppyDobFieldError => _puppyDobFieldError;

/*  void setPuppyDobFieldError(String value) {
    _puppyDobFieldError = value;
    notifyListeners();
  }*/

  // String get getActualWeightFieldError => _actualWeightFieldError;

  // void setActualWeightFieldError(String value) {
  //   _actualWeightFieldError = value;
  //   notifyListeners();
  // }

  String get getCurrentWeightFieldError => _currentWeightFieldError;

  void setCurrentWeightFieldError(String value) {
    _currentWeightFieldError = value;
    notifyListeners();
  }

  String get getPuppyBreedFieldError => _puppyBreedFieldError;

  void setPuppyBreedFieldError(String value) {
    _puppyBreedFieldError = value;
    notifyListeners();
  }

  String get getPuppyNameFieldError => _puppyNameFieldError;

  void setPuppyNameFieldError(String value) {
    _puppyNameFieldError = value;
    notifyListeners();
  }

/*
  String get getPuppyImageFieldError => _puppyImageFieldError;
*/

  /* void setPuppyImageFieldError(String value) {
    _puppyImageFieldError = value;
    notifyListeners();
  }*/

  TextEditingController get getPuppyNameController => _puppyNameController;

 // bool get getPuppyIsSpayNeuter => _puppyIsSpayNeuter;

 /* void setPuppyIsSpayNeuter(bool value) {
    _puppyIsSpayNeuter = value;
    notifyListeners();
  }*/

  String get getPuppyGender => _puppyGender;

  void setPuppyGender(String value) {
    _puppyGender = value;
    notifyListeners();
  }

  String get getRouteToPuppyFrom => _routeToPuppyFrom;

  void setRouteToPuppyFrom(String value) {
    _routeToPuppyFrom = value;
    notifyListeners();
  }

  bool puppyBreedValidation() {
    if (_puppyBreedController.text.isEmpty) {
      setPuppyBreedFieldError('Please Enter Pet Breed');
      return false;
    } else {
      setPuppyBreedFieldError('');
      return true;
    }
  }

 /* bool puppyDobValidation() {
    if (_puppyDob.isEmpty) {
      setPuppyDobFieldError('Please Select Pet BirthDay');
      return false;
    } else {
      setPuppyDobFieldError('');
      return true;
    }
  }*/

   bool puppyCurrentWeightValidation() {
    if (_puppyCurrentWeight.text.isEmpty || _puppyCurrentWeight.text == '0') {
      setCurrentWeightFieldError('Please Select Pet Current Weight');
      return false;
    } else {
      setCurrentWeightFieldError('');
      return true;
    }
  }

  /* bool puppyActualWeightValidation() {
    if (_puppyActualWeight == 0) {
      setActualWeightFieldError('Please Select Pet Actual Weight');
      return false;
    } else {
      setActualWeightFieldError('');
      return true;
    }
  }*/

  bool puppyNameValidation() {
    if (_puppyNameController.text.isEmpty) {
      setPuppyNameFieldError('Please Enter Pet Name');
      return false;
    } else {
      setPuppyNameFieldError('');
      return true;
    }
  }

  /* bool puppyImageValidation() {
    if (_imageFile == null) {
      setPuppyImageFieldError('Please Enter Pet Image');
      return false;
    } else {
      setPuppyImageFieldError('');
      return true;
    }
  }*/

  bool puppyCreationValidation() {
    if (puppyNameValidation() /*&& puppyImageValidation()*/) {
      return true;
    } else {
      return false;
    }
  }

  bool puppyAdditionalCreationValidation() {
    if (puppyBreedValidation() /*&&
            puppyDobValidation() */&&
        puppyCurrentWeightValidation() /*&&
        puppyActualWeightValidation()*/
        ) {
      return true;
    } else {
      return false;
    }
  }

  void setSelectedPuppyModel({required PuppyModel data}) {
    _puppyNameController.text = data.name!;
    _puppyImage = data.media!;
    _imageFile = null;
    _puppyGender = data.gender!;
    _feedingRoutine = data.feedingRoutine!;
   // _puppyIsSpayNeuter = data.isSpayNeuter!;
    _puppyBreedController.text = data.breed!;
    _puppyDob = data.bornOnDate! != 0
        ? DateTimeFormatter.timeStampToDate(data.bornOnDate!)
        : 'MM   /   DD   /   YYYY';
    _puppyCurrentWeight.text = data.currentWeight!.toString();
    _puppyActualWeight = data.actualWeight!;
    _puppyActivityLevel = data.activityLevel!;
  }

  void clearPuppyData() {
    _isPuppyEdit = false;
    _puppyNameController.clear();
    _puppyImage = '';
    _imageFile = null;
    _puppyGender = Puppy.boy.text;
  //  _puppyIsSpayNeuter = true;
    _puppyBreedController.clear();
    _breedsList.clear();
    _puppyDob = 'MM   /   DD   /   YYYY';
    _puppyCurrentWeight.clear();
    _feedingRoutine = 1;
    _puppyActualWeight = PuppyWeight.idealWeight.value;
    _puppyActivityLevel = Puppy.active.text;
    _puppyNameFieldError = '';
    _puppyBreedFieldError = '';
  //  _puppyDobFieldError = '';
      _currentWeightFieldError = '';
    /*  _actualWeightFieldError = '';
    _puppyImageFieldError = '';*/
  }

  void searchBreeds(String query) {
    final suggestions = _breedsResponse.data!.where((breed) {
      return breed.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setBreedsList(suggestions);
  }

  Future<void> getAndUpLoadImage({required bool fromCamera}) async {
    setImageFile(await _imageGenerator.createImageFile(fromCamera: fromCamera));
    EasyLoading.show(status: 'Generating Image please wait...');

    // _farmDetail.imageUrl = url;
    // notifyListeners();
    EasyLoading.dismiss();
  }

  Future<bool> callRegisterPuppyApi() async {
    EasyLoading.show(status: 'Please Wait ...');

    int puppyBirthDate = 0;

    if (_formatBirthDate != null) {
      puppyBirthDate = DateTimeFormatter.dateToTimeStamp(_formatBirthDate!);
    }

    if (_imageFile != null) {
      try {
        _puppyImage = await _firebaseUploadImageService.upLoadImageFile(
            mFileImage: _imageFile!, fileName: _puppyNameController.text);
        print(_puppyImage);
      } catch (e) {
        EasyLoading.dismiss();
      }
    }
    try {
      final RegisterPuppyRequest registerPuppyRequest = RegisterPuppyRequest(
          name: _puppyNameController.text,
          media: _puppyImage,
          gender: _puppyGender,
         // isSpayNeuter: _puppyIsSpayNeuter,
          breed: _puppyBreedController.text,
          bornOnDate: puppyBirthDate,
          currentWeight: int.parse(_puppyCurrentWeight.text),
          actualWeight: _puppyActualWeight,
          activityLevel: _puppyActivityLevel, feedingRoutine: _feedingRoutine);
      final BaseResponseModel response = await _puppyApiServices.addPuppyApi(
          registerPuppyRequest: registerPuppyRequest);
      if (response.isSuccess!) {
        //  setImageSlider();
        EasyLoading.dismiss();
        await callPuppiesApi();
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

  Future<bool> callPuppyBreedsApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final BreedsResponse response = await _puppyApiServices.allBreedsApi();
      if (response.isSuccess!) {
        _breedsResponse = response;
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

  Future<bool> callDeletePuppyApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final BaseResponseModel response = await _puppyApiServices.deletePuppyApi(puppyId: _puppyDetail!.sId!);
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        await callPuppiesApi();
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

  Future<bool> callEditPuppyApi() async {
    EasyLoading.show(status: 'Please Wait ...');

    int puppyBirthDate = 0;

    if (_formatBirthDate != null) {
      puppyBirthDate = DateTimeFormatter.dateToTimeStamp(_formatBirthDate!);
    }

    if (_imageFile != null) {
      try {
        _puppyImage = await _firebaseUploadImageService.upLoadImageFile(
            mFileImage: _imageFile!, fileName: _puppyNameController.text);
        print(_puppyImage);
      } catch (e) {
        EasyLoading.dismiss();
      }
    }
    final EditPuppyRequest editPuppyRequest = EditPuppyRequest(
        name: _puppyNameController.text,
        media: _puppyImage,
        gender: _puppyGender,
      //  isSpayNeuter: _puppyIsSpayNeuter,
        breed: _puppyBreedController.text,
        bornOnDate: puppyBirthDate,
        currentWeight: int.parse(_puppyCurrentWeight.text),
        actualWeight: _puppyActualWeight,
        activityLevel: _puppyActivityLevel, feedingRoutine: _feedingRoutine);
    try {
      final BaseResponseModel response = await _puppyApiServices.editPuppyApi(
          editPuppyRequest: editPuppyRequest, puppyId: _puppyDetail!.sId!);
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        await callPuppiesApi();
        if(_puppyDetail != null){
          final PuppyModel updatedPuppy = _puppiesResponse.data!.firstWhere((element) => element.sId == _puppyDetail!.sId );
          setPuppyDetail(updatedPuppy);
        }
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

  Future<bool> callPuppiesApi() async {
    EasyLoading.show(status: 'Please Wait ...');
    try {
      final PuppiesResponse response = await _puppyApiServices.puppiesApi();
      if (response.isSuccess!) {
        setPuppiesResponse(response);
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

  Future<bool> callDefaultPuppyApi() async {
    EasyLoading.show(status: 'Please wait...');
    try {
      final BaseResponseModel response =
          await _puppyApiServices.defaultPuppy(puppyId: _puppyDetail!.sId!);
      if (response.isSuccess!) {
        EasyLoading.dismiss();
        callPuppiesApi();
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

 void setIsDefaultPuppyTrueFalse(bool value) {
    _puppyDetail!.isDefault = value;
    notifyListeners();
  }
}
