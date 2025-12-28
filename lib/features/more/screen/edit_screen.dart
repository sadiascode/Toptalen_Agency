import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_talent_agency/common/custom_button.dart';
import 'package:top_talent_agency/core/roles.dart';
import 'package:top_talent_agency/features/auth/widgets/custom_textfield.dart';
import 'package:top_talent_agency/features/more/widget/custom_align.dart';

class EditScreen extends StatelessWidget {
  final UiUserRole role;

  const EditScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
        ),
        title: const Text(
          "Edit Admin",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.width * 0.40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Center(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                             ),
                           ),
                         ),
                       ),
                     ),
                   ]
                 ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () async {final ImagePicker picker = ImagePicker();
                   // Pick an image.
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                   // Capture a photo.
                final XFile? photo = await picker.pickImage(source: ImageSource.camera);
                   // Pick a video.
                final XFile? galleryVideo = await picker.pickVideo(
                  source: ImageSource.gallery,
                );
                  // Capture a video.
                final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
                 // Pick multiple images.
                final List<XFile> images = await picker.pickMultiImage();
                 // Pick singe image or video.
                final XFile? media = await picker.pickMedia();
                 // Pick multiple images and videos.
                final List<XFile> medias = await picker.pickMultipleMedia();},
                child: Text(
                  'Change photo',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                     ),
                   ),
                 ),
              const SizedBox(height: 30),
                Text(
                  'Admin Details',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              SizedBox(height: 10),
              CustomAlign(title: "Admin name"),

              SizedBox(height: 5),
              CustomTextfield(hintText: "Admin User"),

              SizedBox(height: 20),
              CustomAlign(title: "Email ID"),

              SizedBox(height: 5),
              CustomTextfield(hintText: "admin@company.com"),

              SizedBox(height: 20),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Change password',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 10),
              CustomTextfield(hintText: "Password",
              isPassword: true),


              SizedBox(height: 30),
              CustomButton(text: "Save", onTap: (){})
              ]
            )
          ]
      ),
        ),
    );
  }
}
