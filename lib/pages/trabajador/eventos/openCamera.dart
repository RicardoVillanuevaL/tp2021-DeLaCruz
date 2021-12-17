import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_2021_app/models/proyectoInfoModel.dart';
import 'package:tp_2021_app/pages/trabajador/eventos/verificarLlegadaPage.dart';

class CameraOpen extends StatefulWidget {
  final ProyectoInfo idEvento;
  final int id;
  const CameraOpen({Key? key, required this.idEvento, required this.id})
      : super(key: key);

  @override
  _CameraOpenState createState() => _CameraOpenState();
}

class _CameraOpenState extends State<CameraOpen> with WidgetsBindingObserver {
  CameraController? _controller;
  Future<void>? _initController;

  var isCameraReady = false;
  XFile? imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCamera();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initController = _controller != null ? _controller!.initialize() : null;
    }
    if (!mounted) return;
    setState(() {
      isCameraReady = true;
    });
  }

  Widget cameraWidget(context) {
    var camera = _controller!.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
        scale: scale, child: Center(child: CameraPreview(_controller!)));
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initController = _controller!.initialize();
    if (!mounted) return;

    setState(() {
      isCameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [cameraWidget(context)],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => capturarFoto(context),
        child: FaIcon(FontAwesomeIcons.camera),
      ),
    );
  }

  capturarFoto(BuildContext context) {
    _controller!.takePicture().then((file) {
      setState(() {
        imageFile = file;
      });
      if (mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => VerificarLlegadaPage(
                    idEvento: widget.idEvento,
                    id: widget.id,
                    image: imageFile!)));
      }
    });
  }
}
