import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAlert extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String priorityLabel;
  final Color priorityConColor;
  final Color priorityColor;
  final String categoryLabel;
  final Color categoryLabelCo;
  final String name;
  final String description;
  final String date;
  final Color containerColor;
  final Color containerBorderColor;

  const CustomAlert({
    super.key,
    this.icon = Icons.trending_down,
    this.iconColor = Colors.red,
    this.iconBgColor = const Color(0xFFFFE5E5),
     required this.priorityLabel ,
    required this. priorityConColor,
     required this.priorityColor ,
     required this.categoryLabel,
    required this.categoryLabelCo,
    required this.name,
    required this.description,
    required this.date,
    required this.containerColor ,
    required this.containerBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: containerBorderColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: priorityConColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  priorityLabel,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                decoration: BoxDecoration(
                  color: priorityColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  categoryLabel,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: categoryLabelCo,
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController _textController = TextEditingController();
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("Create notification"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: 'Type your message',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              String reason = _textController.text.trim();
                              if (reason.isNotEmpty) {
                                print("Reason: $reason");
                              }
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: const Text(
                                  "Send notification",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SvgPicture.asset(
                  'assets/notification.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              )
            ],
          ),

          const SizedBox(height: 5),
          Padding(
          padding: const EdgeInsets.only(left: 57),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    )
    ]
    )
    );
  }
}