import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Nav Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Custom Nav Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: size.width,
                  height: 80,
                  color: Colors.white10,
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(size.width, 80),
                        painter: BNBCustomPainter(),
                      ),
                      Center(
                        heightFactor: 0.8,
                        child: FloatingActionButton(onPressed: () {},
                        backgroundColor: Colors.orange,
                        child: const Icon(Icons.shopping_basket), elevation: 0.1,),
                      ),
                      SizedBox(
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.restaurant_menu)),
                            Container(width: size.width*0.20,),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark)),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green.shade800
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 10);
    path.quadraticBezierTo(size.width * 0.35, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(6.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.70, 0, size.width, 10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
