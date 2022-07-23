import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:covid_info/utilities/apiConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'HelperFunctions.dart';

class ApiManager {
  String baseurl = APIConstants.baseURL;
  String name = "";
  Map<String, dynamic> apiBody = <String, dynamic>{};
  Map<String, String> apiHeader = <String, String>{};
  String? rawBody;

  ApiManager(this.name, this.apiBody, bool addToken, Map<String, String> header1, {this.rawBody}) {
    apiHeader = header1;

    apiHeader[HttpHeaders.contentTypeHeader] = "application/json";
    apiHeader['Device-Token'] = 'xyz';
    apiHeader['Os'] = Platform.isAndroid ? 'android' : 'ios';
    apiHeader['Security'] = 'asdf';
    apiHeader['Resolution'] = 'sd';
    apiHeader['Device-Name'] = Platform.isAndroid ? 'android' : 'iphone';
    //this.apiHeader["Accept"] = "application/json";
  }
  showNoInternetSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("'The connection has timed out, Please try again!'")));
  }

  ///Post
  ///
  Future<Map<String, dynamic>> callPostAPI(BuildContext context) async {
    log('In call of Post');
    log(jsonEncode(apiBody));

    // Internet is available
    String url123 = baseurl + name;
    log(url123);
    try {
      final responseOfAPI = await http
          .post(Uri.parse(url123), body: rawBody != null ? rawBody : jsonEncode(apiBody), headers: apiHeader)
          .timeout(const Duration(seconds: 15), onTimeout: () {
        // Time has run out, do what you wanted to do.
        return showNoInternetSnackBar(context);
      });
      log(responseOfAPI.body);
      Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);
      return fResponse;
    } on FormatException catch (error) {
      log("FormatException: ${error.message}");
      rethrow;
    } on ArgumentError catch (error) {
      log("ArgumentError: " + error.message);
      rethrow;
    } catch (error) {
      log("Exception: $error");
      rethrow;
    }
  }

  ///Get
  ///

  Future<Map<String, dynamic>> callGetAPI(BuildContext context) async {
    log('In call of Get');

    String url123 = baseurl + name;
    log(url123);
    try {
      final responseOfAPI = await http.get(Uri.parse(url123), headers: apiHeader).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return showNoInternetSnackBar(context);
        },
      );

      log(responseOfAPI.body);
      Map<String, dynamic> fResponse = json.decode(responseOfAPI.body);
      return fResponse;
      //this.delegate.apiCallback(fResponse);
    } on FormatException catch (error) {
      log("FormatException: ${error.message}");
      rethrow;
    } on ArgumentError catch (error) {
      log("ArgumentError: " + error.message);
      rethrow;
    } catch (error) {
      log("Exception: $error");
      rethrow;
    }
  }
}
