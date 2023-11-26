import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    // ignore: avoid_print
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'daytime.jpg' : 'nighttime.jpg';
    Color bgColor = data['isDaytime']
        ? const Color.fromARGB(255, 25, 175, 180)
        : const Color.fromARGB(255, 3, 7, 31);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.edit_location_alt_outlined,
                    color: Colors.grey[300],
                  ),
                  // ignore: prefer_const_constructors
                  label: Text(
                    'Edit Location',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  data["time"],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
