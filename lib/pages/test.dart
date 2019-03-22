import 'package:flutter/material.dart';
import 'package:smart_watch_app/common/widget/input_visible.dart';

class TestPage extends StatefulWidget {
    @override
    _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    FocusNode _focusNodeFirstName = new FocusNode();
    FocusNode _focusNodeLastName = new FocusNode();
    FocusNode _focusNodeDescription = new FocusNode();
    static final TextEditingController _firstNameController = new TextEditingController();
    static final TextEditingController _lastNameController = new TextEditingController();
    static final TextEditingController _descriptionController = new TextEditingController();

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('My Test Page'),
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              children: <Widget>[
                const Text('He\'d have you all unravel at the'),
                const Text('Heed not the rabble'),
                const Text('Sound of screams but the'),
                const Text('Who scream'),
                const Text('Revolution is coming...'),
                const Text('Revolution, they...'),
              ],
            )
        );
    }
}