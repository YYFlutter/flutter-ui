import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentStep = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: (){
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('Confirm your information'),
                    isActive: _currentStep == 0
                  ),
                  Step(
                    title: Text('Choose plan'),
                    subtitle: Text('Choose your plan'),
                    content: Text('Confirm your information'),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Confirm yoir payment method'),
                    content: Text('Confirm your information'),
                    isActive: _currentStep == 2
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
