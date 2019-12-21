import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codelab/SavedScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        body: Center(
          // child: const Text('Hello World'),
          //child: Text(wordPair.asPascalCase),
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();

    // return Text(wordPair.asPascalCase);

//    return Scaffold (
//      body: _buildSuggestions(),
//    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          // Add 3 lines from here...
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ], // ... to here.
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SavedScreen(_saved)),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          if (i >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[i]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }, // ... to here.
    );
  }
}

class StatelessEg extends StatelessWidget {
  var text = "Shashank jj";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "text is :$text",
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        RaisedButton(
          child: Text("Click me"),
          onPressed: () {
            text = "Shashank has clicked";
          },
        )
      ],
    );
  }
}

class StatefullEg extends StatefulWidget {
  @override
  _StatefullEgState createState() => _StatefullEgState();
}

class _StatefullEgState extends State<StatefullEg> {
  var text;

  @override
  void initState() {
    text = "Shashank ";
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "text is :$text",
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        RaisedButton(
          child: Text("Click me"),
          onPressed: () {
            setState(() {
              text = text + "has clicked";
            });
          },
        )
      ],
    );
  }
}
