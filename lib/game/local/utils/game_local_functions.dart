import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game_local_game_status_provider.dart';
import '../providers/game_local_player_data_provider.dart';

class GameLocalFunctions {

  static void resetProviders(WidgetRef ref) {
    ref.read(gameLocalPlayerDataNotifierProvider.notifier).reset();
    ref.read(gameLocalGameStatusNotifierProvider.notifier).reset();
  }

}