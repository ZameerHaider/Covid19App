import 'dart:convert';
import 'dart:developer';

import 'package:covid_info/models/CovidInfoObject.dart';
import 'package:covid_info/utilities/apiConstants.dart';
import 'package:flutter/material.dart';

import '../utilities/apiManager.dart';

class CovidInfoProvider with ChangeNotifier {
  bool isLoading = false;
  CovidInfoObject? covidInfoObject;

  callFetchHomeAPI(
    BuildContext context,
  ) {
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> body = <String, dynamic>{};

    Map<String, String> header = <String, String>{};

    FocusScope.of(context).requestFocus(FocusNode());
    ApiManager networkCal = ApiManager(APIConstants.summary, body, true, header);

    networkCal.callGetAPI(context).then((response) {
      isLoading = false;
      notifyListeners();
      log("API call finished");
      // if (response.isEmpty) {
      covidInfoObject = CovidInfoObject.fromMap(response);
      notifyListeners();
      // }
    });
  }
}
