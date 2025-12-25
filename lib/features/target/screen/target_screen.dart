import 'package:flutter/material.dart';
import 'package:top_talent_agency/features/target/widget/custom_targets.dart';

class TargetsScreen extends StatelessWidget {
  const TargetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
          "Total targets for Agency",
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
             CustomTargets(),

             SizedBox(height: 20),
             CustomTargets(
               year: 'January 2026',
               progressBarColor: Colors.red,
               containerColor: Color(0xffFEF2F2),
               containerBorderColor: Color(0xffFEF2F2),
             ),

             SizedBox(height: 20),
             CustomTargets(),

             SizedBox(height: 20),
             CustomTargets(
               year: 'November 2025',
               progressBarColor: Color(0xff00A63E),
               containerColor: Color(0xffF0FDF4),
               containerBorderColor: Color(0xffFEF2F2),
             ),
            ]
          ),
        ),
      ),
    );
  }
}

