import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_talent_agency/core/roles.dart';
import 'package:top_talent_agency/features/manager/screen/manager_details_screen.dart';
import 'package:top_talent_agency/features/manager/screen/view_assign_creator_screen.dart';
import 'package:top_talent_agency/features/manager/widget/custom_text.dart';

class CustomSortview extends StatelessWidget {
  const CustomSortview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 318,
      width: 382,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ManagerDetailsScreen(),
                ),
              );
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Sarah Johnson',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                        size: 28,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '120',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1C398E),
                          ),
                        ),
                        Text(
                          'Creators',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff1C398E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '72',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0D542B),
                        ),
                      ),
                      Text(
                        'Excellent',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff0D542B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '48',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff82181A),
                        ),
                      ),
                      Text(
                        'At Risk',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff82181A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ViewAssignCreatorsScreen(
                    role: UiUserRole.admin,
                  ),
                ),
              );
            },
            child: Container(
              height: 40,
              width: 349,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/user.svg',
                    width: 17,
                    height: 17,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'View Assigned Creators',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 17),
          CustomText(),
        ],
      ),
    );
  }
}
