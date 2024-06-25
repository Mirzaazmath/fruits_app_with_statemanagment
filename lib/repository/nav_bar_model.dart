
import 'package:flutter/material.dart';

class NavData{
  final IconData icon;
  final String title;
  NavData({required this.icon,required this.title});
}
List<NavData>navbarlist=[
  NavData(icon: Icons.home,title: "Home"),
  NavData(icon: Icons.search,title: "Search"),
  NavData(icon: Icons.location_on_rounded,title: "Location"),
  NavData(icon: Icons.person,title: "Profile"),

];