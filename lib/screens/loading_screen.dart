
import 'package:flutter/material.dart';
import '../screens/location_screen.dart';
import '../services/weather.dart';
import 'package:tempo_template/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '48dffcee1ec94cedee47ee637046b9bc';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  void pushToLocationScreen(dynamic weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(localWeatherData: weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    pushToLocationScreen(weatherData);
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

}
