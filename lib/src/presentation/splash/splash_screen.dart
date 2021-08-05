import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../presentation.dart';

class SplashSceenState extends StatefulWidget {
  const SplashSceenState({Key? key}) : super(key: key);

  @override
  _SplashSceenStateState createState() => _SplashSceenStateState();
}

class _SplashSceenStateState extends State<SplashSceenState>
    with ResponsiveWidget {
  late dynamic _viewModel;

  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
        viewModel: SplashViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel?.init();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            body: buildUi(context: context),
          );
        });
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return buildBody(context);
  }

  @override
  Widget buildTablet(BuildContext context) {
    return buildBody(context);
  }
}

Widget buildBody(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: Colors_Grey),
    child: Stack(
      children: [
        PageView(
          physics: ClampingScrollPhysics(),
          // controller: _pageController,
          // onPageChanged: (int page) {
          //   SetSt
          // },
          children: <Widget>[
            Stack(
              children: [
                Center(
                  child: imgbookDS(),
                ),
                CustomPaint(
                  painter: FaceOutlinePainterT(),
                  child: bodyPartNoteBook(context),
                ),
              ],
            ),
            Stack(
              children: [
                Center(
                  child: imgSpeech(context),
                ),
                CustomPaint(
                  painter: FaceOutlinePainterD(),
                  child: bodyPartSpeech(context),
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: imgAddNote(context),
                ),
                CustomPaint(
                  painter: FaceOutlinePainterT(),
                  child: bodyPartAddNote(context),
                ),
              ],
            ),
          ],
        ),
        buttonBelow(context),
      ],
    ),
  );
}

buttonBelow(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 40,
              width: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text('Skip')),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: threeDots(true),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors_Purple),
              child: Center(
                  child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    ),
  );
}

threeDots(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 10,
    width: 10,
    decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.5) : Colors.green,
        borderRadius: BorderRadius.circular(12)),
  );
}

bodyPartNoteBook(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: MediaQuery.of(context).size.height / 2.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: textNoteBook(),
    ),
  );
}

bodyPartSpeech(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: CustomPaint(
      painter: FaceOutlinePainterD(),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.7,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: textSpeeck(),
      ),
    ),
  );
}

bodyPartAddNote(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: CustomPaint(
      painter: FaceOutlinePainterT(),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.7,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: textAddNote(),
      ),
    ),
  );
}

textNoteBook() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'NoteBooks',
        style: TextStyle(color: Colors.purple, fontSize: 25),
      ),
      SizedBox(
        height: 45,
      ),
      Text(
        'Nottebook are the best place',
        style: TextStyle(color: Colors_Purple),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'to manage your ',
            style: TextStyle(color: Colors_Purple),
          ),
          Text(
            "Notes",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      SizedBox(
        height: 100,
      ),
    ],
  );
}

textSpeeck() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Speech to Text',
        style: TextStyle(color: Colors.purple, fontSize: 25),
      ),
      SizedBox(
        height: 45,
      ),
      Text(
        'Why write note can do',
        style: TextStyle(color: Colors_Purple),
      ),
      Text(
        'that for you just say an it will',
        style: TextStyle(color: Colors_Purple),
      ),
      Text(
        'become text',
        style: TextStyle(color: Colors_Purple),
      ),
      SizedBox(
        height: 100,
      ),
    ],
  );
}

textAddNote() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Add Notes to Notebook',
        style: TextStyle(color: Colors.purple, fontSize: 25),
      ),
      SizedBox(
        height: 45,
      ),
      Text(
        'Simply create your note and',
        style: TextStyle(color: Colors_Purple),
      ),
      Text(
        'add it to your favorite',
        style: TextStyle(color: Colors_Purple),
      ),
      Text(
        'notebook',
        style: TextStyle(color: Colors_Purple),
      ),
      SizedBox(
        height: 100,
      ),
    ],
  );
}

imgbookDS() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Image.asset(
            AppImages.book1,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book2,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book3,
            height: 137,
            width: 105,
          ),
        ],
      ),
      Column(
        children: [
          Image.asset(
            AppImages.book1,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book2,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book3,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book3,
            height: 137,
            width: 105,
          ),
        ],
      ),
      Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Image.asset(
            AppImages.book1,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book2,
            height: 137,
            width: 105,
          ),
          Image.asset(
            AppImages.book3,
            height: 137,
            width: 105,
          ),
        ],
      )
    ],
  );
}

imgSpeech(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          child: Image.asset(AppImages.songAm),
        ),
      ],
    ),
  );
}

imgAddNote(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 2,
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(AppImages.bookImg),
      SizedBox(
        width: 60,
      ),
      Image.asset(AppImages.notesBook),
    ]),
  );
}

class FaceOutlinePainterT extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.72, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainterT oldDelegate) => false;
}

class FaceOutlinePainterD extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2.5, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainterD oldDelegate) => false;
}
