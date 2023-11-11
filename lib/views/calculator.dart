
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});


  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x=0;
  int y=0;
  num z=0;
  late final AppLifecycleListener _listener;
 final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();
@override
  void initState() {
   displayOneController.text= x.toString();
   displayTwoController.text= y.toString();
    super.initState();
    _listener=AppLifecycleListener(
      onShow:_onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
       onStateChange: _onStateChange,
       // onExitRequested:_onExitRequested,
    );
  }
  void _onShow() => print("onShow called");
void _onHide() => print("_onhide called");
  void _onResume() => print("_onResume called");
  void _onDetach() => print("_onDetach called");
  void _onInactive() => print("_onInactive called");
  void _onPause() => print("__onPause called");
  void _onRestart() => print( "_onRestart called");
  void _onStateChange(AppLifecycleState state){
    print("_onStateChange called : $state");
  }
  @override
  void dispose(){
  displayOneController.dispose();
  displayTwoController.dispose();
  _listener.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children:[
          //calculator display
           DisplayOne(hint: "Enter First Number", controller: displayOneController),
          const SizedBox(height: 30,),
           DisplayOne(hint: "Enter Second Number", controller: displayTwoController),
           Text(
             key:Key("result"),
             z.toString(),
          style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              FloatingActionButton(
                onPressed:(){
                  setState(() {
                    z=num.tryParse(displayOneController.text)!+
                        num.tryParse(displayTwoController.text)!;

                  });

                },
              child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(
                  onPressed:(){
                    setState(() {
                      z=num.tryParse(displayOneController.text)!-
                          num.tryParse(displayTwoController.text)!;

                    });
                  },
                  child:  Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed:(){
                    setState(() {
                      z=num.tryParse(displayOneController.text)!*
                          num.tryParse(displayTwoController.text)!;

                    });
                  },
                  child: Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed:(){
                    setState(() {
                      z=num.tryParse(displayOneController.text)!/
                          num.tryParse(displayTwoController.text)!;

                    });

                  },
                  child: const Icon(CupertinoIcons.divide)),
            ]
          ),
          const SizedBox(height:10),
          FloatingActionButton.extended(
              onPressed:(){
               setState(() {
                 x=0;
                 y=0;
                 z=0;
                 displayTwoController.clear();
                 displayOneController.clear();
               });

              },
              label: const Text("clear"),//expand
          )// buttons
        ]

      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({
    super.key,
    this.hint = "Enter a number",required this.controller
  });
final String? hint;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,

      decoration: InputDecoration(

  focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
      color: Colors.white,
          width: 3.0,
      ),
    borderRadius:BorderRadius.circular(10),
  ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
            borderRadius:BorderRadius.circular(10),
          ),
        hintText: hint,
          hintStyle:const TextStyle(
            color: Colors.yellowAccent,
          )
      ),
    );
  }
}

