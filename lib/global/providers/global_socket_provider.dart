import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/global/models/global_socket_model.dart';
import 'package:tapit/global/utils/global_constants.dart';

import '../../game/online/enums/socket_enums.dart';
import '../../game/online/utils/game_online_constants.dart';

final globalSocketProvider = StateNotifierProvider<GlobalSocketNotifier, GlobalSocketModel>(
      (ref) => GlobalSocketNotifier(),
);

class GlobalSocketNotifier extends StateNotifier<GlobalSocketModel> {

  // Initial state of the Provider
  static final GlobalSocketModel _initialState = GlobalSocketModel();

  // Constructor of the provider
  GlobalSocketNotifier(): super(_initialState);

  // Function to initialize the socket connection
  void init() {

    // Set the status to loading, without notifying the watchers,
    // because it is before the completion of the build method
    _setStatus(GameOnlineSocketStatus.loading, notify: false);

    // Specify the socket
    final socket_io.Socket socket = socket_io.io(GameOnlineConstants.serverUri, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });

    // Start the connection with the socket
    socket.connect();

    // On connection of the socket with the server, set
    // the socket state to Success
    socket.onConnect((_) {
      GlobalConstants.logger.i('SOCKET_INFO: Connection established');
      _setStatus(GameOnlineSocketStatus.success);
    });

    // On disconnect of the socket with the server, set
    // the socket state to Disconnected
    socket.onDisconnect((_) {
      GlobalConstants.logger.i('SOCKET_INFO: Connection Disconnection');
      _setStatus(GameOnlineSocketStatus.error);
    });

    // If an error is occurred, set the status of the socket to Error
    socket.onConnectError((err) async {
      GlobalConstants.logger.e(err);
      _setStatus(GameOnlineSocketStatus.error);
    });

    // If an error is occurred, set the status of the socket to Error
    socket.onError((err) async {
      GlobalConstants.logger.e(err);
      _setStatus(GameOnlineSocketStatus.error);
    });

    // Set the socket in the state to the one created
    state.socket = socket;
  }

  // Function to change the current socket's state variable, the notification
  // of the watchers can also be decided
  void _setStatus(GameOnlineSocketStatus gameOnlineSocketStatus, {bool notify = true}) {

    // Get the current status of the socket
    final GameOnlineSocketStatus currentStatus = state.gameOnlineSocketStatus;

    // Check if the current is different with the one we're changing
    if (currentStatus != gameOnlineSocketStatus) {
      if (notify) {

        // If we need to notify the watchers,
        // we set the classic state replacement syntax
        final GlobalSocketModel newGlobalSocketModel = GlobalSocketModel(
          socket: state.socket,
          gameOnlineSocketStatus: gameOnlineSocketStatus,
        );

        state = newGlobalSocketModel;

      } else {

        // If not, we simply change the status like the state was a normal map
        state.gameOnlineSocketStatus = gameOnlineSocketStatus;

      }
    }
  }

  // Function to check if the socket is initialized
  bool isSocketInitialized() {

    // Get the socket and the status
    final socket_io.Socket? socket = state.socket;
    final GameOnlineSocketStatus gameOnlineSocketStatus = state.gameOnlineSocketStatus;

    return !(socket == null ||
        gameOnlineSocketStatus == GameOnlineSocketStatus.error ||
        gameOnlineSocketStatus == GameOnlineSocketStatus.toInit ||
        gameOnlineSocketStatus == GameOnlineSocketStatus.disconnected);
  }

  @override
  void dispose() {

    // On disposing the provider, dispose the socket
    // ensuring that the connection with the server will be closed
    final socket_io.Socket? socket = state.socket;
    socket?.dispose();

    super.dispose();
  }

}