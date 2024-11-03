import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

class WeatherDashboardApp extends StatelessWidget {
  const WeatherDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String weather = '';
  String temperature = '';
  String humidity = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiKey = '0209f503da0eefee4c6eb3030aad52a1';
    final city = 'Ha Noi';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          weather = data['weather'][0]['description'];
          temperature = data['main']['temp'].toString();
          humidity = data['main']['humidity'].toString();
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      setState(() {
        weather = 'Error fetching data';
        temperature = '';
        humidity = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color.fromARGB(255, 30, 209, 225),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Current Weather: $weather',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Temperature: $temperature°C',
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black54,
            ),
              textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Humidity: $humidity%',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
        ),
        textAlign: TextAlign.center,  
        ),
          ],
        ),
      )),
    );
  }
}
