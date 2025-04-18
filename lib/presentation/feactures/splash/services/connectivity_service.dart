import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef ConnectivityChangeCallback = void Function(bool isConnected);

class ConnectivityService {
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  // Verificar la conexión actual
  Future<bool> checkConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  // Escuchar cambios en la conexión
  void listenToConnectivityChanges(
    ConnectivityChangeCallback onConnectionChange,
  ) {
    _connectionSubscription?.cancel();

    _connectionSubscription = InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        final isConnected = status == InternetConnectionStatus.connected;
        onConnectionChange(isConnected);
      },
    );
  }

  // Liberar recursos
  void dispose() {
    _connectionSubscription?.cancel();
  }
}
