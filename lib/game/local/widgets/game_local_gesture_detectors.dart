import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tapit/game/local/dialogs/game_local_new_win_dialog.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';
import 'package:tapit/game/local/utils/game_local_enums.dart';

import '../../../global/utils/global_constants.dart';
import '../../../global/utils/global_functions.dart';
import '../../../global/utils/managers/global_shared_preferences_manager.dart';
import '../../../global/utils/managers/global_sounds_manager.dart';
import '../providers/game_local_player_data_provider.dart';

class GameLocalGestureDetectors extends ConsumerStatefulWidget {

  const GameLocalGestureDetectors({super.key});

  @override
  ConsumerState<GameLocalGestureDetectors> createState() => _GameLocalGestureDetectorsState();
}

class _GameLocalGestureDetectorsState extends ConsumerState<GameLocalGestureDetectors> {

  BannerAd? _bannerAd;

  Future<void> checkAndPlaySound() async {

    final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
    final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;

    if (globalSharedPreferencesManager.getFxSoundsEnabled()) {
      await globalSoundsManager.playGameTapFx();
    }

  }

  @override
  void initState() {

    _initializeNormalAdBanner();

    super.initState();
  }

  // Function to initialize the normal ad banner
  void _initializeNormalAdBanner() {

    final BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: GlobalConstants.localWinDialogAdId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {

          if (!mounted) {
            ad.dispose();
            return;
          }

          _bannerAd = ad as BannerAd;

          debugPrint('Normal ad banner loaded successfully!');
        },
        onAdFailedToLoad: (ad, error) {

          debugPrint('BannerAd failed to load: $error');
          ad.dispose();

          debugPrint("Normal ad banner cannot be loaded, fallbacking to the small one...");
          _initializeSmallAdBanner();

        },
      ),
    );

    bannerAd.load();
  }

  // Function that will fallback to load the small ad banner if the normal one cannot be loaded
  void _initializeSmallAdBanner() {

    final BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: GlobalConstants.localWinDialogAdId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {

          if (!mounted) {
            ad.dispose();
            return;
          }

          _bannerAd = ad as BannerAd;

          debugPrint('Small Banner ad loaded successfully!');
        },
        onAdFailedToLoad: (ad, error) {

          debugPrint('BannerAd failed to load: $error');
          ad.dispose();

        },
      ),
    );

    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {

    final gameStatus = ref.watch(gameLocalGameStatusProvider);

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataProvider);
    final gameLocalPlayerDataNotifier = ref.read(gameLocalPlayerDataProvider.notifier);

    final bool gameStarted = gameStatus["game_started"];

    final Map gameLocalStatusState = ref.watch(gameLocalGameStatusProvider);
    if (gameLocalStatusState["ads_need_to_be_reloaded"]) {

      _initializeNormalAdBanner();

      GlobalFunctions.executeAfterBuild(() {
        ref.read(gameLocalGameStatusProvider.notifier).setAdsNeedToBeReloaded(false);
      });

    }

    return Column(
      children: [

        // Top tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) async {
              debugPrint("Top tap $gameStatus");
              if (gameStarted) {

                await checkAndPlaySound();

                // Score TOP player and store if it has won
                final bool playerWon = gameLocalPlayerDataNotifier.score(GameLocalPlayerEnum.top);

                // If the TOP player has won, show the win dialog
                if (playerWon && context.mounted) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => GameLocalNewWinDialog(
                      gameLocalPlayerEnum: GameLocalPlayerEnum.top,
                      winnerColor: Color(gameLocalPlayerData[0].colorValue),
                      bannerAd: _bannerAd,
                    ),
                  );
                }

              }
            },
          ),
        ),

        // Bottom tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) async {
              debugPrint("Bottom tap $gameStatus");
              if (gameStarted) {

                await checkAndPlaySound();

                // Score BOTTOM player and store if it has won
                final bool playerWon = gameLocalPlayerDataNotifier.score(GameLocalPlayerEnum.bottom);

                // If the BOTTOM player has won, show the win dialog
                if (playerWon && context.mounted) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => GameLocalNewWinDialog(
                      gameLocalPlayerEnum: GameLocalPlayerEnum.bottom,
                      winnerColor: Color(gameLocalPlayerData[1].colorValue),
                      bannerAd: _bannerAd,
                    ),
                  );
                }

              }
            },
          ),
        ),

      ],
    );
  }
}
