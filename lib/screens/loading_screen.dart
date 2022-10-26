import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../screens/location_screen.dart';
import '../services/networking.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '48dffcee1ec94cedee47ee637046b9bc';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
  void initState() {
    // é disparado quando o Widget for criado
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }

  void deactivate() {
    // é disparado quando o widget foi destruído
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  void pushToLocationScreen(dynamic weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData, getLocationWeather: null,);
    }));
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  Future<void> getLocation() async {
    var location = Location();
    await location.getCurrentPosition();

    latitude = location.latitude!;
    longitude = location.longitude!;

    getData();
  }

  void getData() async {
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/'
        'data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {

    var data = getData();
    data;

    return const Scaffold(

    );
  }
}
