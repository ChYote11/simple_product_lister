import 'package:dio/dio.dart';
import 'package:simple_product_lister/constants/api.dart';
import 'package:simple_product_lister/model/product.dart';

class ProductService {
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts() async {
    final String path = api;
    final response = await dio.get(path);
    final List data = response.data['products'];

    return data.map((product) {
      return Product(
        product_id: product['id'],
        title: product['title'],
        description: product['description'],
        price: product['price'],
        thumbnail: product['thumbnail'],
      );
    }).toList();
  }
}
