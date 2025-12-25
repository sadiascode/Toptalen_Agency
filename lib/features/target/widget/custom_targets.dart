import 'package:flutter/material.dart';

class CustomTargets extends StatelessWidget {
  final String year;
  final Color progressBarColor;
  final Color containerColor;
  final Color containerBorderColor;

  const CustomTargets({
    super.key,
    this.year = 'December 2025',
    this.progressBarColor = const Color(0xff155DFC),
    this.containerColor = const Color(0xFFE3F2FD),
    this.containerBorderColor = const Color(0xFFBBDEFB),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 391,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '1,247 creators assigned',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 17),

          // Coin
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coins Progress',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4A5565),
                ),
              ),
              Text(
                '87.1%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.871,
              minHeight: 12,
              backgroundColor: Color(0xFFE0E0E0),
              valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '82,750,000',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Target: 95,000,000',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Hour
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hours Progress',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Text(
                '88.7%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.887,
              minHeight: 12,
              backgroundColor: Color(0xFFE0E0E0),
              valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '119,800',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Target: 135,000',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 103,
                  width: 153,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: containerBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coins Gap',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '-12,250,000',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFAB47BC),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'behind target',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 103,
                  width: 153,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: containerBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hours Gap',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '-15,200',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'behind target',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Example usage:
// CustomTargets() // Default colors
//
// CustomTargets(
//   year: 'January 2026',
//   progressBarColor: Colors.green,
//   containerColor: Color(0xFFE8F5E9),
//   containerBorderColor: Color(0xFFA5D6A7),
// )