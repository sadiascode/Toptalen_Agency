import 'package:flutter/material.dart';
import 'package:top_talent_agency/features/home/widget/custom_pichart.dart';
import 'package:top_talent_agency/features/manager/widget/ai_analysis_card.dart';
import 'package:top_talent_agency/features/manager/widget/custom_last.dart';
import 'package:top_talent_agency/features/manager/widget/live_chart.dart';
import 'package:top_talent_agency/features/manager/widget/profile_card.dart';
import 'package:top_talent_agency/features/manager/widget/progress_card.dart';


class CreatorDetailsScreen extends StatelessWidget {
  const CreatorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
        ),
        title: const Text(
          "Creator Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff0B1220), Color(0xff1A2A3A)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ProfileCard(),
            ),

            const SizedBox(height: 14),

            const Text(
              "December Overview",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            const CustomPichart(),
            const SizedBox(height: 16),

            AiAnalysisCard(),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Target vs Actual (Current Month)",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),

                  ProgressCard(
                    subtitle: "120.0%",
                    title: "Coins",
                    percent: 1.2,
                    left: "13,057 / 10,881",
                    right: "+2,176",
                  ),

                  const SizedBox(height: 10),

                  ProgressCard(
                    subtitle: "114.4%",
                    title: "Hours",
                    percent: 1.144,
                    left: "143h / 125h",
                    right: "+18h",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const LiveChart(),

            const SizedBox(height: 18),
            CustomLast(),
          ],
        ),
      ),
    );
  }
}
