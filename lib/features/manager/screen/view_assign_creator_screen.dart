import 'package:flutter/material.dart';
import 'package:top_talent_agency/features/manager/screen/creator_details_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_talent_agency/features/manager/screen/saras_rank.dart';


import 'package:top_talent_agency/core/roles.dart';

class ViewAssignCreatorsScreen extends StatelessWidget {
  final UiUserRole role;

  const ViewAssignCreatorsScreen({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          role == UiUserRole.manager
              ? "My Creators"
              : "Sarah’s creators",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        leading: role == UiUserRole.manager
            ? null
            : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Search creators...",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Showing 20 of 20 managers",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff6A7282),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SarasRank (),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'assets/soil.svg',
                      color: Color(0xff101828),
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            _creatorCard(
              context: context,
              name: "djes.yt",
              status: "Excellent",
              statusColor: Color(0xff22C55E),
              manager: "Sarah Johnson",
              coins: "17.8K / 14.8K",
              hours: "154h / 134h",
              progressColor: Color(0xff22C55E),
              success: true,
            ),

            _creatorCard(
              context: context,
              name: "sarah.h",
              status: "Underperforming",
              statusColor: Color(0xffDC2626),
              manager: "Emily Rodriguez",
              coins: "6.3K / 10.5K",
              hours: "72h / 112h",
              progressColor: Color(0xffDC2626),
              success: false,
            ),

            _creatorCard(
              context: context,
              name: "djes.yt",
              status: "Good",
              statusColor: Color(0xff3B82F6),
              manager: "Emily Rodriguez",
              coins: "12.9K / 14.3K",
              hours: "97h / 103h",
              progressColor: Color(0xff3B82F6),
              success: true,
            ),

            _creatorCard(
              context: context,
              name: "sarah.h",
              status: "Underperforming",
              statusColor: Color(0xffDC2626),
              manager: "Emily Rodriguez",
              coins: "6.3K / 10.5K",
              hours: "72h / 112h",
              progressColor: Color(0xffDC2626),
              success: false,
            ),

            _creatorCard(
              context: context,
              name: "djes.yt",
              status: "Good",
              statusColor: Color(0xff3B82F6),
              manager: "Emily Rodriguez",
              coins: "12.9K / 14.3K",
              hours: "97h / 103h",
              progressColor: Color(0xff3B82F6),
              success: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _creatorCard({
    required BuildContext context,
    required String name,
    required String status,
    required Color statusColor,
    required String manager,
    required String coins,
    required String hours,
    required Color progressColor,
    required bool success,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CreatorDetailsScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=12",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              status,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Manager: $manager",
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "$coins   •   $hours",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Icon(
                      success ? Icons.check_circle : Icons.error,
                      color: success
                          ? const Color(0xff22C55E)
                          : const Color(0xffDC2626),
                      size: 18,
                    ),
                    const SizedBox(height: 6),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: success ? 1 : 0.6,
              minHeight: 4,
              backgroundColor: Colors.grey.shade200,
              color: progressColor,
            ),
          ],
        ),
      ),
    );
  }
}
