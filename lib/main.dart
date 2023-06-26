import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
      builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GetMaterialApp(
              title: "Application",
              initialRoute: Routes.SIGNUP,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.from(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: const Color(0xFFFF3C00)),
              ).copyWith(scaffoldBackgroundColor: const Color(0xFFf5f5f5)),
            ),
    ),
  );
}
