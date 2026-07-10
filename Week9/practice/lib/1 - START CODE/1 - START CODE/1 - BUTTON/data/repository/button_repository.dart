import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../dto/button_dto.dart';
import '../../model/button_status.dart';

import 'repository_exception.dart';

class ButtonRepository {
  static ButtonRepository instance = ButtonRepository();

  Future<ButtonStatus> getButtonStatus() async {
    Uri url = Uri.parse(
      'https://week9-eacdb-default-rtdb.asia-southeast1.firebasedatabase.app/button/button01.json',
    );

    try {
      Response response = await http.get(url);

      if (response.statusCode != 200) {
        throw RepositoryException(
          'Failed to fetch Button (HTTP ${response.statusCode})',
        );
      }

      if (response.body == "null") {
        throw RepositoryException('Cannot Find the Button');
      }

      Map<String, dynamic> json = convert.jsonDecode(response.body);

      ButtonStatus user = ButtonDto.fromJson(json);

      return user;
    } on SocketException {
      throw RepositoryException('NO INTERNET CONNECTION');
    } catch (e) {
      throw RepositoryException('Unexpected error: $e'); //catch general exception
    }
  }

  Future<void> updateSelectedStatus(bool newStatus) async {
    Uri url = Uri.parse(
      'https://week9-eacdb-default-rtdb.asia-southeast1.firebasedatabase.app/button/button01.json',
    );
    Response response = await http.patch(
      url,
      body: json.encode({'selected': newStatus}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update');
    }
  }


}

  

