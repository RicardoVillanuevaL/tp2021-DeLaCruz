  import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadUtils{
late BitmapDescriptor pinIcon;

load()async{
  pinIcon = await BitmapDescriptor.fromAssetImage( ImageConfiguration(devicePixelRatio: 1.0,size: Size(10, 12)) , 'assets/pinTp.png');
}

}

final loadUtils = LoadUtils();