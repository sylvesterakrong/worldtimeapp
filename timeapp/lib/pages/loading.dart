import 'package:flutter/material.dart';
import 'package:timeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'London', flag: 'germany.png', url: '/Europe/London');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 37, 41, 42),
        body: Center(
          child: SpinKitCubeGrid(
            color: Color.fromARGB(255, 239, 138, 138),
            size: 80.0,
          ),
        ));
  }
}




//alternate loading screen design
//final bool _isLoading = true;
//  _isLoading
//           ? Center(
//               child: Image.asset('assets/loading.gif'), //animated loading gif
//             )
//           : const Padding(
//               padding: EdgeInsets.all(50.0),
//               child: Text('loading'),
//             ),
