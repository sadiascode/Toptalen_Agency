import 'package:flutter/material.dart';
import 'package:top_talent_agency/core/roles.dart';
import 'package:top_talent_agency/features/home/widget/custom_alerts.dart';
import 'package:top_talent_agency/features/home/widget/custom_minicontainer.dart';
import 'package:top_talent_agency/features/home/widget/custom_pichart.dart';
import 'package:top_talent_agency/features/home/widget/custom_summary.dart';
import '../widget/custom_coin.dart';

class HomeScreen extends StatelessWidget {
  final UiUserRole role;

  const HomeScreen({super.key, required this.role});

  bool get isAdmin => role == UiUserRole.admin;

  bool get isManager => role == UiUserRole.manager;
  bool get isCreator => role == UiUserRole.creator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xff101828),
            elevation: 0,
            toolbarHeight: 100,
            title: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: ClipOval(
                    child: Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey[300],
                      child: Image.network(
                        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isAdmin ? 'Admin User' : 'Sarah Johnson',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      isAdmin ? 'Welcome back, Admin' : 'Welcome back, Manager',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xffA2A3A3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 9.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isManager) ...[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Text(
                    "You are in 5th position in manager ranking",
                    textAlign: TextAlign.center,
                    style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),

                const SizedBox(height: 15),
                Row(
                  children: [
                    CustomMinicontainer(
                      title: "My Creators",
                      subtitle: "↑ 5.2% from last month",
                      iconPath: 'assets/user.svg',
                      number: 1000,
                      subtitleColor: Color(0xff00A63E),
                    ),
                    SizedBox(width: 9),
                    CustomMinicontainer(
                      title: "Today's Coins",
                      subtitle: "↑ Avg 120 creators each",
                      iconPath: 'assets/icons.svg',
                      number: 20,
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    CustomMinicontainer(
                      title: "Today's Hours",
                      subtitle: "20.0% of total",
                      iconPath: 'assets/clock.svg',
                      number: 240,
                      subtitleColor: Color((0xffF54900)),
                    ),
                    SizedBox(width: 9),
                    CustomMinicontainer(
                      title: "Alerts",
                      subtitle: "Last: 30 mins ago",
                      iconPath: 'assets/alert.svg',
                      number: 45623,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "December Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
              if (isAdmin) ...[
                Row(
                  children: [
                    CustomMinicontainer(
                      title: "Total Creators",
                      subtitle: "↑ 5.2% from last month",
                      iconPath: 'assets/user.svg',
                      number: 1000,
                      subtitleColor: Color(0xff00A63E),
                    ),
                    SizedBox(width: 9),
                    CustomMinicontainer(
                      title: "Managers",
                      subtitle: "↑ Avg 120 creators each",
                      iconPath: 'assets/m.svg',
                      number: 20,
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Row(
                  children: [
                    CustomMinicontainer(
                      title: "Underperforming",
                      subtitle: "20.0% of total",
                      iconPath: 'assets/icons.svg',
                      number: 240,
                      subtitleColor: Color((0xffF54900)),
                    ),
                    SizedBox(width: 9),
                    CustomMinicontainer(
                      title: "Scraped Today",
                      subtitle: "Last: 30 mins ago",
                      iconPath: 'assets/clock.svg',
                      number: 45623,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "December Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
              SizedBox(height: 5),
              CustomPichart(),

              SizedBox(height: 25),
              CustomCoin(),

              SizedBox(height: 20),
              CustomAlerts(),

              SizedBox(height: 20),
              CustomSummary(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
