import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/user_auth_data/aera_code_model.dart';
import '../../../domain/domain.dart';

class UserAddressAuthController extends GetxController {

  RxList<AreaCodeModel> areaCodeDataModel = <AreaCodeModel>[].obs;

  TextEditingController pinController = TextEditingController();
  TextEditingController distController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  List<String> cityList = <String>[];


  RxBool loadPin = false.obs;

  areaCode() async{
    loadPin.value = true;
    List<AreaCodeModel> areaCodeModel =  [];

    try {
      Map<String, String> header = {
        "Content-Type": 'application/json'
      };

      http.Response response = await http.get(
          Uri.parse("${Domains.pin}${pinController.text}"),
          headers: header
      );
      areaCodeModel = areaCodeModelFromJson(response.body);

      if(response.statusCode == 200){
        areaCodeDataModel.value = areaCodeModel;

        cityList.clear();
        int length = areaCodeModel[0].postOffice!.length;
        for(int i = 0; i < length; i++) {
          cityList.add(areaCodeModel[0].postOffice![i].name!);
        }

        distController.text = areaCodeModel[0].postOffice![0].district.toString();
        stateController.text = areaCodeModel[0].postOffice![0].state.toString();
        countryController.text = areaCodeModel[0].postOffice![0].country.toString();

        debugPrint("Pin-code Api Fetched Data");
        loadPin.value = false;
      }

    } catch(e) {
      loadPin.value = false;
      Get.snackbar("Pin Code","Please enter valid pin code");
    }

  }
}