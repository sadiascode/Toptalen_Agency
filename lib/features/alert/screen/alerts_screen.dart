import 'package:flutter/material.dart';
import 'package:top_talent_agency/core/roles.dart';
import 'package:top_talent_agency/features/alert/widget/custom_alert.dart';
import 'package:top_talent_agency/features/alert/widget/custom_medium.dart';

class AlertsScreen extends StatefulWidget {
  final UiUserRole role;

  const AlertsScreen({super.key, required this.role});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  int selectedIndex = 0;

  late final List<String> tabs;

  @override
  void initState() {
    super.initState();

    if (widget.role == UiUserRole.manager) {
      tabs = ['All', 'Under', 'Spike'];
    } else {
      tabs = ['All', 'Under', 'Spike', 'Target', 'System'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Alerts",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
                  body: SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

              SizedBox(height: 15),
              CustomMedium(),

              SizedBox(height: 20),
              Container(
                height: 46,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: List.generate(tabs.length, (index) {
                    bool isSelected = selectedIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10),
              Positioned(
                left: 12,
                top: 4,
                child: Container(
                  height: 1,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E7EB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomAlert(
                  name: 'Sarah Johnson',
                  description: 'Sarah Johnson is underperforming - 59% of \ntarget',
                  date: '02/12/2025, 13:31:55',
                  containerColor: Color(0xFFFEF2F2),
                  containerBorderColor: Color(0xFFFFCDD2)
              ),

              SizedBox(height:15),
              CustomAlert(name: 'Lisa Anderson',
                description: 'Lisa Anderson experienced a 40% drop in \nengagement',
                date: '02/12/2025, 13:31:55',
                containerColor: Color(0xFFFEF2F2),
                containerBorderColor: Color(0xFFFFCDD2),
              ),

              SizedBox(height:15),
              CustomAlert(name: 'Sarah Johnson',
                description: 'Monthly target at risk - 65% completion with 5 \ndays remaining',
                date: '02/12/2025, 13:31:55',
                containerColor: Color(0xffFFF9F2),
                containerBorderColor: Color(0xffFFD6A7),
              ),

              SizedBox(height:15),
              CustomAlert(name: 'Lisa Anderson',
                description: 'TikTok API token expiring in 3 days',
                date: '02/12/2025, 13:31:55',
                containerColor: Color(0xffFFF9F2),
                containerBorderColor: Color(0xffFFD6A7),
              ),
              ]
              ),
              )
              ),

          );
  }
}