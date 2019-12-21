import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  Set<WordPair> _saved;
  SavedScreen(_saved) {
    this._saved = _saved;
  }

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = widget._saved.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
