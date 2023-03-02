import 'package:socket_io_client/socket_io_client.dart';

import '../../../common/Infrastructure/work_context.dart';
import '../../../common/app_config.dart';

Socket socket = io(
    SocketUrl,
    OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
        //.disableAutoConnect() // disable auto-connection
        .setExtraHeaders({'foo': 'bar'}) // optional
        .build())
  ..disconnect()
  ..connect();
void ServerSocketIo() {
  try {
    socket.connect();
// socket e kayıt olunur
    socket.onConnect((_) {
      print('connect');
      socket.emit('register-user', {'token': WorkContext().token});

      print("Socket bağlantısı kuruldu");
    });
  } catch (e) {
    print("Socket bağlantısı kurulamadı ${e.toString()}");
  }
}
