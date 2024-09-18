import 'package:dio/dio.dart';
import 'package:food_ecom_sample/models/menu/product/product.dart';

class ProductService {
  final dio = Dio();
  static ProductService shared = ProductService();

  Future<List<Product>?> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {
      return (List<Product>.from(
          (response.data as List).map((x) => Product.fromJson(x))));
    } else {
      return null;
    }
  }
}
