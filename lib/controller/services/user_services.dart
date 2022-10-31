import 'package:tambola_frontend/view/constants/export.dart';
import 'package:http/http.dart' as http;

class UserServices {
  var client = http.Client();

  Future<void> updateUser(dynamic body) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userId = pref.getString("userID");
    String? token = pref.getString('x-auth-token');
    var url = Uri.tryParse(
      '$baseUri/user/$userId',
    );
    Map<String, String> header = {
      'Content-Type': 'application/json;charset=UTF-8',
      "authorization": "Bearer ${token}"
    };
    try {
      var response = await http.put(url!, body: body, headers: header);
      httpErrorHandle(response: response, onSuccess: () {});
    } catch (e) {}
  }
}
