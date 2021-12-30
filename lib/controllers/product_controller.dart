import 'package:get/state_manager.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/services/product_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductoInfo>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}