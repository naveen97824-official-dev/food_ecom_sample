import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ecom_sample/models/menu/product/product.dart';
import 'package:food_ecom_sample/models/user/user.dart' as local;
import 'package:food_ecom_sample/services/product/product_service.dart';
import 'package:food_ecom_sample/store/action/login/login_action.dart';
import 'package:food_ecom_sample/store/state/app_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redux/redux.dart';
class LoginPageViewModel {
  bool isSignIn = true;
  String selectedTab = "signIn";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StreamController loginButtonStreamController = StreamController<bool>();
  List<Product> productList = [];
  local.User userDetail = local.User();
  Store<AppState>? tempStore;

  bool validateLoginButton() {
    // if (emailController.text.isNotEmpty &&
    //     passwordController.text.isNotEmpty &&
    //     emailController.text.length > 3) {
    //   return true;
    // } else {
    //   return false;
    // }

    if (userDetail != null &&
        userDetail.emailId != null &&
        userDetail.password != null) {
      return true;
    } else {
      return false;
    }
  }


  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  getAllProducts() {
    ProductService.shared.getProducts().then((onValue) {
      if (onValue != null) {
        print(onValue);
        productList = onValue;
      } else {
        print("No data found");
      }
    });
  }

  createNewProduct() {
    Product product = Product(
      id: 1,
      title: "title",
      price: 1.0,
      description: "description",
      category: "category",
      image: "image",
    );
    ProductService.shared.createProduct(product).then((onValue) {
      if (onValue != null) {
        print("Created successfully");
      } else {
        print("error in creation");
      }
    });
  }
  updateStore(){
    tempStore!.dispatch(LoginAction(userDetail));
  }
}
