import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:parity_cube_task/constants/globals.dart';
import 'package:parity_cube_task/data_layer/cached_data.dart';
import 'package:parity_cube_task/data_layer/models/data_model.dart';

class Getdata {
  static Future<DataModel?> getData(int i) async {
    if (datamodels[i % datamodels.length] != null) {
      return datamodels[i % datamodels.length];
    }
    String baseUrl =
        "http://stagingauth.desidime.com/v4/home/discussed?per_page=10&page=${i + 2}&";
    try {
      var headers = {
        "X-Desidime-Client": "08b4260e5585f282d1bd9d085e743fd9"
      
      };

      http.Response response = await http.get(
          Uri.parse(baseUrl +
              "fields=1,created_at,created_at_in_millis,image_medium,comments_count,likes_count,store${names[i]}"),
          headers: headers);

      // http.Request request = http.Request(
      //     'GET',
      //     Uri.parse(baseUrl +
      //         "fields=1,created_at,created_at_in_millis,image_medium,comments_count,store${name}"));

      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      log("http response ${await response.body}");

      DataModel dataModel = DataModel.fromJson(jsonDecode(response.body));
      datamodels[i] = dataModel;
      return dataModel;
      log("datamodel ${dataModel.deals!.length} / ${dataModel.event!.id}");
    } catch (e) {
      log("http err $e");
    }
    return null;
  } // static
}
