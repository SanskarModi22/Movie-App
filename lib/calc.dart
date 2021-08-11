import 'package:calculator/details.dart';
import 'package:calculator/hex_colour.dart';
import 'package:calculator/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

class MoviesListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Flexible(
            child: Stack(
              children: <Widget>[
                Positioned(child: movieCard(movieList[index], context)),
                Positioned(
                    top: 10.0, child: movieImage(movieList[index].Images[0])),
              ],
            ),
          );
          // return Card(
          //   elevation: 8.0,
          //   color: Colors.white,
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       child: Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             image: DecorationImage(
          //                 image: NetworkImage(movieList[index].Images[0]),
          //                 fit: BoxFit.cover)),
          //
          //       ),
          //     ),
          //     subtitle: Text("${movieList[index].Title}"),
          //     title: Text(movieList[index].Title),
          //     trailing: Text("..."),
          //     onTap: () {
          //       //
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Detail(
          //               movieName: movieList.elementAt(index).Title,
          //               movie: movieList[index]),
          //         ),
          //       );
          //     },
          //   ),
          // );
        },
      ),
    );
  }

  Widget movieCard(Movie Mov, BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          elevation: 20.0,
          color: Colors.white38,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 54.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          Mov.Title,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,fontStyle: FontStyle.italic),
                        ),
                      ),
                      Text(
                        "Rating: ${Mov.imdbRating}/10",
                        style: mainTextStyle(),
                      ),
                    ],
                  ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Released: ${Mov.Released}",
                            style: mainTextStyle(),
                          ),
                          Text(
                            Mov.Runtime,
                            style: mainTextStyle(),
                          ),
                          Text(
                            Mov.Rated,
                            style: mainTextStyle(),
                          ),
                        ],
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              movieName: Mov.Title,
              movie: Mov,
            ),
          ),
        );
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 12.0, color: Colors.black87,fontWeight: FontWeight.w500);
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                imageUrl ?? 'https://picsum.photos/200/300',
              ),
              fit: BoxFit.cover)),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _index = 0;
  List QB = [
    questions.name(
        "India is a federal union comprising twenty-nine states and 7 union territories?",
        true),
    questions.name(" Itanagar is the capital of Arunachal Pradesh?", true),
    questions.name(
        "English and Urdu are the major languages spoken in Andhra Pradesh?",
        true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        // flexibleSpace: FlexibleSpaceBar(
        //   stretchModes: const <StretchMode>[
        //     StretchMode.zoomBackground,
        //     StretchMode.blurBackground,
        //     StretchMode.fadeTitle,
        //   ],
        ),
      // )
      // backgroundColor: Colors.cyan.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                "images/Indain Flag.png",
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  border: Border.all(color: Colors.grey, width: 2.0),
                ),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(QB[_index].text)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _prev(),
                  color: Colors.green.shade400,
                  child: Icon(Icons.navigate_before),
                ),
                RaisedButton(
                  onPressed: () => _check(true),
                  color: Colors.green.shade400,
                  child: Text(
                    "True",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _check(false),
                  color: Colors.green.shade400,
                  child: Text(
                    "False",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _next(),
                  color: Colors.green.shade400,
                  child: Icon(Icons.navigate_next),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _prev() {
    setState(() {
      _index = (_index - 1) % QB.length;
    });
  }

  void _check(bool choice) {
    if (choice == QB[_index].val) {
      final snackbar = SnackBar(
          content: Text(
            "Correct",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5));
      _scaffoldKey.currentState.showSnackBar(snackbar);
      _update();
    } else {
      final snackbar = SnackBar(
          content: Text(
            "Incorrect",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5));
      _scaffoldKey.currentState.showSnackBar(snackbar);
      _update();
    }
  }

  void _update() {
    setState(() {
      _index = (_index + 1) % QB.length;
    });
  }

  void _next() {
    _update();
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _tipCount = 0;
  int _personCount = 0;
  double _billAmount = 0.0;
  Color _purple = HexColor("#6908D6");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divider"),
        centerTitle: true,
      ),
      backgroundColor: Colors.yellow.shade50,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.pink),
                color: _purple.withOpacity(0.1),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Per person",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: _purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rs ${calculateTotalPerPerson(_billAmount, _personCount, _tipCount)}",
                      style: TextStyle(
                          fontSize: 34.9,
                          fontWeight: FontWeight.bold,
                          color: _purple),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount: ",
                      prefixIcon: Icon(Icons.money_off_csred_outlined),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  if (_personCount > 1) {
                                    _personCount--;
                                  } else {
                                    //do nothing
                                  }
                                },
                              );
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCount",
                            style: TextStyle(
                                color: _purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCount++;
                              });
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                          //Tip
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\Rs ${(calculateTotalTip(_billAmount, _personCount, _tipCount)).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipCount%",
                        style: TextStyle(
                            color: _purple,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipCount.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipCount = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}
