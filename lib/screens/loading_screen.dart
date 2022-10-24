import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../screens/location_screen.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        getLocationWeather: weatherData,
      );
    }));
  }

  void getData() async {
    var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) { // se a requisição foi feita com sucesso
      var data = response.body;
      print(data);  // imprima o resultado
    } else {
      print(response.statusCode);  // senão, imprima o código de erro
    }
  }

  @override
  Widget build(BuildContext context) {

    var data = getData();
    data;

    return const Scaffold(

    );
  }
}
