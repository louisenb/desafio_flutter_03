import 'package:desafio03/modules/tripdestiny/blocs/tripdestiny_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripDestinyCategoryDetails extends StatelessWidget {
  final String category;

  TripDestinyCategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TripDestinyBloc>(context);
    final filteredItems = bloc.tripDestinies.where((element) => element.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      child: Card(
                        // shadowColor: Colors.red,
                        child: ListTile(
                          title: Text(filteredItems[index].name!),
                          subtitle: Text(filteredItems[index].city!),
                          trailing: Text(filteredItems[index].state!),
                          leading: Icon(Icons.airplanemode_active),
                        ),
                      ),
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            blurRadius: 10, // soften the shadow
                            spreadRadius: 0.7, //extend the shadow
                            offset: Offset(
                              0.70, // Move to right 10  horizontally
                              0.70, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            )
        ),
      ]),
    );
  }
}