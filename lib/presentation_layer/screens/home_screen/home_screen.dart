// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:msincl/helper/constants/icon_helper.dart';
import 'package:msincl/helper/constants/string_helper.dart';
import 'package:msincl/presentation_layer/screens/home_screen/components/posts_list.dart';
import 'package:msincl/presentation_layer/widgets/drawer_widget.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';
import 'package:msincl/presentation_layer/screens/home_screen/components/user_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  static const List<Tab> _tabs = [
    const Tab(text: StringHelper.ALL_POSTS),
    const Tab(text: StringHelper.PROFILE),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController!.animateTo(0);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconHelper.ADD_ICON,
        ),
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: IconHelper.SEARCH_ICON)],
          title: TextsWidgets(data: StringHelper.LOREM_IPSUM),
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
              controller: _tabController,
              children: [PostsList(), UserPofile()]),
        ));
  }
}
