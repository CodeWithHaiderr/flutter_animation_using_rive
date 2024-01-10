


import 'package:rive/rive.dart';

class RiveAssetNavBar{
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;


  RiveAssetNavBar(this.src, {
    required this.artboard, required this.stateMachineName, required this.title, this.input});

  set setInput(SMIBool status){
    input = status;
  }
}
List<RiveAssetNavBar> bottomNavBarItems = [
  RiveAssetNavBar(
      "assets/RiveAssets/icons.riv", artboard: "HOME", stateMachineName: "HOME_Interactivity", title: "Home"
  ),
  RiveAssetNavBar(
      "assets/RiveAssets/icons.riv", artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"
  ),
  RiveAssetNavBar(
      "assets/RiveAssets/icons.riv", artboard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"
  ),
  RiveAssetNavBar(
      "assets/RiveAssets/icons.riv", artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Bell"
  ),
  RiveAssetNavBar(
      "assets/RiveAssets/icons.riv", artboard: "USER", stateMachineName: "USER_Interactivity", title: "User"
  ),



];