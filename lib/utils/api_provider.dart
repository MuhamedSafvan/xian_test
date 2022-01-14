import 'dart:convert';

import 'package:xian_test/models/user_model.dart';
import 'package:xian_test/models/user_profile.dart';

import 'object_factory.dart';

class ApiProvider {
  Future<UserResponse?> getUsers({int? id, int? page}) async {
    final response = await ObjectFactory().apiClient.getUsers(id: id,page: page);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('${response.data} response.data');
      return userResponseFromJson(json.encode(response.data));
    } else {
      return null;
    }
  }
  Future<UserProfileResponse?> getUserProfile({int? id, int? page}) async {
    final response = await ObjectFactory().apiClient.getUsers(id: id,page: page);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('${response.data} response.data');
      return userProfileResponseFromJson(json.encode(response.data));
    } else {
      return null;
    }
  }

  // Future getItems({int? itemGroupId}) async {
  //   final response =
  //       await ObjectFactory().apiClient.getItems(itemGroupId: itemGroupId);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return (response.data[0]['Data']);
  //   } else {
  //     return null;
  //   }
  // }
}
