import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travo_app/test.dart';
import 'package:travo_app/ui/app_router.dart';
import 'package:travo_app/ui/hotel_booking/bloc/count_bloc.dart';
import 'package:travo_app/ui/start_screen/splash_screen.dart';
import 'package:travo_app/theme/theme_color.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountBloc(), lazy: false,),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestScreen());

    //   ColorProvider(
    //   themeColor: ThemeColor(),
    //   child: ScreenUtilInit(
    //     designSize: const Size(360, 690),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (_ , child) {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         title: 'First Method',
    //         theme: ThemeData(
    //           primarySwatch: Colors.blue,
    //         ),
    //         onGenerateRoute: AppRouter.generateRoute,
    //         home: child,
    //       );
    //     },
    //     child: const SplashScreen(),
    //   ),
    // );
  }
}