
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

  joinLobbyRequest,
  joinLobbyResponseSuccess,
  joinLobbyResponseFail,

  quitLobbyRequest,
  quitLobbyResponseSuccess,
  quitLobbyResponseFail,

  startLobbyRequest,
  startLobbyResponseSuccess,
  startLobbyResponseFail,

  leaderLeftLobby,
  playerChangeReadyStatus,

  gameScore,
}

// Extension to transform the enum to String using .text
extension GameOnlineSocketEventExtension on GameOnlineSocketEvent {

  String get text {
    switch(this) {

      // Core events
      case GameOnlineSocketEvent.connection:
        return "connection";
      case GameOnlineSocketEvent.disconnect:
        return "disconnect";

      // Create lobby events
      case GameOnlineSocketEvent.createLobbyRequest:
        return "CREATE_LOBBY_REQUEST";
      case GameOnlineSocketEvent.createLobbyResponseSuccess:
        return "CREATE_LOBBY_RESPONSE_SUCCESS";
      case GameOnlineSocketEvent.createLobbyResponseFail:
        return "CREATE_LOBBY_RESPONSE_FAIL";

      // Join lobby events
      case GameOnlineSocketEvent.joinLobbyRequest:
        return "JOIN_LOBBY_REQUEST";
      case GameOnlineSocketEvent.joinLobbyResponseSuccess:
        return "JOIN_LOBBY_RESPONSE_SUCCESS";
      case GameOnlineSocketEvent.joinLobbyResponseFail:
        return "JOIN_LOBBY_RESPONSE_FAIL";

      // Quit lobby events
      case GameOnlineSocketEvent.quitLobbyRequest:
        return "QUIT_LOBBY_REQUEST";
      case GameOnlineSocketEvent.quitLobbyResponseSuccess:
        return "QUIT_LOBBY_RESPONSE_SUCCESS";
      case GameOnlineSocketEvent.quitLobbyResponseFail:
        return "QUIT_LOBBY_RESPONSE_FAIL";

      // Start lobby events
      case GameOnlineSocketEvent.startLobbyRequest:
        return "START_LOBBY_REQUEST";
      case GameOnlineSocketEvent.startLobbyResponseSuccess:
        return "START_LOBBY_RESPONSE_SUCCESS";
      case GameOnlineSocketEvent.startLobbyResponseFail:
        return "START_LOBBY_RESPONSE_FAIL";

      // Lobby utils events
      case GameOnlineSocketEvent.leaderLeftLobby:
        return "LEADER_LEFT_LOBBY";
      case GameOnlineSocketEvent.playerChangeReadyStatus:
        return "PLAYER_CHANGE_READY_STATUS";

      // Game events
      case GameOnlineSocketEvent.gameScore:
        return "GAME_SCORE";
    }
  }

}