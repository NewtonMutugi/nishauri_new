import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nishauri/src/features/auth/data/respositories/auth_repository.dart';
import 'package:nishauri/src/features/auth/data/services/AuthApiService.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_hours.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_six_months.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/bs_week.dart';
import 'package:nishauri/src/features/self_screening/blood_sugar/data/models/filter_bs.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';
import 'package:nishauri/src/utils/constants.dart';

class BsFilterService extends HTTPService {
  final AuthRepository _repository = AuthRepository(AuthApiService());

  Future<StreamedResponse> fetchBloodSugarFilters_(dynamic args) async {
    final id = await _repository.getUserId();
    final tokenPair = await getCachedToken();
    var headers = {'Authorization': 'Bearer ${tokenPair.accessToken}'};
    var url = '${Constants.BASE_URL_NEW}get_blood_sugar_filter?user_id=$id';
    final response = request(
        url: url,
        token: tokenPair,
        method: 'GET',
        requestHeaders: headers,
        userId: id);
    return response;
  }

  Future<FilterBs> fetchBloodSugarFilters() async {
    try {
      final response = await call(fetchBloodSugarFilters_, null);

      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final Map<String, dynamic> responseData = json.decode(responseString);

        if (responseData.containsKey('data')) {
          final filterData = responseData['data'];
          final FilterBs filterBs = FilterBs.fromJson(filterData);
          return filterBs;
        } else {
          throw "Invalid response format";
        }
      } else {
        throw "Something Went Wrong: ${response.statusCode}";
      }
    } catch (e) {
      throw 'Error occurred: $e';
    }
  }
}
