import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title, {Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rating = 5.0;
  int selectedPos = 0;

  final _formKey = GlobalKey<FormState>();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      _viewMain(),
      _viewRate(),
      _viewNear(),
      _viewAbout(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[200],
      body: _widgetOptions.elementAt(selectedPos),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.userCircle,
            color: Colors.purple,
          ),
          title: Text(
            "Meu Perfil",
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.star,
            color: Colors.purple,
          ),
          title: Text(
            "Avalie",
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.streetView,
            color: Colors.purple,
          ),
          title: Text(
            "Próximos",
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.infoCircle,
            color: Colors.purple,
          ),
          title: Text(
            "Sobre",
          ),
        ),
      ],
      currentIndex: selectedPos,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber[800],
      onTap: navigateToPage,
    );
  }

  void navigateToPage(int page) {
    setState(() {
      selectedPos = page;
    });
  }

  Widget _viewMain() {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text("Sua Avaliação",
                style: Theme.of(context)
                    .textTheme
                    .display4
                    .copyWith(fontSize: 32.0)),
            Text("4.59", style: Theme.of(context).textTheme.display4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.users,
                  size: 32,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 16.00,
                ),
                Text("698",
                    style: Theme.of(context)
                        .textTheme
                        .display4
                        .copyWith(fontSize: 32)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Text("@SeuNome",
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .copyWith(fontSize: 24.0)),
            ),
            SmoothStarRating(
                allowHalfRating: true,
                starCount: 5,
                rating: rating,
                size: 48.0,
                color: Colors.deepPurple,
                borderColor: Colors.purple,
                spacing: 0.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.facebook,
                        color: Color.fromARGB(255, 59, 89, 152),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "Facebook",
                        style: TextStyle(
                          color: Color.fromARGB(255, 59, 89, 152),
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.twitter,
                        color: Color.fromARGB(255, 0, 132, 180),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "Twitter",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 132, 180),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Share.share("Vejam meu perfil no Stellae");
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.shareAlt,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Compartilhar",
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _viewRate() {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: '@NomeDaPessoa',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(
              height: 72.00,
            ),
            SmoothStarRating(
                allowHalfRating: true,
                starCount: 5,
                rating: rating,
                size: 48.0,
                color: Colors.deepPurple,
                borderColor: Colors.purple,
                spacing: 0.0),
            SizedBox(
              height: 52.00,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Mensagem(Opcional)',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // Process data.
                  }
                },
                child: Text('Avaliar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewNear() {
    return Center(
      child: Text("Proximos",
          style: Theme
              .of(context)
              .textTheme
              .display4
              .copyWith(fontSize: 32.0)),
    );
  }

  Widget _viewAbout() {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text("Sobre",
                style: Theme
                    .of(context)
                    .textTheme
                    .display1
                    .copyWith(fontSize: 32.0)),
            Text(
                "Stellae é um aplicativo com o intuito de avalição entre usuários, cada usuario pode dar de 0 até 5 estrelas para o outro.",
                style: Theme
                    .of(context)
                    .textTheme
                    .display4
                    .copyWith(fontSize: 32.0)),
          ],
        ),
      ),
    );
  }
}
