import 'package:auto_route/auto_route.dart';
import 'package:data_on/ui/share/scaffold/base_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Hỗ trợ",
      child: const Center(
        child: Text("Hỗ trợ"),
      ),
    );
  }
}
