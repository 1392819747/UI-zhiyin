import 'package:flutter/material.dart';
import 'package:tencent_calls_uikit/tencent_calls_uikit.dart';
import 'package:tuicall_kit_example/src/main_widget.dart';
import 'package:tuicall_kit_example/generate/app_localizations.dart';
import 'package:tuicall_kit_example/src/settings/settings_config.dart';

void main() {
  // 设置默认用户ID，直接跳过登录
  SettingsConfig.userId = "test_user_001";
  SettingsConfig.nickname = "测试用户";
  SettingsConfig.avatar = "";
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [TUICallKit.navigatorObserver],
        builder: (context, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: GestureDetector(
                onTap: () {
                  hideKeyboard(context);
                },
                child: child,
              ),
            ),
        home: const MainWidget());
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
