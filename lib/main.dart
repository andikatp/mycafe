import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';
import 'firebase_options.dart';

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
    //   GetMaterialApp(
    //     title: "Application",
    //     initialRoute: Routes.VERIFY_EMAIL,
    //     getPages: AppPages.routes,
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData.from(
    //       colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF3C00)),
    //     ).copyWith(scaffoldBackgroundColor: const Color(0xFFf5f5f5)),
    //   ),
    // );
    StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshotStream) {
        return snapshotStream.connectionState == ConnectionState.waiting
            ? const SplashScreen()
            : FutureBuilder(
                future: Future.delayed(const Duration(seconds: 2)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SplashScreen();
                  }
                  print(snapshotStream.hasData);
                  return GetMaterialApp(
                    title: "Application",
                    initialRoute: snapshotStream.hasData
                        ? snapshotStream.data!.emailVerified
                            ? Routes.HOME
                            : Routes.VERIFY_EMAIL
                        : Routes.SIGNIN,
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
