import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameOnlineNamesParserProvider = StateNotifierProvider<GameOnlineNamesParserNotifier, Map<String, dynamic>>(
      (ref) => GameOnlineNamesParserNotifier(),
);

class GameOnlineNamesParserNotifier extends StateNotifier<Map<String, dynamic>> {

  GameOnlineNamesParserNotifier() : super({});

  void addName(String socketId, String socketName) {
    state = {
      ...state,
      socketId: socketName,
    };
  }

}