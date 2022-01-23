import 'package:flutter/material.dart';
import 'package:parsedemo/model/emp_model.dart';
import 'package:parsedemo/model/emplist_model.dart';
import 'package:parsedemo/model/post_model.dart';
import 'package:parsedemo/pages/details_page.dart';
import 'package:parsedemo/service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employee> items = [];

  void _apiIdPost(Post post) {
    Network.GET(
        Network.API_employee + post.id.toString(), Network.paramsCreate(post))
        .then((response) =>
    {

      _showResponse(response),
    });
  }

  void _apiCreatePost(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((
        response) =>
    {

      _showResponse(response),
    });
  }

  void _apiUpdatePost(Post post) {
    Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsCreate(post))
        .then((response) =>
    {

      _showResponse(response),
    });
  }

  void _apiDeletePost(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) =>
    {

      _showResponse(response),
    });
  }

  void _showResponse(String response) {
    EmpList empList = Network.parseEmpList(response);

    setState(() {
      items = empList.data;
    });
  }

  void _apiEmpList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty())
        .then((response) =>
    {
      _showResponse(response),
    });
  }

  @override
  void initState() {
    super.initState();
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page", style: TextStyle(color: Colors.white),),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return itemOfList(items[i]);
          },
        ));
  }

  Widget itemOfList(Employee emp) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name + "(" + emp.employee_age.toString() + ")",
              style: TextStyle(color: Colors.black, fontSize: 20),),
            SizedBox(height: 10,),
            Text(emp.employee_salary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 18),),
          ],
        ),
      ),
      onTap: () {
        _openDetails(emp);
      },
    );
  }

  Future _openDetails(Employee emp) async {
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (BuildContext context) {
          return new DetailsPage(input: emp,);
        }));
  }
}