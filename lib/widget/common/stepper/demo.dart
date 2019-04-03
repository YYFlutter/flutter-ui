import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentStep = 0;
  // final _textEditingController1 = TextEditingController();
  // final _textEditingController2 = TextEditingController();
  // final _textEditingController3 = TextEditingController();
  List<TextEditingController> _textEditingController = [TextEditingController(), TextEditingController(), TextEditingController()];

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
                primaryColor: Theme.of(context).primaryColor
              ),
              child: Stepper(
                physics: NeverScrollableScrollPhysics(),
                type: StepperType.vertical,
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
                    title: Text('Name'),
                    subtitle: Text('User name'),
                    content: Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _textEditingController[0],
                        maxLength: 10,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor
                        ),
                        // autofocus: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.people),
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          )
                        ),
                      ),
                    ),
                    isActive: _currentStep == 0
                  ),
                  Step(
                    title: Text('Phone'),
                    subtitle: Text('User phone'),
                    content: Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _textEditingController[1],
                        maxLength: 18,
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor
                        ),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          )
                        ),
                      ),
                    ),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text('Email'),
                    subtitle: Text('User email'),
                    content: Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _textEditingController[2],
                        maxLength: 20,
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          )
                        ),
                      ),
                    ),
                    isActive: _currentStep == 2
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: _openSimpleDialog,
              child: Text('Click on me to show information',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      )
    );
  }

  Future _openSimpleDialog () async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('User Information'),
          titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
          contentPadding: EdgeInsets.fromLTRB(24.0, 12.0, 0.0, 16.0),
          children: List.generate(3, (index) {
            return Text('${_textEditingController[index].text}');
          }),
        );
      }
    );
  }

}
