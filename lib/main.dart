import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/opportunities/providers/opportunity_provider.dart';
import 'features/startup/providers/startup_provider.dart';
import 'features/applications/providers/application_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OpportunityProvider()),
        ChangeNotifierProvider(create: (_) => StartupProvider()),
        ChangeNotifierProvider(create: (_) => ApplicationProvider()),
      ],
      child: MaterialApp.router(
        title: 'ALU VentureLink',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
