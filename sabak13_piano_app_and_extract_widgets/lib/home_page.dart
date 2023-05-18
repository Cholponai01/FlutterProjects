import 'package:flutter/material.dart';

import 'package:sabak13_piano_app_and_extract_widgets/components/container_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Extract Widget')),
        ),
        body: Center(
          child: Column(
            children: [
              Column(
                children: const [
                  ContainerWidget(
                    containerdinTexti: 'Container 1',
                    containerdinTexti2: 'hymn',
                    icon: Icons.sunny,
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Flag_of_Kyrgyzstan.svg/1280px-Flag_of_Kyrgyzstan.svg.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerWidget(
                    containerdinTexti: 'Container 2',
                    containerdinTexti2: 'hymn',
                    icon: Icons.star,
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/d/de/Flag_of_the_United_States.png',
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ContainerWidget(
                    containerdinTexti: 'Container 3',
                    containerdinTexti2: 'hymn',
                    icon: Icons.audiotrack,
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/0/0f/Flag_of_South_Korea.png',
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ContainerWidget(
                    containerdinTexti: 'Container 4',
                    containerdinTexti2: 'hymn',
                    icon: Icons.brightness_3,
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/8/87/Flag_of_Turkey.png',
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ContainerWidget(
                    containerdinTexti: 'Container 5',
                    containerdinTexti2: 'hymn',
                    icon: Icons.euro,
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/4/42/Flag_of_the_United_Kingdom.png',
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ContainerWidget(
                    containerdinTexti: 'Container 6',
                    containerdinTexti2: 'hymn',
                    icon: Icons.camera,
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_India.png/2560px-Flag_of_India.png',
                  ),

                  // Row(
                  //   children: [],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
