import 'package:flutter/material.dart';
import 'package:rd/db/database_provider.dart';
import 'package:rd/model/dog.dart';
import 'package:sqflite/sqflite.dart';

class InputDog extends StatefulWidget {
  const InputDog({super.key});

  @override
  State<InputDog> createState() => _InputDogState();
}

class _InputDogState extends State<InputDog> {
  String? _name;
  String? _motherName;
  String? _fatherName;
  bool _hasRD = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Name"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Name is required";
        }
        return null;
      },
      onSaved: (String? value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _buildMotherName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Mother Name"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Mother Name is required";
        }
        return null;
      },
      onSaved: (String? value) {
        setState(() {
          _motherName = value;
        });
      },
    );
  }

  Widget _buildFatherName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Father Name"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Father Name is required";
        }
        return null;
      },
      onSaved: (String? value) {
        setState(() {
          _fatherName = value;
        });
      },
    );
  }

  Widget _buildRD() {
    return CheckboxListTile(
      title: const Text("Has RD"),
      checkColor: Colors.white,
      value: _hasRD,
      onChanged: (bool? value) {
        setState(() {
          _hasRD = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Input dog")),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildMotherName(),
                _buildFatherName(),
                _buildRD(),
                const SizedBox(height: 100),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save(),
                        DatabaseProvider.instance.insert(
                          Dog(
                            name: _name!,
                            motherName: _motherName!,
                            fatherName: _fatherName!,
                            hasRD: _hasRD,
                          ),
                        ),
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        ),
                      },
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
