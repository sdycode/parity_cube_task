import 'package:flutter/material.dart';
import 'package:parity_cube_task/data_layer/models/data_model.dart';
import 'package:parity_cube_task/data_layer/apicalls/network_call.dart';
import 'package:parity_cube_task/presentation/widgets/card_item_widget.dart';

class CategoryPage extends StatefulWidget {
  final int i;
  CategoryPage(this.i, {Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child:
          // Center(
          //   child:IconButton(onPressed: (){}, icon: icon),
          // ),

          FutureBuilder<DataModel?>(
        future: Getdata.getData(widget.i),
        builder: (context, sn) {
          if (sn.hasData && sn.connectionState == ConnectionState.done) {     DataModel? model = sn.data;
            return ListView.builder(
              itemCount: model!.deals!.length,
              itemBuilder: (c, i) {
         
              if (model == null) {
                return Center(
                  child: Text("Null"),
                );
              }
              return Card(
                child:
                
                CardItemWidget(i: i,model: model)
                //  Image.network(model.deals![i].imageMedium!),
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
