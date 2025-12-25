import 'package:flutter/material.dart';

class CustomMedium extends StatelessWidget {
  const CustomMedium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            width: 111,
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xffFEF2F2),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '16',
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff82181A)),
                ),
                Text(
                  'High',
                  style: TextStyle(fontSize: 12, color: Color(0xffC10007)),
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: 111,
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xffFFF7ED),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff82181A)),
                ),
                Text(
                  'Medium',
                  style: TextStyle(fontSize: 12, color: Color(0xffCA3500)),
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: 111,
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xffFEFCE8),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '0',
                  style: TextStyle
                    (fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff82181A)),
                ),
                Text(
                  'Low',
                  style: TextStyle(fontSize: 12, color: Color(0xff82181A)),
                ),
              ],
            ),
          ),
        ]
    );
  }
}