import 'package:agence_test/app/data/models/user_model.dart';
import 'package:agence_test/app/modules/signin/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SigninController signinController = Get.find();
  final pageController = ScrollController();
  RxBool isLoading = false.obs;
  RxBool isLoadingList = true.obs;
  RxBool isAddLoading = false.obs;
  Rx<UserAgence> user = UserAgence().obs;
  RxList<String> products = <String>[].obs;
  RxInt currentMax = 10.obs;
  RxBool hasMore = true.obs;

  void onReady() {
    fetchList(0);
    super.onReady();
  }

  void onInit() {
    fetchList(0);
    getUser();
    pageController.addListener(infiniteScrolling);
    super.onInit();
  }

  Future<void> updateList() async {
    products.clear();
    await fetchList(0);
  }

  infiniteScrolling() {
    if (pageController.position.pixels ==
        pageController.position.maxScrollExtent) {
      getMoreList();
    }
  }

  Future<void> logout() async {
    await signinController.logout();
  }

  Future<void> getUser() async {
    user.value = signinController.userAgence.value;
  }

  Future<void> getMoreList() async {
    try {
      isLoading(true);
      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        if (!hasMore.value) return; // Não carrega mais se `hasMore` for `false`

        List<String> newProducts = [];
        print("Gerando mais elementos");
        for (int i = currentMax.value; i < currentMax.value + 10; i++) {
          newProducts.add('Macbook ${i + 1}');
        }
        currentMax.value = currentMax.value + 10;
        products.addAll(newProducts);

        if (products.length >= 100) {
          // Define `hasMore` como `false` após atingir o limite
          hasMore.value = false;
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<List<String>> getMoreProducts() async {
    final newProducts = <String>[];

    for (int i = currentMax.value; i < currentMax.value + 10; i++) {
      newProducts.add('Macbook ${i + 1}');
    }

    currentMax.value += newProducts.length;

    return newProducts;
  }

  Future<void> fetchList(int start) async {
    try {
      isLoadingList(true);
      products.clear();
      products.value = List.generate(10, (index) => 'Macbook ${index + 1}');
    } finally {
      isLoadingList(false);
    }
  }
}
