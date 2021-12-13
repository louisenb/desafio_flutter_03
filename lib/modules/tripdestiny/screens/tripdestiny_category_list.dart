import 'package:desafio03/modules/tripdestiny/blocs/tripdestiny_bloc.dart';
import 'package:desafio03/modules/tripdestiny/components/thumbnail/tripdestiny_thumbnail.dart';
import 'package:desafio03/modules/tripdestiny/screens/tripdestiny_category_details.dart';
import 'package:desafio03/modules/tripdestiny/screens/tripdestiny_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripDestinyCategoryList extends StatelessWidget {
  TripDestinyCategoryList({Key? key, assetImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TripDestinyBloc>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              Text('Destinos', style: TextStyle(fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemCount: bloc.tripDestinyCategories.length,
              itemBuilder: (context, index) {
                return new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDestinyCategoryDetails(category: bloc.tripDestinyCategories[index].name),
                        )
                      );
                    },
                    child: TripDestinyThumbnail(assetImage: bloc.tripDestinyCategories[index].image, title: bloc.tripDestinyCategories[index].name)
                );
              },
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TripDestinyForm())
          )
        },
        tooltip: 'Create Form',
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
