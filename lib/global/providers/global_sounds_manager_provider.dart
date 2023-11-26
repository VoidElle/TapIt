import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/global/utils/global_sounds_manager.dart';

final globalSoundsManagerProvider = StateNotifierProvider<GlobalSoundsManagerNotifier, GlobalSoundsManager>(
      (ref) => GlobalSoundsManagerNotifier(),
);

class GlobalSoundsManagerNotifier extends StateNotifier<GlobalSoundsManager> {

  // Initial state of the Provider
  static final GlobalSoundsManager _initialState = GlobalSoundsManager();

  // Constructor of the provider
  GlobalSoundsManagerNotifier(): super(_initialState);

}