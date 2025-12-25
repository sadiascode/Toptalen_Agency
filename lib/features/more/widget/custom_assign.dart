import 'package:flutter/material.dart';
import 'package:top_talent_agency/common/custom_button.dart';
import 'package:top_talent_agency/features/auth/widgets/custom_textfield.dart';

class CustomAssign extends StatelessWidget {
  const CustomAssign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 398,
      width: 382,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Manager Name",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: CustomTextfield(hintText: "Enter manager name"),
            ),

            SizedBox(height: 20),
            const Text(
              "Email Address",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: CustomTextfield(hintText: "manager@company.name"),
            ),

            SizedBox(height: 20),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: CustomTextfield(hintText: "Enter initial password",
              isPassword: true),
            ),

            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child:  CustomButton(text: "Assign Manager", onTap: (){})
            ),
          ],
        ),
      ),
    );
  }
}
