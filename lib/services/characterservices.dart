import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:the_marvel_comics/helper/config.dart';
import 'package:the_marvel_comics/model/charactermodel.dart';

Future characterservices(String limit, String offset,
    {String? nameStartsWith}) async {
  var ts = DateTime.now().millisecondsSinceEpoch.toString();
  var hash = md5
      .convert(utf8.encode(ts + privatekey + apikey))
      .toString()
      .toLowerCase();
  var requestUrlPath = '/v1/public/characters';
  final Map<String, String> queryParameters = <String, String>{
    if (nameStartsWith!.isNotEmpty) 'nameStartsWith': nameStartsWith,
    'limit': limit,
    'offset': nameStartsWith.isNotEmpty ? '0' : offset,
    'apikey': apikey,
    'ts': ts,
    'hash': hash,
  };
  var url = Uri.https(baseurl, requestUrlPath, queryParameters);
  var response = await http
      .get(url, headers: {'Content-Type': 'application/x-www-form-urlencoded'});
  if (response.statusCode == 200) {
    final result = json.decode(response.body)['data'];
    List results = result['results'];
    List<CharactersModel> lsData =
        (results).map((x) => CharactersModel.fromJson(x)).toList();
    if (lsData.isEmpty) {
      throw 'Not found !';
    }
    return lsData;
  } else {
    return 'Request failed with status: ${response.statusCode}.';
  }
}
