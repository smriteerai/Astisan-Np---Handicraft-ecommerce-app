import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/theme/my_theme.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Securely load Firebase options. For demonstration, we're calling a mock function.
  // In your production app, ensure this data is securely fetched/stored.
  FirebaseOptions firebaseOptions = await loadFirebaseOptions();

  await Firebase.initializeApp(options: firebaseOptions);
  await MySharedPref.init();

  runApp(const MyApp());
}

Future<FirebaseOptions> loadFirebaseOptions() async {
  // Load your Firebase options securely here
  // This is a placeholder for demonstration purposes
  return const FirebaseOptions(
    apiKey: 'AIzaSyDki3utNnzDssuQkvGOwnsUzIU98nkEKb0',
    appId: '1:287308310511:android:6075fd29dbbd1e50e4b81a',
    messagingSenderId: '287308310511',
    projectId: 'artisan-np',
    storageBucket: 'artisan-np.appspot.com',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Ensure themes and routing are handled inside the builder method
        bool themeIsLight = MySharedPref.getThemeIsLight();

        return GetMaterialApp(
          title: "Artisan NP",
          debugShowCheckedModeBanner: false,
          theme: MyTheme.getThemeData(isLight: themeIsLight),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
