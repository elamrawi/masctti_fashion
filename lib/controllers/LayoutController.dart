import 'package:get/get.dart';
import 'package:masctti_fashion/models/Customer.dart';
import 'package:masctti_fashion/models/Product.dart';
import 'package:masctti_fashion/server/api.dart';

import '../models/Category.dart';

class LayoutController extends GetxController {
  int indexPage = 0;
  List<Category> categories = [];
  List<Category> parentCategories = [];
  List<Category> subCategroies = [];
  List<Product> products = [];
  // everyday products
  List<Product> dailyProducts = [];
  // More requested products
  List<Product> moreRequesetedProducts = [];
  // Recently added products
  List<Product> recentlyProducts = [];
  // isLoad product to home screen display products three type or hidden
  bool isLoad = true;
  bool isloadCate = true;

  List<Product>? categoryProducts = [];
  String titleCategory = '';
  bool isConnectInternet = true;

  Customer customer = Customer();
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
      for (Category category in categories) {
        if (category.parent == categories[0].id) {
          subCategroies.add(category);
        }
      }
      categoryProducts = await Api.getCategoryProducts(parentCategories[0].id!);
      categoryProducts!
          .addAll(await Api.getCategoryProducts(subCategroies[0].id!));
      isloadCate = false;
    } catch (e) {
      isConnectInternet = false;
    }
  }

  void initProduct() async {
    try {
      products = await Api.getProducts(perPage: 10);
      DateTime now = DateTime.now();
      int totalSales = 0;
      // add list products to dailyProducts
      for (Product product in products) {
        DateTime dateCreatedProduct = DateTime.parse(product.dateCreated!);
        DateTime now = DateTime.now();
        if (dateCreatedProduct.day == now.day &&
            dateCreatedProduct.month == now.month &&
            dateCreatedProduct.year == now.year) {
          dailyProducts.add(product);
        }
        if (product.totalSales! > totalSales) totalSales = product.totalSales!;
      }
      if (dailyProducts.length == 0) {
        dailyProducts.addAll(products);
      }
      moreRequesetedProducts.addAll(products);
      recentlyProducts.addAll(products);
      // add list products to moreRequesetedProducts
      // use parameter total_sales becuase get moreRequestedProducts
      isLoad = false;
    } catch (e) {
      isConnectInternet = false;
    }

    update();
  }

  @override
  void onInit() async {
    // customer = await Api.getCustomer(1);
    initProduct();
    initCategory();
    super.onInit();
  }

  void showSubCategory(id) async {
    isloadCate = true;
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
    categoryProducts = await Api.getCategoryProducts(id);
    isloadCate = false;
    update();
  }

  void selectSubCategory(Category category) async {
    titleCategory = category.name!;
    categoryProducts = await Api.getCategoryProducts(category.parent!);
    categoryProducts!.addAll(await Api.getCategoryProducts(category.id!));
    update();
  }
}
