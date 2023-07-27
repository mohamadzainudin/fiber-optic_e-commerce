import 'dart:convert';
import 'package:fiber_ecommerce/data/model/product_model.dart';
import 'package:http/http.dart';

class ProductRepository {
  String productUrl = 'http://103.150.93.77:1343/api/products';

  Future<List<Product>> getProducts() async {
    Response response = await get(Uri.parse(productUrl));
    print(response.body);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }

    // if (response.statusCode == 200) {
    //   final Map<dynamic, dynamic> responseData = jsonDecode(response.body);
    //   if (responseData.containsKey('data') && responseData['data'] is List) {
    //     final List result = responseData['data'];
    //     return result
    //         .map((e) => ProductModel.fromJson(e['attributes']))
    //         .toList();
    //   } else {
    //     throw Exception('Invalid response data format');
    //   }
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
  }
}
