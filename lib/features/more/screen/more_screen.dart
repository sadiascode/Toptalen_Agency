import 'package:flutter/material.dart';
import 'package:top_talent_agency/common/custom_button.dart';
import 'package:top_talent_agency/core/roles.dart';
import 'package:top_talent_agency/features/more/screen/add_screen.dart';
import 'package:top_talent_agency/features/more/screen/edit_screen.dart';
import 'package:top_talent_agency/features/more/widget/custom_more.dart';

import '../../../common/custom_color.dart';

class MoreScreen extends StatelessWidget {
  final UiUserRole role;
  const MoreScreen({super.key, required this.role});
  bool get isAdmin => role == UiUserRole.admin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Container(
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.primaryGradient,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:  Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
                    child: Row(
                      children: [
                        // img
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Name and Email
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Admin User',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'admin@company.com',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xff155DFC),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Super Admin',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditScreen(role: UiUserRole.admin,),
                        ),
                      );
                        },
                      child:Container(
                          padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                           ),
                          child: Text('Edit', style:
                          TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                            ),
                          ),
                        ),
                       ),
                      ],
                    ),
                  ),
                ),
                  const SizedBox(height: 24),
                  CustomMore(
                    sectionIcon: Icons.notifications_outlined,
                    sectionTitle: 'Notifications',
                    items: [
                      SettingItemData(
                        title: 'Push Notifications',
                        subtitle: 'Real-time alerts and updates',
                        badge: 'On',
                        onTap: () {},
                      ),
                      SettingItemData(
                        title: 'Email Preferences',
                        subtitle: 'Daily digest and reports',
                        badge: 'On',
                        onTap: () {},
                      ),
                      SettingItemData(
                        title: 'Alert Thresholds',
                        subtitle: 'Configure alert sensitivity',
                        onTap: () {},
                      ),
                    ],
                  ),
                  if (isAdmin) ...[
                  SizedBox(height: 20),
                  CustomMore(
                    sectionIcon: Icons.admin_panel_settings_outlined,
                    sectionTitle: 'Role management',
                    items: [
                      SettingItemData(
                        title:  'Manage Managers',
                        subtitle: 'Add or delete managers',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AddScreen(role: UiUserRole.admin,),
                            ),
                          );
                        },
                      ),
                      SettingItemData(
                        title: 'Super admin',
                        subtitle: 'Permissions: view, edit',
                        onTap: () {},
                      ),
                      SettingItemData(
                        title: 'Manager',
                        subtitle: 'Permissions: view',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
                 if (isAdmin) ...[
                  SizedBox(height: 20),
                  CustomMore(
                    sectionIcon: Icons.link,
                    sectionTitle: 'Integrations',
                    items: [
                      SettingItemData(
                        title:  'API Keys',
                        subtitle: 'Manage API credentials',
                        badge: 'Active',
                        onTap: () {},
                      ),
                      SettingItemData(
                        title:  'TikTok Connection',
                        subtitle:  'Backstage integration status',
                        badge:  'Connected',
                        onTap: () {},
                      ),
                      SettingItemData(
                        title: 'Webhooks',
                        subtitle:  'Configure external endpoints',
                        onTap: () {},
                      ),
                    ],
                  ),
                  ],
                  SizedBox(height: 30),
                  CustomButton(text: "Sign Out", onTap: (){
                    showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.grey[900],
                        title: Text(
                          "Confirm Sign Out",
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Text(
                          "Are you sure you want to sign out?",
                          style: TextStyle(color: Colors.white70),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Need to Add sign-out logic
                              // For example: AuthService.signOut();
                            },
                            child: Text(
                              "Sign Out",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
               ),
             SizedBox(height: 10),
              ],
            ),
          ),
    );
  }
}
