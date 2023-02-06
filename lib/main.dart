import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: demo(),
    debugShowCheckedModeBanner: false,
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
String str="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Convert Currency",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          Text("${str}",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          Container( margin: EdgeInsets.all(30),
            child: TextField(cursorColor: Colors.white,style: TextStyle(color: Colors.white),onTap: () {
              showCurrencyPicker(
                context: context,
                showFlag: true,
                showCurrencyName: true,
                showCurrencyCode: true,
                onSelect: (Currency currency) {
                  print('Select currency: ${currency.code}');
                  t1.text=currency.code;
                  setState(() {

                  });
                },
              );
            },controller: t1,decoration: InputDecoration( focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: "FORM",
                labelStyle: TextStyle(color: Colors.white))),
          ),
          Container( margin: EdgeInsets.all(30),
            child: TextField(cursorColor: Colors.white,style: TextStyle(color: Colors.white),onTap: () {
              showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  onSelect: (Currency currency) {
                    print('Select currency: ${currency.code}');
                    t2.text = currency.code;
                    setState(() {});
                  }
              );
            },controller: t2,decoration: InputDecoration( focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: "TO",
                labelStyle: TextStyle(color: Colors.white))),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(controller: t3,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: "AMOUNT",
                  labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.all(30),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color(0xFF2980B9),
                  Color(0xFF6DD5FA),
                  Color(0xFFFFFFFF),
                ])),
            child: TextButton(
                onPressed: () async {
                  String to,form,amount;
                  form=t1.text;
                  to=t2.text;
                  amount=t3.text;
                    var url=Uri.parse("https://dhruv120.000webhostapp.com/currency.php");
                  var response = await http.post(url, body: {'form': '$form', 'to': '$to', 'amount': '$amount'});
                    Map m=jsonDecode(response.body);
                    str=m['result'].toString();
                    setState(() {

                    });
                  print("${response.body}");
                },
                child: Text(
                  "PURCHASE CURRENCY",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ]),
      ),
    );
  }
}
