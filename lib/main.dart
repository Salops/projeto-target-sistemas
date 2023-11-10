import 'package:flutter/material.dart';
import 'package:projeto_target_sistemas/routes/app_routes.dart';
import 'package:projeto_target_sistemas/screens/home_screen.dart';
import 'package:projeto_target_sistemas/screens/login_screen.dart';
import 'package:projeto_target_sistemas/store/notes.store.dart';
import 'package:projeto_target_sistemas/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  runApp(MyApp(preferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp(this.preferences, {super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NotesStore(preferences),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projeto Target Sistemas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.home: (ctx) => const HomeScreen(),
          AppRoutes.login: (ctx) => const LoginScreen(),
        },
      ),
    );
  }
}
