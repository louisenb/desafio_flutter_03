import 'dart:collection';
import 'package:desafio03/modules/tripdestiny/models/tripdestiny_category.dart';
import 'package:desafio03/modules/tripdestiny/models/tripdestiny_destiny.dart';
import 'package:flutter/material.dart';

class TripDestinyBloc extends ChangeNotifier {

  /// Internal, private state of the TripDestiny.
  final List<TripDestinyCategory> _tripDestinyCategories = [
    TripDestinyCategory("./assets/images/beaches.jpg", "Praia"),
    TripDestinyCategory("./assets/images/fields.jpg", "Campos"),
    TripDestinyCategory("./assets/images/historical.jpg", "Históricos"),
    TripDestinyCategory("./assets/images/mountains.jpg", "Montanhas"),
    TripDestinyCategory("./assets/images/eastern.jpg", "Orientais"),
    TripDestinyCategory("./assets/images/western.jpg", "Ocidentais"),
  ];

  final List<TripDestinyDestiny> _tripDestinies = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<TripDestinyCategory> get tripDestinyCategories => UnmodifiableListView(_tripDestinyCategories);
  UnmodifiableListView<TripDestinyDestiny> get tripDestinies => UnmodifiableListView(_tripDestinies);

  /// Adds [item] to tripDestinies.
  void addDestiny(TripDestinyDestiny item) {
    _tripDestinies.add(item);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}