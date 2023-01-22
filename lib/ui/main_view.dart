import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_quran/blocs/notifiers/notifications_subscription_notifier.dart';
import 'package:great_quran/generated/locale_keys.g.dart';
import 'package:great_quran/ui/drawer/drawer_page.dart';
import 'package:great_quran/resources/assets_manager.dart';
import 'package:great_quran/resources/routes_manager.dart';
import 'package:great_quran/ui/widgets/card_view.dart';
import 'package:great_quran/ui/widgets/custom_app_bar.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  void initState() {
    super.initState();
    ref
        .read(NotificationsSubscriptionNotifier.provider.notifier)
        .navigateOnNotificationLaunch(
          (route) => Navigator.of(context).push(route),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.title_app_bar.tr(),
        ),
        drawer: const DrawerPage(),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  CardViewWidget(
                    LocaleKeys.title_radio.tr(),
                    Routes.radiosRoute,
                    ImageAssets.radio,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  CardViewWidget(
                    LocaleKeys.title_azkar.tr(),
                    Routes.azkarRoute,
                    ImageAssets.azkar,
                  ),
                  CardViewWidget(
                    LocaleKeys.title_azan.tr(),
                    Routes.azanRoute,
                    ImageAssets.azan,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  CardViewWidget(
                    LocaleKeys.title_kible.tr(),
                    Routes.qiblaRoute,
                    ImageAssets.qubla,
                  ),
                  CardViewWidget(
                    LocaleKeys.title_nawawi.tr(),
                    Routes.nawawiRoute,
                    ImageAssets.nawawi,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
