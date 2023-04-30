import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/Customer.dart';
import 'package:masctti_fashion/models/LineItems.dart';
import 'package:masctti_fashion/models/Order.dart';
import 'package:masctti_fashion/models/Product.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import 'package:masctti_fashion/server/api.dart';

import '../models/Category.dart';
import '../models/MetaData.dart' as model;

class LayoutController extends GetxController {
  int indexPage = 0;
  List<Category> categories = [];
  List<Category> parentCategories = [];
  List<Category> subCategroies = [];
  List<Product> products = [];
  List<Product> recentlyProducts = [];
  // isLoad product to home screen display products three type or hidden
  bool isLoad = true;
  bool isloadCate = true;

  List<Product>? categoryProducts = [];
  String titleCategory = '';
  bool isConnectInternet = true;
  Order? order;
  List<LineItems> lineItems = [];
  Customer customer = Customer();
  int totalOrder = 0;
  List<int> ids = [];
  int indexSelectedParentCategory = 0;
  int indexSelectedSubCategory = 0;
  int pageCate = 1;
  bool loadingOtherProduct = false;
  bool finallyProduct = false;
  // final ScrollController scrollControllerProducts = ScrollController();
  @override
  void onInit() async {
    try {
      ids = UserInfo.box.read('favoriteProduct');
    } catch (e) {
      ids = [];
    }
    try {
      print(Get.arguments['message']);
      Get.snackbar('تم الارسال', 'تم ارسال الطلب بنجاح');
    } catch (e) {}

    initProduct();
    initCategory();
    super.onInit();
  }

  void ChangePage(index) {
    indexPage = index;
    update();
  }

  // get parent and childrens category
  void initCategory() async {
    try {
      categories = await Api.getCategories();
      for (Category category in categories) {
        if (category.parent == 0) {
          parentCategories.add(category);
        }
      }
      indexSelectedParentCategory = parentCategories[0].id!;
      update();
      titleCategory = parentCategories[0].name!;
      for (Category category in categories) {
        if (category.parent == parentCategories[0].id)
          subCategroies.add(category);
      }
      categoryProducts = await Api.getCategoryProducts(parentCategories[0].id!);
      isloadCate = false;
      print('final init');
    } catch (e) {
      print('catch category');
      isConnectInternet = false;
    }
    update();
  }
  void reloadProducts() async {
    isloadCate = true;
    isloadCate = true;
    isConnectInternet = true;
    update();
    initProduct();
    initCategory();
  }

  void initProduct() async {
    try {
      products = await Api.getProducts(perPage: 10);
      recentlyProducts.addAll(products);
    } catch (e) {
      isConnectInternet = false;
    }
    isLoad = false;
    update();
  }

  void reloadProductsHome() async {
    isLoad = true;
    isConnectInternet = true;
    update();
    initProduct();
  }

  void showSubCategory(id) async {
    if (indexSelectedParentCategory != id || indexSelectedSubCategory != 0) {
      isloadCate = true;
      indexSelectedParentCategory = id;
      indexSelectedSubCategory = 0;
      update();
      subCategroies = [];
      for (Category category in categories) {
        if (category.parent == id) {
          subCategroies.add(category);
        }
        if (category.id == id) {
          titleCategory = category.name!;
        }
      }
      try {
        categoryProducts = await Api.getCategoryProducts(id);
      } catch (e) {
        isConnectInternet = false;
      }
      finallyProduct = false;
      isloadCate = false;
      update();
    }
  }

  void selectSubCategory(Category category) async {
    titleCategory = category.name!;
    indexSelectedSubCategory = category.id!;
    isloadCate = true;
    update();
    categoryProducts = await Api.getCategoryProducts(category.id!);
    // categoryProducts!.addAll(await Api.getCategoryProducts(category.id!));
    finallyProduct = false;
    isloadCate = false;
    update();
  }

  void addProductOrder(Product product, int quantity, [String? size]) {
    lineItems.add(LineItems(
        quantity: quantity,
        name: product.name,
        price: int.parse(product.price!),
        productId: product.id,
        urlImage: product.images![0].src!,
        total: (int.parse(product.price!) * quantity).toString(),
        metaData: [
          if (size!.isNotEmpty) model.MetaData(key: 'size', value: size)
        ]));

    totalOrder += int.parse(lineItems.last.total!);

    update();
  }

  void plusQuatily(lineItem) {
    int index = lineItems.indexOf(lineItem);
    lineItems[index].quantity = lineItems[index].quantity! + 1;
    totalOrder += lineItems[index].price!;
    update();
  }

  void smiQuatily(lineItem) async {
    int index = lineItems.indexOf(lineItem);
    if (lineItems[index].quantity! > 1) {
      lineItems[index].quantity = lineItems[index].quantity! - 1;
      totalOrder -= lineItems[index].price!;
    } else {
      await Get.defaultDialog(
        actions: [
          OutlinedButton(onPressed: () => Get.back(), child: Text("لا")),
          ElevatedButton(
              onPressed: () {
                lineItems.removeAt(index);
                Get.back();
              },
              child: Text('نعم')),
        ],
        radius: 6,
        titlePadding: EdgeInsets.only(top: 20),
        title: "هل تريد حذف العنصر ؟",
        // content: Text(
        //   "يوجد خطأ في تسجيل الدخول وهو إما البيانات المدخلة غير صحيحة أو لا يوجد اتصال بالانترنت.",
        //   style: TextStyle(color: Color(0xff838894)),
        // ),
      );
    }
    update();
  }

  bool getIsFavorite(productId) {
    if (ids.isEmpty) return false;
    return ids.any((id) => id == productId);
  }

  toggleFavorite(Product pro) {
    pro.featured = !pro.featured!;
    recentlyProducts = recentlyProducts.map<Product>((product) {
      if (pro == product) {
        product.featured = !product.featured!;
      }
      return product;
    }).toList();
    update();
  }

  void scrollEnd(int id) async {
    if (finallyProduct || loadingOtherProduct) return;
    loadingOtherProduct = true;
    update();
    // loadingOtherProduct = false;
    pageCate++;
    List<Product> productCate =
        await Api.getCategoryProducts(id, page: pageCate);
    if (productCate.isEmpty) {
      finallyProduct = true;
    } else {
      categoryProducts!.addAll(productCate);
    }
    loadingOtherProduct = false;
    update();
  }
}
