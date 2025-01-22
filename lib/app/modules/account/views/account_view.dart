import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: _buildAccount(),
      backgroundColor: Colors.white,
    );
  }
  Widget _buildAccount(){
    return SingleChildScrollView(
      child: Column(
        children: [
          // Login Section
          ListTile(
            leading: Icon(Icons.person, color: Colors.black),
            title: Text("Login", style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              // Add action here
            },
          ),
          Divider(),

          // Language & Country Section
          _buildSectionTitle("Language & Country"),
          _buildListTile(
            icon: Icons.notifications,
            title: "Notifications",
          ),
          _buildListTile(
            icon: Icons.language,
            title: "Language",
            trailingText: "English",
          ),
          _buildListTile(
            icon: Icons.flag,
            title: "Change Country",
            trailingText: "Qatar",
          ),

          // Company Section
          _buildSectionTitle("Company"),
          _buildListTile(
            icon: Icons.contact_mail,
            title: "Contact Us",
          ),
          _buildListTile(
            icon: Icons.person_add,
            title: "Invite Friend",
          ),
          _buildListTile(
            icon: Icons.info,
            title: "About Rafeeq",
          ),
          _buildListTile(
            icon: Icons.description,
            title: "Terms & Conditions",
          ),

          SizedBox(height: 20), // Space before version info
          Text(
            "version : 1.0",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 16),
        ],
      ),
    );

  }

  // Helper Method to Create Section Titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // Helper Method to Create List Tiles
  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? trailingText,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          trailing: trailingText != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                trailingText,
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          )
              : Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: () {
            // Add action here
          },
        ),
        Divider(height: 0), // Add divider below each tile
      ],
    );
  }
}
