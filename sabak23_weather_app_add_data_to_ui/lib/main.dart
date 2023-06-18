import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sabak23_weather_app_add_data_to_ui/constants/app_colors.dart';
import 'package:sabak23_weather_app_add_data_to_ui/constants/app_text_styles.dart';
import 'package:sabak23_weather_app_add_data_to_ui/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Weather?> fetchData() async {
    Dio dio = Dio();
    await Future.delayed(
      Duration(seconds: 4),
    );
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=bishkek,&appid=41aa18abb8974c0ea27098038f6feb1b');
    if (response.statusCode == 200) {
      final Weather weather = Weather(
        id: response.data['weather'][0]['id'],
        main: response.data['weather'][0]['main'],
        description: response.data['weather'][0]['description'],
        icon: response.data['weather'][0]['icon'],
        temp: response.data['main'][0]['temp'],
        name: response.data['weather'][0]['name'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyHomePage'),
        ),
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return const Text('Сизде интернет байланышы узулду');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                final pogoda = snapshot.data;
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/bgImage.jpg'),
                    ),
                  ),
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.near_me, color: AppColors.iconColor),
                          Icon(Icons.location_city, color: AppColors.iconColor),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Text(pogoda!.temp, style: AppTextStyles.sanTextStyle),
                        Image.asset(
                          'assets/image/cloudImage.png',
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        pogoda.description.replaceAll(' ', '\n'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        pogoda.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    )
                  ]),
                );
              } else {
                return const Text('Дата келген жок');
              }
            } else {
              return const Text('Белгисиз катачылыктар бар');
            }
          },
        ));
  }
}
