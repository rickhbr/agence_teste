import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/images.dart';
import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/modules/product/controllers/product_controller.dart';
import 'package:agence_test/app/widgets/buttons/button_rectangle.dart';
import 'package:agence_test/app/widgets/loadings/loading.dart';
import 'package:agence_test/app/widgets/toast/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProductView extends GetView<ProductController> {
  final String? nomeProduto;
  ProductView({super.key, required this.nomeProduto});

  final ProductController productController = Get.put(ProductController());
  static const LatLng _kMapCenter = LatLng(
    -23.6815315,
    -46.8754851,
  );

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
    tilt: 0,
    bearing: 0,
  );
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Obx(
      () => Loading(
        show: controller.isLoading.value,
        child: Scaffold(
          body: Center(
            child: Container(
              width: width * 0.95,
              height: height,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Container(height: height * 0.33, child: _buildMap()),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Images.productImage,
                        width: width * 0.55,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nomeProduto!,
                              style: TextStyle(
                                color: CustomColors.accentColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "O $nomeProduto é o notebook superpotente da Apple. Muito eficaz para trabalhos com desenvolvimento, principalmente utilizando Flutter.",
                              textAlign: TextAlign.left,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: CustomColors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: Container(
                      width: width * 0.9,
                      child: ButtonRectangle(
                        loading: false,
                        text: "Comprar $nomeProduto",
                        onPress: () {
                          _buildDialog(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      width: width * 0.9,
                      child: ButtonRectangle(
                        loading: false,
                        text: "Escolher outro produto",
                        onPress: () {
                          NavigationService.goBack();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMap() {
    return IgnorePointer(
      ignoring: false,
      child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        onMapCreated: controller.locationUer,
        markers: Set<Marker>.of(controller.markes),
        initialCameraPosition: _kInitialPosition,
        gestureRecognizers: Set()
          ..add(
            Factory<PanGestureRecognizer>(
              () => PanGestureRecognizer(),
            ),
          ),
      ),
    );
  }

  void _buildDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Get.dialog(
      AlertDialog(
        content: SizedBox(
          height: height * 0.05,
          width: width * 0.6,
          child: Column(
            children: [
              Text(
                'Você confirma a compra do $nomeProduto?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Não'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    Toast.showToast(
                      context: context,
                      text:
                          "A compra do $nomeProduto foi realizada com sucesso!",
                      error: false,
                    );
                    Get.back();
                    Get.back();
                  },
                  child: const Text(
                    'Sim',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
