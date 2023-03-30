import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  var markes = [
    const Marker(
      markerId: MarkerId('1'),
    ),
  ].obs;
  void locationUer(GoogleMapController cntlr) async {
    late GoogleMapController googleController;
    Location location = Location();

    googleController = cntlr;
    location.onLocationChanged.listen((l) {
      googleController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(l.latitude ?? 0.0, l.longitude ?? 0.0),
            zoom: 15,
          ),
        ),
      );
    });
  }
}
