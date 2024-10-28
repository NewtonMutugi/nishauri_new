import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:nishauri/src/features/auth/data/respositories/auth_repository.dart';
import 'package:nishauri/src/features/auth/data/services/AuthApiService.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_advice.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/blood_pressure.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/bp_advice.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';

class BsAdviceService extends HTTPService {
  final AuthRepository _repository = AuthRepository(AuthApiService());

  // Future<StreamedResponse> fetchBloodPressuresAdvice_(dynamic args) async {
  //   final id = await _repository.getUserId();
  //   final tokenPair = await getCachedToken();
  //   var headers = {'Authorization': 'Bearer ${tokenPair.accessToken}'};
  //   var url = '${Constants.BASE_URL_NEW}get_blood_pressure?user_id=$id';
  //   final response = request(
  //       url: url,
  //       token: tokenPair,
  //       method: 'GET',
  //       requestHeaders: headers,
  //       userId: id);
  //   return response;
  // }

  Future<List<BsAdvice>> fetchBloodSugarAdvice() async {
    List<BsAdvice> bs = [];
    final String responseString = await rootBundle.loadString('assets/data/blood_sugar_advice.json');
    final Map<String, dynamic> responseData = json.decode(responseString);
    final List<dynamic> jsonList = responseData["status"];
    bs.addAll(jsonList.map((json) => BsAdvice.fromJson(json)));
    return bs;
  }
}