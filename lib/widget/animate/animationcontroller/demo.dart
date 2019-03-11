import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationController'),
      ),
      body: AnimationDemo()
    );
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
  with TickerProviderStateMixin{

  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
    void initState() {
      super.initState();
      animationDemoController = AnimationController(
        // value: 32,
        // lowerBound: 32,
        // upperBound: 100,
        duration: Duration(milliseconds: 2500),
        vsync: this
      );
      

      curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceOut);

      animation = Tween(begin: 32.0, end: 100.0).animate(curve);
      animationColor = ColorTween(begin: Colors.pinkAccent, end: Colors.red).animate(curve);

      animationDemoController.addListener(() {
        print('当前动画值：${animationDemoController.value}');
      });
      animationDemoController.addStatusListener((AnimationStatus status) {
        print('当前动画状态:${status}');
      });
      animationDemoController.forward();
    }

    @override
      void dispose() {
        super.dispose();
        animationDemoController.dispose();
      }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor
        ],
        controller: animationDemoController,
      ),
    );
  }
}


class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller
  }):super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: (){
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}