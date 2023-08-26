import 'package:camera/camera.dart';
import 'package:chit_chat/utils/utils.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/utils/routes.dart';
import 'package:chit_chat/view_model/auth_view_model.dart';
import 'package:chit_chat/view_model/landing_controller.dart';
import 'package:chit_chat/view_model/obscure_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 List<CameraDescription> cameras=[];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    Utils.showtoast(e.code);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> AuthViewModel()),
      ChangeNotifierProvider(create: (context)=> ObscureController()),
      ChangeNotifierProvider(create: (context)=> LandingProvider())
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        listTileTheme:const ListTileThemeData(tileColor: Colors.white),
        primaryColor: const Color(0xff1c70fa),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: RouteNames.landingScreen,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}
