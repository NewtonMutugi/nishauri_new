import 'dart:convert';
import 'package:http/http.dart';
import 'package:nishauri/src/features/auth/data/respositories/auth_repository.dart';
import 'package:nishauri/src/features/auth/data/services/AuthApiService.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/filter_data.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/six_months.dart';
import 'package:nishauri/src/features/self_screening/bmi/data/model/week.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';
import 'package:nishauri/src/utils/constants.dart';

class BMIFilterService extends HTTPService{
  final AuthRepository _repository = AuthRepository(AuthApiService());

  Future<StreamedResponse> fetchBMIFilter_(dynamic args) async {
    final id = await _repository.getUserId();
    final tokenPair = await getCachedToken();
    var headers = {'Authorization': 'Bearer ${tokenPair.accessToken}'};
    var url = '${Constants.BASE_URL_NEW}get_bmi_filter?user_id=$id';
    final response = request(
        url: url,
        token: tokenPair,
        method: 'GET',
        requestHeaders: headers,
        userId: id);
    return response;
  }

  Future<FilterData> fetchBMIFilter() async {
    final response = await call(fetchBMIFilter_, null);

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final Map<String, dynamic> responseData = json.decode(responseString);

      if (responseData["success"] == true) {
        final Map<String, dynamic> data = responseData["data"];
        return FilterData.fromJson(data);
      } else {
        throw Exception(responseData["message"]);
      }
    } else {
      throw Exception("Failed to fetch data! Status code: ${response.statusCode}");
    }
  }

}
