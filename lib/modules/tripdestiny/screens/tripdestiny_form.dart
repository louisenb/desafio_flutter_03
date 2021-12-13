import 'package:desafio03/modules/tripdestiny/blocs/tripdestiny_bloc.dart';
import 'package:desafio03/modules/tripdestiny/models/tripdestiny_category.dart';
import 'package:desafio03/modules/tripdestiny/models/tripdestiny_destiny.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripDestinyForm extends StatefulWidget {
  const TripDestinyForm({Key? key}) : super(key: key);

  @override
  _TripDestinyFormState createState() {
    return _TripDestinyFormState();
  }
}

class _TripDestinyFormState extends State<TripDestinyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TripDestinyBloc>(context);
    final model = new TripDestinyDestiny.empty();
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar destino',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nome do destino'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite aqui o destino';
                      }
                      return null;
                    },
                    onSaved: (newValue) => model.name = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'País'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite aqui o País';
                      }
                      return null;
                    },
                    onSaved: (newValue) => model.country = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Estado'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite aqui o Estado';
                      }
                      return null;
                    },
                    onSaved: (newValue) => model.state = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Cidade'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite aqui a Cidade';
                      }
                      return null;
                    },
                    onSaved: (newValue) => model.city = newValue,
                  ),
                  DropdownButtonFormField(
                      items: bloc.tripDestinyCategories
                          .map((TripDestinyCategory category) {
                        return DropdownMenuItem<String>(
                          value: category.name,
                          child: Text(category.name),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        model.category = newValue as String;
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          fillColor: Colors.transparent,
                          filled: false,
                          border: UnderlineInputBorder(),
                          labelText: 'Categoria')),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        padding: const EdgeInsets.all(20.0),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // you'd often call a server or save the information in a database.
                          _formKey.currentState!.save();
                          bloc.addDestiny(model);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Dados armazenados com sucesso!')),
                          );

                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Salvar destino',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            )));
  }
}
