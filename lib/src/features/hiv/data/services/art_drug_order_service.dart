import 'dart:convert';

import 'package:http/http.dart';
import 'package:nishauri/src/features/auth/data/respositories/auth_repository.dart';
import 'package:nishauri/src/features/auth/data/services/AuthApiService.dart';
import 'package:nishauri/src/features/hiv/data/models/address/address.dart';
import 'package:nishauri/src/features/hiv/data/models/appointment/art_appointment.dart';
import 'package:nishauri/src/features/hiv/data/models/art_orders/art_drug_order.dart';
import 'package:nishauri/src/features/hiv/data/models/event/art_event.dart';
import 'package:nishauri/src/features/orders/data/models/courier/courier.dart';
import 'package:nishauri/src/features/orders/data/models/delivery_person/delivery_person.dart';
import 'package:nishauri/src/shared/interfaces/HTTPService.dart';
import 'package:nishauri/src/utils/constants.dart';

class ARTDrugOrderService extends HTTPService {
  final AuthRepository _repository = AuthRepository(AuthApiService());

  Future<StreamedResponse> getOrders_(dynamic args) async {
    final id = await _repository.getUserId();
    final tokenPair = await getCachedToken();
    var headers = {'Authorization': 'Bearer ${tokenPair.accessToken}'};
    var request = Request(
      'GET',
      Uri.parse('${Constants.BASE_URL_NEW}drug_delivery_list?user_id=$id'),
    );
    request.headers.addAll(headers);
    return await request.send();
  }
  Future<List<ARTDrugOrder>> getOrders() async {
    // try{
    //
    // } catch (e){
    //   throw "No Request orders found";
    // }
    final response = await call(getOrders_, null);
    final responseString = await response.stream.bytesToString();
    final Map<String, dynamic> responseData = json.decode(responseString);

    if (responseData.containsKey("programs")) {
      final List<dynamic> programsData = responseData["programs"];
      final List<ARTDrugOrder> programs = programsData.map((json) {
        return ARTDrugOrder(
          appointment: ARTAppointment(
            ccc_no: json["ccc_no"],
            appointment_date: json["appointment_date"],
          ),
          deliveryAddress: Address(
            address: json["delivery_address"],
          ),
          delivery_method: json['delivery_method'],
          deliveryPerson: DeliveryPerson(
            fullName: json["delivery_person"],
            nationalId: json["delivery_person_id"],
            phoneNumber: json["delivery_person_contact"],
            pickupTime: json["delivery_pickup_time"],
          ),
          client_phone_no: json['client_phone_no'],
          order_type: json['order_type'],
          status: json['status'],
          approved_date: json['approved_date'],
          dispatched_date: json['dispatched_date'],
          fullfilled_date: json['fullfilled_date'],
          date_order_posted: json['date_order_posted'],
          order_id: json['order_id'],
          courierService: Courier(
            name: json['courier_service'],
          ),
        );
      }).toList();
      return programs;
    } else {
      throw "Failed to retrieve programs from server";
    }
  }


  // Future<List<ARTDrugOrder>> getOrders() async {
  //   final response = await call(getOrders_, null);
  //   final responseString = await response.stream.bytesToString();
  //   final Map<String, dynamic> programData = json.decode(responseString);
  //   final programs = (programData["programs"] as List<dynamic>)
  //       .map((e) => ARTDrugOrder.fromJson(e))
  //       .toList();
  //   print(programs.toString());
  //   return programs;
  // }

  Future<StreamedResponse> createOrder_(Map<String, dynamic> data) async {
    final id = await _repository.getUserId();
    final tokenPair = await getCachedToken();
    final userId = {'user_id': id};
    var mergedData = {...data, ...userId};
    var headers = {
      'Authorization': 'Bearer ${tokenPair.accessToken}',
      'Content-Type': 'application/json',
    };
    var request = Request(
      'POST',
      Uri.parse('${Constants.BASE_URL_NEW}/create_order'),
    );
    request.body = json.encode(mergedData);
    request.headers.addAll(headers);
    print(request.body);
    return await request.send();
  }

  // Future<ARTDrugOrder> createOrder(Map<String, dynamic> data) async {
  //   final response = await call<Map<String, dynamic>>(createOrder_, data);
  //   final responseString = await response.stream.bytesToString();
  //   final Map<String, dynamic> orderData = json.decode(responseString);
  //   return ARTDrugOrder.fromJson(orderData);
  // }

  Future<String> createOrder(Map<String, dynamic> data) async {
    try {
      final response = await call<Map<String, dynamic>>(createOrder_, data);
      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final Map<String, dynamic> orderData = json.decode(responseString);
        if (orderData["success"] == true){
          return orderData["msg"];
        } else {
          throw orderData["msg"];
        }
      } else {
        throw "Something Went Wrong Try Again Later";
      }
    } catch (e) {
      throw "Something Went Wrong Try Again Later";
    }
    // return ARTDrugOrder.fromJson(orderData);
  }
}
