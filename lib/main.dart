import 'package:camera/camera.dart';
import 'package:chit_chat/utils/error_widget.dart';
import 'package:chit_chat/utils/route_names.dart';
import 'package:chit_chat/utils/routes.dart';
import 'package:flutter/material.dart';

 List<CameraDescription> cameras=[];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    ErrorMessage.showtoast(e.code);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        listTileTheme:const ListTileThemeData(tileColor: Colors.white),
        primaryColor: const Color(0xff1c70fa),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: RouteNames.landingScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
