import 'package:flutter/material.dart';
import 'calculate.dart';

class bmiresult_ extends StatefulWidget {
  const bmiresult_(
      {Key? key, required this.bmiresult, required this.textresult})
      : super(key: key);

  final String bmiresult;
  final String textresult;

  @override
  _bmiresult_State createState() => _bmiresult_State();
}

class _bmiresult_State extends State<bmiresult_> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'RESULT BMI',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Colors.grey, Colors.white],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Your BMI is',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          widget.bmiresult,
                          style: const TextStyle(
                              fontSize: 66, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          widget.textresult,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
