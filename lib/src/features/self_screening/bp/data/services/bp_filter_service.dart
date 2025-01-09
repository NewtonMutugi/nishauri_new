import 'dart:convert';

import 'package:http/http.dart';
import 'package:nishauri/src/features/auth/data/respositories/auth_repository.dart';
import 'package:nishauri/src/features/auth/data/services/AuthApiService.dart';
import 'package:nishauri/src/features/self_screening/bp/data/models/filter_bp.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';
import 'package:nishauri/src/utils/constants.dart';

class BpFilterService extends HTTPService {
  final AuthRepository _repository = AuthRepository(AuthApiService());

  Future<StreamedResponse> fetchBloodPressureFilters_(dynamic args) async {
    final id = await _repository.getUserId();
    final tokenPair = await getCachedToken();
    var headers = {'Authorization': 'Bearer ${tokenPair.accessToken}'};
    var url = '${Constants.BASE_URL_NEW}get_blood_pressure_filter?user_id=$id';
    final response = request(
        url: url,
        token: tokenPair,
        method: 'GET',
        requestHeaders: headers,
        userId: id);
    return response;
  }

  Future<FilterBp> fetchBloodPressureFilters() async {
    try {
      final response = await call(fetchBloodPressureFilters_, null);

      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final Map<String, dynamic> responseData = json.decode(responseString);

        if (responseData.containsKey('data')) {
          final filterData = responseData['data'];
          final FilterBp filterBp = FilterBp.fromJson(filterData);
          return filterBp;
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
