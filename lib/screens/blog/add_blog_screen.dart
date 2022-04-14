import 'package:blogapp/screens/auth/components/auth_button.dart';
import 'package:blogapp/screens/blog/components/image_place_holder.dart';
import 'package:blogapp/screens/blog/controllers/add_blog_controller.dart';
import 'package:blogapp/screens/profile/components/profile_field.dart';
import 'package:blogapp/widgets/image_bottom_sheet.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogScreen extends GetView<AddBlogController> {
  const AddBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddBlogController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Obx(
                () => controller.imageFile.value == null
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) {
                              return ImageBottomSheet(
                                title: 'Upload Blog Image',
                                cameraPressed: () =>
                                    controller.pickImage(ImageSource.camera),
                                galleryPressed: () =>
                                    controller.pickImage(ImageSource.gallery),
                              );
                            }),
                          );
                        },
                        child: const ImagePlaceHolder(),
                      )
                    : Image.file(
                        controller.imageFile.value!,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.28,
                      ),
              ),
              const SizedBox(height: 24),
              ProfileField(
                controller: controller.titleController,
                labelText: 'Title',
                hintText: 'Provide title of your blog',
                maxLength: 60,
                iconData: Icons.title,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title can\'t be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ProfileField(
                controller: controller.bodyController,
                labelText: 'Description',
                hintText: 'Provide description of your blog',
                iconData: Icons.description,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                maxLines: null,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description can\'t be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: Obx(
                  () => controller.loading.value
                      ? circularProgress()
                      : AuthButton(
                          text: 'Add Blog',
                          onPressed: () => controller.addPost(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
