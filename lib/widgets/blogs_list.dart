import 'package:blogapp/controllers/blog_list_controller.dart';
import 'package:blogapp/screens/blog/view_blog_screen.dart';
import 'package:blogapp/widgets/blog_card.dart';
import 'package:blogapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogsList extends StatefulWidget {
  final String url;
  const BlogsList({Key? key, required this.url}) : super(key: key);

  @override
  State<BlogsList> createState() => _BlogsListState();
}

class _BlogsListState extends State<BlogsList> {
  final BlogListController controller = Get.put(BlogListController());

  @override
  void initState() {
    super.initState();
    controller.blogList(null);
    controller.fetchData(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.blogList.value == null
          ? Center(child: circularProgress())
          : Obx(
              () => controller.blogList.value != null &&
                      controller.blogList.value!.isEmpty
                  ? const Center(
                      child: Text('No blogs available in database'),
                    )
                  : Obx(
                      () => Column(
                        children: controller.blogList.value!
                            .map((item) => Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () => Get.to(
                                          ViewBlogScreen(blogModel: item)),
                                      child: BlogCard(
                                        blogModel: item,
                                      ),
                                    ),
                                    const SizedBox(height: 0),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
            ),
    );
  }
}
