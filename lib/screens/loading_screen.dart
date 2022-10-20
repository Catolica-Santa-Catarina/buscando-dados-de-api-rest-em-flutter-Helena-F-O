import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../screens/location_screen.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
  void initState() {
    // é disparado quando o Widget for criado
  }

  Widget? build(BuildContext context) {
    // disparado quando o objeto for construído e o widget aparecerá na tela
    return null;
  }

  void deactivate() {
    // é disparado quando o widget foi destruído
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> getLocation() async {
    Location = getCurrentLocation(Latitude, Longitude)
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
