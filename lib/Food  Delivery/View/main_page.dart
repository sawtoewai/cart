import 'package:flutter/material.dart';
import '../../consts.dart';
import '../Model/bottom_icon_model.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List selectedPage = [
    const HomePage(),
    const Center(child: Text("Message Page")),
    const Center(child: Text("Explore Page")),
    const Center(child: Text("Profile Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              bottomIcons.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Icon(
                        currentIndex == index
                            ? bottomIcons[index].selected
                            : bottomIcons[index].unselected,
                        color: kblack,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(
                          color: kblack,
                          shape: BoxShape.circle,
                        ),
                        width: currentIndex == index ? 4 : 0,
                        height: currentIndex == index ? 4 : 0,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: selectedPage[currentIndex],
    );
  }
}
