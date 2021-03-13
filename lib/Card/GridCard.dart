import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Dialog/SubCategoryFruitDialog.dart';
import '../Card/GridDataModel.dart';

class GridCard extends StatefulWidget {

  final GridCardModel gridCardModel;

  GridCard(this.gridCardModel);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<GridCard> {

  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(widget.gridCardModel.type!=""){
          if(isAdded){
            SubNameFruitDialog.selectedList.remove(widget.gridCardModel);
            setState(() {
              isAdded= false;
            });

          }else{
            SubNameFruitDialog.selectedList.add(widget.gridCardModel);
            setState(() {
              isAdded = true;
            });
          }
        }
        else{

          List<GridCard> list = [
            GridCard(new GridCardModel(widget.gridCardModel.name, "Black", "assets/testimage.jpeg")),
            GridCard(new GridCardModel(widget.gridCardModel.name, "Green", "assets/testimage.jpeg")),
            GridCard(new GridCardModel(widget.gridCardModel.name, "Blue", "assets/testimage.jpeg")),
            GridCard(new GridCardModel(widget.gridCardModel.name, "Red", "assets/testimage.jpeg")),
            GridCard(new GridCardModel(widget.gridCardModel.name, "Apricot", "assets/testimage.jpeg")),
          ];

          final result = await showDialog(
            context: context,
            builder: (_) => SubNameFruitDialog(list),
          );
        }
      },
      child: SizedBox(
        height: double.infinity,

        child: Card(
            shape:isAdded ? new RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(4.0))
            : new RoundedRectangleBorder(
                side: new BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(4.0)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(widget.gridCardModel.imageSource),
                    height: 130,
                    width: 100,
                    fit: BoxFit.fill
                ),
                Text(widget.gridCardModel.name,
                    style: TextStyle(
                        fontSize: 20,
                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.combine([]))
                ),
                Text(widget.gridCardModel.type),
              ],
            )
        ),
      ),
    );
  }
}