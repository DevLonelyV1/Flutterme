import 'package:/flutter/material.dart' show BuildContext, ColorScheme, Colors, MaterialApp, StatelessWidget, Theme, ThemeData, Widget, runApp;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'providers/schedule_provider.dart';
import 'services/ai_schedule_service.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ScheduleProvider()),
      ChangeNotifierProvider(create: (_) => AiScheduleService()),
    ],
    child: const ScheduleResolverApp(),

  ),
  );
}
  class ScheduleResolver extends StatelessWidget {

    const ScheduleResolver({super.key});

    @override
    Widget build(BuildContext context) {

      return MaterialApp(
        title: 'Schedule Resolver',
        theme: ThemeData(
          colorScheme:ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        ),
        home: const DashboardScreen(),
      );
    }
  }
