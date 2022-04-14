import 'package:blogapp/widgets/blogs_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEEEEFF),
      body: SingleChildScrollView(
        child: BlogsList(
          url: '/blogPost/getOtherBlogs',
        ),
      ),
    );
  }
}
