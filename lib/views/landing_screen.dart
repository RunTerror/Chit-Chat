import 'package:action_slider/action_slider.dart';
import 'package:chit_chat/components/box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/route_names.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ActionSliderController _controller=ActionSliderController();


  navigate(){
    Navigator.of(context).pushNamed(RouteNames.chitScreen);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Stack(
              children: [
                CustomContainer(borderRadius: 0, color: theme.primaryColor, h: h, w: w),
                Positioned(
                  top: h-h/2.5,
                  child: Container(
                      height: h / 2.5,
                      width: w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))))),
                const SizedBox(height: 24.0),
            Positioned(
              top: h-h/2.5+h/5,
              left: (w-w/1.5)/2,
              child: Container(
                alignment: Alignment.center,
                width: w/1.5,
                child: ActionSlider.standard(
                  controller: _controller,
                  sliderBehavior: SliderBehavior.stretch,
                  width: w/1.5,
                  backgroundColor: theme.primaryColor,
                  toggleColor: Colors.white,
                  icon: const Icon(CupertinoIcons.forward),
                  action: (controller) async {
                    controller.loading(); 
                    await Future.delayed(const Duration(seconds: 2));
                    controller.success(
                    ); 
                    await Future.delayed(const Duration(seconds: 1));
                    navigate();
                    controller.reset();
                  },
                  child: Text('Swipe to start...',
                      style: GoogleFonts.openSans(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w500)),
                ),
              ),
            ),
                
              ],
            ),
          ),
    );
  }
}
