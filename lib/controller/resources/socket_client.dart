import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tambola_frontend/view/constants/strings.dart';

// const socketUri = "http://192.168.43.244:5000";
class SocketClient {
  late IO.Socket socket;
  static SocketClient? _socketInstance;
  SocketClient._internal() {
    log("OBJECT SOCKET CLIENT CLASS");
    socket = IO.io(baseSocketUri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }
  static SocketClient get instance {
    _socketInstance ??= SocketClient._internal();
    return _socketInstance!;
  }
}
