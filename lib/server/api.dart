import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:masctti_fashion/models/Customer.dart';
import 'package:masctti_fashion/models/Review.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
import '../models/Category.dart';
import '../models/Product.dart';
import 'package:http/http.dart' as http;

class Api {
  static final _api = WooCommerceAPI(
    url: 'https://masotti-fashion.com/',
    consumerKey: 'ck_d73fcf02d2529fae157aee1f7c421d166016a908',
    consumerSecret: 'cs_57c29d9a8724d599c4c5dc29c52cd5222cd39f9b',
  );
  static final _apiBasicJson = Dio(BaseOptions(
    baseUrl: 'https://masotti-fashion.com/wp-json/',
    contentType: 'application/json',
  ));
  static final _apiBasic = Dio(BaseOptions(
    baseUrl: 'https://masotti-fashion.com/api/',
    contentType: 'application/json',
  ));
  static Future<Map<String, dynamic>> createCustomer({
    required String email,
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> data = await _api.postAsync('customers', {
      "email": email,
      "password": password,
      "username": username,
      "first_name": username,
    });
    return data;
  }

  // GET
  static Future<List<Product>> getProducts(
      {int perPage = 10, page = 1, offset = 0}) async {
    List data = await _api
        .getAsync("products?per_page=$perPage&page=$page&offset=$offset");
    List<Product> products =
        data.map<Product>((d) => Product.fromJson(d)).toList();
    return products;
  }

  static Future<Product> getProduct(id) async {
    Map<String, dynamic> data = await _api.getAsync('products/$id');
    Product? product = Product.fromJson(data);
    return product;
  }

// Future<List<Review>>
  static  getReviews(id) async {
    // List data = await _api.getAsync("products/reviews");
    // List<Review> reviews = data.map<Review>((d) => Review.fromJson(d)).toList();
    // return reviews;
    Response response =
        await _apiBasicJson.get('wc/v3/products/reviews', queryParameters: {
      'product': id,
      'consumer_key': 'ck_c529bd1c2795f733b61c0a877de228142afe0982',
      'consumer_secret': 'cs_f980917b77887f5ba049a94e8de1a6f8a2d0d32d'
    });
 
    return response.data;
  }

  static getCategories() async {
    List data = await _api.getAsync("products/categories");
    List<Category> categories =
        data.map<Category>((d) => Category.fromJson(d)).toList();
    return categories;
  }

  static Future<List<Product>> getCategoryProducts(int id) async {
    List data = await _api.getAsync('products?category=$id');
    List<Product> products =
        data.map<Product>((d) => Product.fromJson(d)).toList();
    return products;
  }

  static Future<List<Customer>> getCustomers() async {
    List data = await _api.getAsync('customers');
    List<Customer> customers =
        data.map<Customer>((d) => Customer.fromJson(d)).toList();
    return customers;
  }

  static Future<Customer> getCustomer(email) async {
    List data = await _api.getAsync('customers?email=$email');
    Customer customer = Customer.fromJson(data[0]);
    return customer;
  }

  static Future<Map<String, dynamic>> login(email, password) async {
    try {
      Response data = await _apiBasicJson.post('jwt-auth/v1/token',
          data: {'username': email, 'password': password});
      return {
        'data': data.data,
        'state': true,
      };
    } catch (e) {
      return {'state': false, 'message': e};
    }
  }

  // ارسال الكود للايميل المدخل
  static sendCode(email) async {
    Response data = await _apiBasicJson.post(
      'bdpwr/v1/reset-password',
      data: {'email': email},
    );
    return data;
  }

  // التأكد من صحة الكود
  static validateCode({
    required String email,
    required String code,
  }) async {
    Response data = await _apiBasicJson
        .post('bdpwr/v1/validate-code', data: {'email': email, 'code': code});
    return data;
  }

  static Future updateCustomer(id,
      {required String email, phone, city, country}) async {
    Map data = await _api.postAsync('customers/$id', {
      'email': email,
      'billing': {
        'city': city,
        'country': country,
        'phone': phone,
      },
      'shipping': {
        'city': city,
        'country': country,
        'phone': phone,
      },
    });
    return data;
  }

  static Future<Map> changePassword(int id,
      {required String password, required String newPassword}) async {
    Response data = await _apiBasic.post('change_password.php',
        queryParameters: {
          'user_id': id,
          'password': password,
          'new_password': newPassword
        });
    return json.decode(data.data);
  }
}

// get product dio
// var api = Dio(BaseOptions(
//   baseUrl: 'https://masotti-fashion.com/wp-json/wc/v3/',
//   contentType: 'application/json',
//   queryParameters: {
//     'consumer_key': 'ck_c529bd1c2795f733b61c0a877de228142afe0982',
//     'consumer_secret': 'cs_f980917b77887f5ba049a94e8de1a6f8a2d0d32d'
//   },
// ));
