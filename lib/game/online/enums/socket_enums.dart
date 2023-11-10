
// Enum for managing the state of the Socket
enum GameOnlineSocketStatus {
  toInit,
  loading,
  success,
  error,
  disconnected
}

// Enum for managing the events with the server
enum GameOnlineSocketEvent {
  connection,
  disconnect,

  createLobbyRequest,
  createLobbyResponseSuccess,
  createLobbyResponseFail,
}

// Extension to transform the enum to String using .text
extension GameOnlineSocketEventExtension on GameOnlineSocketEvent {

  String get text {
    switch(this) {
      case GameOnlineSocketEvent.connection:
        return "connection";
      case GameOnlineSocketEvent.disconnect:
        return "disconnect";


      case GameOnlineSocketEvent.createLobbyRequest:
        return "CREATE_LOBBY_REQUEST";
      case GameOnlineSocketEvent.createLobbyResponseSuccess:
        return "CREATE_LOBBY_RESPONSE_SUCCESS";
      case GameOnlineSocketEvent.createLobbyResponseFail:
        return "CREATE_LOBBY_RESPONSE_FAIL";
    }
  }

}