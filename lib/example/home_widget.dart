import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_card/card_stack/card_stack_widget.dart';
import 'package:flutter_card/card_stack/model/card_model.dart';
import '../card_stack/model/swipe_horientation.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: _buildTopBar(),
          ),
          Flexible(
            flex: 3,
            child: _buildFromTo(),
          ),
          Flexible(flex: 10, child: _buildCardStackWidget(context))
        ],
      ),
    );
  }

  CardStackWidget _buildCardStackWidget(BuildContext context) {
    var mockList = _buildMockList(size: 4, context: context);
    return CardStackWidget(
        swipeOrientation: SwipeOrientation.up,
        cardDismissOrientation: SwipeOrientation.up,
        positionFactor: 0.3,
        scaleFactor: 0.2,
        alignment: Alignment.center,
        reverseOrder: false,
        cardList: mockList);
  }

  Row _buildFromTo() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.trip_origin),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.trip_origin),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 9,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(hintText: "From..."),
                    )),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(hintText: "To..."),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _buildTopBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: Icon(Icons.arrow_back_ios),
    );
  }

  _buildMockList({int size, BuildContext context}) {
    final double containerWidth = MediaQuery.of(context).size.width - 16;

    var list = List<CardModel>();
    for (int i = 0; i < size; i++) {
      var color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

      list.add(CardModel(
          backgroundColor: color,
          radius: 8,
          shadowColor: Colors.black.withOpacity(0.2),
          child: Container(
              height: 300,
              width: containerWidth,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Apple Palo Alto, 340 University Ave, Palo Alto, CA 94301, Stati Uniti"),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Googleplex, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, Stati Uniti"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("assets/directions.png"),
                  )
                ],
              ))));
    }

    return list;
  }
}
