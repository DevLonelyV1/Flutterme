import 'package:flutter/material.dart'; // Fixed the colon/slash typo
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// Note: Ensure these files actually exist in your project folders!
import 'providers/schedule_provider.dart';
import 'services/ai_schedule_service.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleProvider()),
        ChangeNotifierProvider(create: (_) => AiScheduleService()),
      ],
      // Changed this to match the class name below
      child: const ScheduleResolverApp(),
    ),
  );
}

// Renamed to ScheduleResolverApp to match your main() call
class ScheduleResolverApp extends StatelessWidget {
  const ScheduleResolverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Resolver',
      debugShowCheckedModeBanner: false, // Optional: hides the slow-mode banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // Using GoogleFonts properly
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      home: const DashboardScreen(),
    );
  }
}