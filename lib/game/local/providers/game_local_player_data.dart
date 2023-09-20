import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/models/game_local_player_model.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

final gameLocalPlayerDataNotifierProvider = StateNotifierProvider.autoDispose<GameLocalPlayerDataNotifier, List<GameLocalPlayerModel>>(
    (ref) => GameLocalPlayerDataNotifier(),
);

class GameLocalPlayerDataNotifier extends StateNotifier<List<GameLocalPlayerModel>> {

  GameLocalPlayerDataNotifier() : super([

    // Top player
    GameLocalPlayerModel(
      colorValue: GlobalColorConstants.kRedColor.value,
    ),

    // Bottom player
    GameLocalPlayerModel(
      colorValue: GlobalColorConstants.kBlueColor.value,
    ),

  ]);

}