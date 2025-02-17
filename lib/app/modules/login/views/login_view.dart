import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/images/qatar_flag.png', width: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Icon(Icons.wifi, size: 60, color: Colors.purple),
            SizedBox(height: 20),
            Text("Log in or Join us", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: DropdownButton<String>(
                  value: controller.selectedCountryCode.value,
                  items: [DropdownMenuItem(value: '+974', child: Text('+974'))],
                  onChanged: (value) => controller.changeCountryCode(value!),
                ),
                hintText: 'Mobile Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),gapPadding: 5),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade600,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              ),
              onPressed: controller.login,
              child: Text("Continue",style: TextStyle(color: Colors.white),),
            ),
            Spacer(),
            Text("By continuing you agree to our"),
            TextButton(
              onPressed: () {},
              child: Text("Terms & Conditions", style: TextStyle(color: Colors.purple)),
            )
          ],
        ),
      ),
    );
  }
}
