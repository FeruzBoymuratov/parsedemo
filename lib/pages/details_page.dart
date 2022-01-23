import 'package:flutter/material.dart';
import 'package:parsedemo/model/emp_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key, this.input}) : super(key: key);

  static final String id = "details_page";

  final Employee input;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page", style: TextStyle(color: Colors.white,),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
          child: Column(
            children: [
              Text(widget.input.employee_name + ' (' + widget.input.employee_age.toString() + ')', style: TextStyle(color: Colors.black, fontSize: 20),),

              SizedBox(height: 5,),

              Text(widget.input.employee_salary.toString() + '\$', style: TextStyle(color: Colors.black, fontSize: 18),),
            ],
          ),
        ),
        ],
      ),
    );
  }
  
}
