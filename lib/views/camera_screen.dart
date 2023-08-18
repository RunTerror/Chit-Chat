import 'package:camera/camera.dart';
import 'package:chit_chat/utils/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentZoomLevel = 1.0;
  final resolutionpresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPresets = ResolutionPreset.high;
  bool _isCameraInitialized = false;
  CameraController? _controller;
  late FlashMode flashMode;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
    super.didChangeAppLifecycleState(state);
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    late CameraController? previousCameraController = _controller;
    previousCameraController == null
        ? null
        : await previousCameraController.dispose();
    final newCameraController = CameraController(
        cameraDescription, currentResolutionPresets,
        enableAudio: true, imageFormatGroup: ImageFormatGroup.jpeg);

    if (mounted) {
      setState(() {
        _controller = newCameraController;
      });
    }
    newCameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    try {
      await newCameraController.initialize();
    } catch (e) {
      ErrorMessage.showtoast(e as String);
    }
    newCameraController
        .getMaxZoomLevel()
        .then((value) => _maxAvailableZoom = value);

    newCameraController
        .getMinZoomLevel()
        .then((value) => _minAvailableZoom = value);

    flashMode = _controller!.value.flashMode;

    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }

  @override
  void initState() {
    SystemChrome.restoreSystemUIOverlays();
    onNewCameraSelected(cameras[0]);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: _isCameraInitialized
            ? Stack(
                children: [
                  // Camera
                  // AspectRatio(
                  //   aspectRatio: 1 / _controller!.value.aspectRatio,
                  //   child: 
                    _controller!.buildPreview(),
                  // ),
                  // Resolution
                  Positioned(
                    top: 30,
                    right: 10,
                    child: DropdownButton<ResolutionPreset>(
                      dropdownColor: Colors.black45,
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: currentResolutionPresets,
                      items: [
                        for (ResolutionPreset preset in resolutionpresets)
                          DropdownMenuItem(
                            value: preset,
                            child: Text(
                              preset.toString().split('.')[1].toUpperCase(),
                              style: const TextStyle(color: Colors.white60),
                            ),
                          )
                      ],
                      onChanged: (value) {
                        setState(() {
                          currentResolutionPresets = value!;
                          _isCameraInitialized = false;
                        });
                        onNewCameraSelected(_controller!.description);
                      },
                    ),
                  ),
                  // Buttons
                  Positioned(
                    bottom: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (flashMode == FlashMode.torch) {
                                      setState(() {
                                        _controller!
                                            .setFlashMode(FlashMode.off);
                                      });
                                    } else {
                                      _controller!
                                          .setFlashMode(FlashMode.torch);
                                    }
                                  },
                                  icon: Icon(
                                    flashMode == FlashMode.torch
                                        ? Icons.flash_off
                                        : Icons.flash_on,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.circle_outlined,
                                    color: Colors.black,
                                    size: 60,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                        const Text("Hold for video, tap for photo")
                      ],
                    ),
                  ),
                  // Zoom
                  Positioned(
                    left: (w - w / 1.1) / 2,
                    bottom: 10,
                    child: Row(
                      children: [
                        SizedBox(
                          width: w / 1.3,
                          child: Slider(
                            value: _currentZoomLevel,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white30,
                            onChanged: (value) async {
                              setState(() {
                                _currentZoomLevel = value;
                              });
                              await _controller!.setZoomLevel(value);
                            },
                            min: _minAvailableZoom,
                            max: _maxAvailableZoom,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${_currentZoomLevel.toStringAsFixed(1)}x',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container());
  }
}
