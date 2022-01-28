import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'bmi_result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculate.dart';

class bmimain_ extends StatefulWidget {
  const bmimain_({Key? key}) : super(key: key);

  @override
  _bmimain_State createState() => _bmimain_State();
}

class _bmimain_State extends State<bmimain_> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Home',
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(children: [
                      wight_input(),
                      hight_input(),
                      accept_send(context),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget wight_input() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          margin: const EdgeInsets.all(8),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _weightController,
            decoration: const InputDecoration(
              prefixIcon: const Icon(
                FontAwesomeIcons.weight,
              ),
              labelText: "input wight [Kg]",
              labelStyle: const TextStyle(fontSize: 16),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          )),
    );
  }

  Widget hight_input() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          margin: const EdgeInsets.all(8),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _heightController,
            decoration: const InputDecoration(
              prefixIcon: const Icon(
                FontAwesomeIcons.arrowsAltV,
              ),
              labelText: "input hight [Cm]",
              labelStyle: const TextStyle(fontSize: 16),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          )),
    );
  }

  // ElevatedButton accept_send(BuildContext context) {
  //   return ElevatedButton(
  //       child: const Text('Calculate'),
  //       onPressed: () {
  //         if (_weightController.text.isNotEmpty &&
  //             _heightController.text.isNotEmpty) {
  //           Calculator cal = Calculator(double.parse(_weightController.text),
  //               double.parse(_heightController.text));
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => bmiresult_(
  //                   bmiresult: cal.calculateBMI(),
  //                   textresult: cal.resultText(),
  //                 ),
  //               ));
  //         } else {
  //           fToast.showToast(
  //             // toastDuration: Duration(milliseconds: 500),
  //             child: Material(
  //               color: Colors.red,
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   const Icon(FontAwesomeIcons.windowClose),
  //                   Text(
  //                     " height and weight must not empty!",
  //                     style: TextStyle(color: Colors.black87, fontSize: 18.0),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             gravity: ToastGravity.BOTTOM,
  //           );
  //         }
  //       });
  // }

  SizedBox accept_send(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            child:
                const Text('Calculate', style: TextStyle(color: Colors.black)),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
              foregroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              if (_weightController.text.isNotEmpty &&
                  _heightController.text.isNotEmpty) {
                Calculator cal = Calculator(
                    double.parse(_weightController.text),
                    double.parse(_heightController.text));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bmiresult_(
                        bmiresult: cal.calculateBMI(),
                        textresult: cal.resultText(),
                      ),
                    ));
              } else {
                fToast.showToast(
                  // toastDuration: Duration(milliseconds: 500),
                  child: Material(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(FontAwesomeIcons.windowClose),
                        Text(
                          " height and weight must not empty!",
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  gravity: ToastGravity.BOTTOM,
                );
              }
            }),
      ),
    );
  }
}
