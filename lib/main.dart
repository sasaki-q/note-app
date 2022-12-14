import 'package:demo/presentation/auth/ui/screens/auth_screen.dart';
import 'package:demo/presentation/category/ui/category_screen.dart';
import 'package:demo/firebase_options.dart';
import 'package:demo/common_provider.dart';
import 'package:demo/utils/theme/theme.dart';
import 'package:demo/utils/theme/theme_provider.dart';
import 'package:demo/widgets/future_option_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [memoryProvider.overrideWithValue(sharedPreferences)],
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  static final Future<dynamic> _firebaseInitialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);

    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const FutureOptionWidget(
              children: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const FutureOptionWidget(
            children: Text('An connection error occured'),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(isDarkTheme: isDarkTheme, context: context),
          home: const AuthScreen(),
          routes: {
            CategoryScreen.path: (ctx) => const CategoryScreen(),
          },
        );
      },
    );
  }
}
