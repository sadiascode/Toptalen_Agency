import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_talent_agency/common/app_shell.dart';
import 'package:top_talent_agency/core/roles.dart';
import '../../../app/urls.dart';
import '../../../core/services/network/network_client.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var rememberMe = false.obs;
  var isLoading = false.obs;

  late NetworkClient networkClient;

  @override
  void onInit() {
    super.onInit();

    networkClient = NetworkClient(
      onUnAuthorize: () {
        Get.snackbar("Error", "Unauthorized");
      },
      commonHeaders: () => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login(BuildContext context) async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username and password cannot be empty");
      return;
    }

    isLoading.value = true;

    final response = await networkClient.postRequest(
      Urls.login,
      body: {"username": username, "password": password},
    );

    isLoading.value = false;

    if (!response.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.errorMessage ?? "Login failed")),
      );
      return;
    }

    final data = response.responseData;

    if (data == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid server response")),
      );
      return;
    }

    print("===== FULL RESPONSE =====");
    print("Type: ${data.runtimeType}");
    print("Keys: ${data.keys}");
    print("Full Data: $data");

    data.forEach((key, value) {
      print("Key: $key, Value: $value, Type: ${value.runtimeType}");
    });
    print("==========================");

    String? roleStr;

    // Direct role
    if (data['role'] != null) {
      roleStr = data['role'].toString();
      print(" Found role in data['role']: $roleStr");
    }
    // Nested in 'data'
    else if (data['data'] != null && data['data'] is Map) {
      Map dataMap = data['data'] as Map;
      if (dataMap['role'] != null) {
        roleStr = dataMap['role'].toString();
        print("Found role in data['data']['role']: $roleStr");
      }
    }
    // Nested in 'user'
    else if (data['user'] != null && data['user'] is Map) {
      Map userMap = data['user'] as Map;
      if (userMap['role'] != null) {
        roleStr = userMap['role'].toString();
        print("Found role in data['user']['role']: $roleStr");
      }
    }
    // Nested in 'userData'
    else if (data['userData'] != null && data['userData'] is Map) {
      Map userDataMap = data['userData'] as Map;
      if (userDataMap['role'] != null) {
        roleStr = userDataMap['role'].toString();
        print("Found role in data['userData']['role']: $roleStr");
      }
    }

    print("Final roleStr: $roleStr");

    // set role based on response
    if (roleStr == null || roleStr.isEmpty) {
      print("⚠ No role found, defaulting to Admin");
      currentUiUserRole = UiUserRole.admin;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Role not found - defaulting to Creator"),
          backgroundColor: Colors.orange,
        ),
      );
    } else {
      print(" Parsing role: $roleStr");

      switch (roleStr.toLowerCase().trim()) {
        case "admin":
          currentUiUserRole = UiUserRole.admin;
          print("Set role to ADMIN");
          break;
        case "manager":
          currentUiUserRole = UiUserRole.manager;
          print(" Set role to MANAGER");
          break;
        case "creator":
          currentUiUserRole = UiUserRole.creator;
          print(" Set role to CREATOR");
          break;
        default:
          print(" Unknown role: '$roleStr', defaulting to creator");
          currentUiUserRole = UiUserRole.creator;
      }
    }

    print("Final currentUiUserRole: $currentUiUserRole");

    // Navigate to AppShell
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => AppShell(role: currentUiUserRole)),
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}