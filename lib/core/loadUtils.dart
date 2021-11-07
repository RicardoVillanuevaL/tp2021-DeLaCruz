  import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadUtils{
late BitmapDescriptor pinIcon;

load()async{
  pinIcon = await BitmapDescriptor.fromAssetImage( ImageConfiguration(devicePixelRatio: 1.0) , 'assets/pin106.png');
}

}

final loadUtils = LoadUtils();