import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  //required BuildContext context,
  required VoidCallback onSuccess,
  VoidCallback? onError,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      if (onError != null) onError();
      debugPrint(jsonDecode(response.body));
      break;
    case 403:
      debugPrint(jsonDecode(response.body));
      if (onError != null) onError();
      break;
    case 404:
      debugPrint(jsonDecode(response.body));
      if (onError != null) onError();
      break;
    case 500:
      debugPrint(jsonDecode(response.body));
      if (onError != null) onError();
      break;
    default:
      debugPrint(jsonDecode(response.body));
  }
}
