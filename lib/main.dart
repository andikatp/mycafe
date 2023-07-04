import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
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
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.LENGKAPI,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF3C00)),
      ).copyWith(scaffoldBackgroundColor: const Color(0xFFf5f5f5)),
    ),

    // StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshotStream) {
    //     return snapshotStream.connectionState == ConnectionState.waiting
    //         ? const SplashScreen()
    //         : FutureBuilder(
    //             future: Future.delayed(const Duration(seconds: 2)),
    //             builder: (context, snapshot) {
    //               if (snapshot.connectionState == ConnectionState.waiting) {
    //                 return const SplashScreen();
    //               }
    //               String initialRoute = Routes.SIGNIN;
    //               if (snapshotStream.hasData) {
    //                 if (snapshotStream.data!.emailVerified) {
    //                   initialRoute = Routes.HOME;
    //                 } else {
    //                   initialRoute = Routes.VERIFY_EMAIL;
    //                 }
    //               }
    //               return GetMaterialApp(
    //                 title: "Application",
    //                 initialRoute: initialRoute,
    //                 getPages: AppPages.routes,
    //                 debugShowCheckedModeBanner: false,
    //                 theme: ThemeData.from(
    //                   colorScheme: ColorScheme.fromSeed(
    //                       seedColor: const Color(0xFFFF3C00)),
    //                 ).copyWith(
    //                     scaffoldBackgroundColor: const Color(0xFFf5f5f5)),
    //               );
    //             },
    //           );
    //   },
    // ),
  );
}
