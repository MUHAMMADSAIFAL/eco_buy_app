import 'package:eco_buy_app/eco_buy_app/screens/web_site/add.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/card.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/dashbord.dart'; // Corrected to 'dashboard.dart'
import 'package:eco_buy_app/eco_buy_app/screens/web_site/delete.dart';
import 'package:eco_buy_app/eco_buy_app/screens/web_site/update.dart';
import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class WebHome extends StatefulWidget {
  static const String id = "webhome"; // Made it const for better practice

  const WebHome({super.key});

  @override
  State<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  Widget selectedScreen = const Delete(); // Initialize with a default screen

  void chooseScreen(route) {
    switch (route) {
      case Dashbord.id: // Corrected to Dashboard
        setState(() {
          selectedScreen = const Dashbord();
        });
        break;
      case Add.id:
        setState(() {
          selectedScreen = const Add();
        });
        break;
      case Update.id:
        setState(() {
          selectedScreen = const Update();
        });
        break;
      case Delete.id:
        setState(() {
          selectedScreen = const Delete();
        });
        break;
      case CardScreen.id:
        setState(() {
          selectedScreen = const CardScreen();
        });
        break;
      default:
        setState(() {
          selectedScreen = const Dashbord(); // Fallback to Dashboard
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        title: const Text(
          "Admin",
          style: TextStyle(color: Appcolor.black),
        ),
      ),
      sideBar: SideBar(
        onSelected: (item) {
          chooseScreen(
              item.route.toString()); // Use item.route instead of item.routes
        },
        items: const [
          AdminMenuItem(
            title: "Dashboard",
            icon: Icons.dashboard,
            route: Dashbord.id, // Corrected to Dashboard
          ),
          AdminMenuItem(
            title: "ADD PRODUCTS",
            icon: Icons.add,
            route: Add.id,
          ),
          AdminMenuItem(
            title: "Update Products",
            icon: Icons.edit,
            route: Update.id,
          ),
          AdminMenuItem(
            title: "Delete Products",
            icon: Icons.delete,
            route: Delete.id,
          ),
          AdminMenuItem(
            title: "Card Items",
            icon: Icons.card_giftcard,
            route: CardScreen.id,
          ),
        ],
        selectedRoute: WebHome.id, // Ensure this matches the initial route
      ),
      body: selectedScreen,
    );
  }
}
