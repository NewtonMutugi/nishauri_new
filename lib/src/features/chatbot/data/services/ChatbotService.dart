import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nishauri/src/features/chatbot/data/models/feedback_response.dart';
import 'package:nishauri/src/features/chatbot/data/models/message.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';
import 'package:nishauri/src/utils/constants.dart';

class ChatbotService extends HTTPService {
  final String endpoint = "${Constants.BASE_URL}/chat";

  Future<FeedbackResponse> sendMessage(Message message) async {
    var personalInfo = {
      "gender": message.personal_info?.gender,
      "age": message.personal_info?.age,
      "regimen": message.personal_info?.regimen,
      "appointment_datetime":message.personal_info?.appointment_datetime,
      "viral_load": message.personal_info?.viral_load,
      "viral_load_datetime": message.personal_info?.appointment_datetime
    };
    var messages = {
      "consent" : message.consent,
      "personal_info" : personalInfo,
      "question" : message.question,
    };

    final response = await http.post(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(messages),
    );
    if (response.statusCode == 200) {
      return FeedbackResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to send message');
    }
  }

  Future<String> review(Map<String, dynamic> data) async {
    http.StreamedResponse response = await call(review_, data);
    final responseString = await response.stream.bytesToString();
    final jsonData = jsonDecode(responseString);
    if (jsonData["success"] == true) {
      return jsonData["msg"];
    }
    throw jsonData["msg"];
  }

  Future<http.StreamedResponse> review_(Map<String, dynamic> data) async {
    final tokenPair = await getCachedToken();
    final userId = await getUserId();
    var headers = {
      'Authorization': "Bearer ${tokenPair.accessToken}",
      'Content-Type': 'application/json',
    };
    var request =
    http.Request('POST', Uri.parse('${Constants.BASE_URL_NEW}chat_review'));
    request.body = jsonEncode({...data, "user_id": userId});
    request.headers.addAll(headers);
    return await request.send();
  }
}