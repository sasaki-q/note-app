import 'package:demo/common_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(pref: ref.watch(memoryProvider)),
);

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier({required this.pref}) : super(false) {
    init();
  }

  static const String lightTheme = "light";
  static const String darkTheme = "dark";

  final SharedPreferences pref;

  String _getCurrentTheme() => pref.getString("theme") ?? lightTheme;

  void init() => state = _getCurrentTheme() == darkTheme;

  void changeTheme() {
    final theme = _getCurrentTheme();
    pref.setString("theme", theme == lightTheme ? darkTheme : lightTheme);
    state = theme == lightTheme;
  }
}
