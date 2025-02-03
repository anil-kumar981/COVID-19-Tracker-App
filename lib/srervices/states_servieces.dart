import 'dart:convert';

import 'package:covid_19/models/world_states_model.dart';
import 'package:covid_19/srervices/Utilities/api_url.dart';
import 'package:http/http.dart' as http;

class StatesServieces {
  Future<WorldStatesModel> fetchWorldStateModel() async {
    final respones = await http.get(Uri.parse(ApiUrl.worldUrl));
    if (respones.statusCode == 200) {
      var data = jsonDecode(respones.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}
