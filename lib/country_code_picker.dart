import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryCodePicker extends StatefulWidget{
  const CountryCodePicker({super.key});

  @override
  State<CountryCodePicker> createState() => _CountryCodePicker();

}

class _CountryCodePicker extends State<CountryCodePicker>{

  String? countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(countryCode.toString()),
          Center(
            child: MaterialButton(
              color: Colors.blueGrey,
                splashColor: Colors.greenAccent,
                onPressed: () {
                  showCountryPicker(
                      context: context,
                      countryListTheme: const CountryListThemeData(
                        flagSize: 30,
                      ),

                      onSelect: (Country value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${value.countryCode} = ${value.phoneCode}"),),);
                        countryCode = value.phoneCode.toString();
                        setState(() {

                        });
                      },
                  );
                },
              child: const Text("Select Country code", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

}