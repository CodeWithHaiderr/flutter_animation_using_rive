


import 'package:animated_app_using_rive/home/home_screen.dart';
import 'package:animated_app_using_rive/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'models/bottomnavbar_rive_asset.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAssetNavBar selectedBottomNav = bottomNavBarItems.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(bottomNavBarItems.length, (index) => GestureDetector(
                onTap: (){
                  bottomNavBarItems[index].input?.change(true);
                  if(bottomNavBarItems[index] != selectedBottomNav){
                    setState(() {
                      selectedBottomNav = bottomNavBarItems[index];
                    });
                  }
                  Future.delayed(const Duration(seconds: 1), () {
                    bottomNavBarItems[index].input?.change(false);
                  });
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Opacity(
                    opacity: bottomNavBarItems[index] == selectedBottomNav ? 1 : 0.5,
                    child: RiveAnimation.asset(bottomNavBarItems.first.src,
                      artboard: bottomNavBarItems[index].artboard,
                      onInit: (artboard){
                        StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: bottomNavBarItems[index].stateMachineName);
                        bottomNavBarItems[index].input = controller.findSMI("active") as SMIBool;
                      },
                    ),
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
