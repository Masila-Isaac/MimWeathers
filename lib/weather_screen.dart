// lib/weather_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter City'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                weatherProvider.fetchWeather(_controller.text);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 32),
            if (weatherProvider.isLoading)
              CircularProgressIndicator()
            else if (weatherProvider.weatherData != null)
              WeatherDetails(weatherData: weatherProvider.weatherData!),
          ],
        ),
      ),
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherDetails({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weatherData['name']}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          '${weatherData['main']['temp']} °C',
          style: TextStyle(fontSize: 48),
        ),
        Text(
          '${weatherData['weather'][0]['description']}',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
