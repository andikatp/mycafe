import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/utils/splash_screen.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const SplashScreen()
            : FutureBuilder(
                future: Future.delayed(const Duration(seconds: 2)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SplashScreen();
                  }
                  return GetMaterialApp(
                    title: "Application",
                    initialRoute:
                        snapshot.hasData ? Routes.HOME : Routes.SIGNIN,
                    getPages: AppPages.routes,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData.from(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xFFFF3C00)),
                    ).copyWith(
                        scaffoldBackgroundColor: const Color(0xFFf5f5f5)),
                  );
                },
              );
      },
    ),
  );
}
