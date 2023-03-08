import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:seta/intro.dart';

import 'colors.dart';
import 'login.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String _selectedCountry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const SizedBox(),
                            Text(
                              'Glad , Register !',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.bold,
                                color: Ascolors,
                                fontSize: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            const SizedBox(),
                            Text(
                              'And Manage your music with beavert ',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: Ascolors,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w100,
                              color: Ascolors,
                              fontSize: 20,
                            ),
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              focusColor: Ascolors,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Full name is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w100,
                              color: Ascolors,
                              fontSize: 20,
                            ),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              focusColor: Ascolors,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              }
                              if (!value!.contains('@')) {
                                return 'Invalid email format';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w100,
                              color: Ascolors,
                              fontSize: 20,
                            ),
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              focusColor: Ascolors,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                              if (value!.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w100,
                              color: Ascolors,
                              fontSize: 20,
                            ),
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              focusColor: Ascolors,
                              border: InputBorder.none,
                              labelText: 'Confirm Password',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Confirm Password is required';
                              }
                              if (value != _passwordController.text) {
                                return 'Password and Confirm Password do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w100,
                              color: Ascolors,
                              fontSize: 20,
                            ),
                            controller: _addressController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusColor: Ascolors,
                              border: InputBorder.none,
                              labelText: 'Address',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Address is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: boxcolor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextFormField(
                                  style: GoogleFonts.alata(
                                    fontWeight: FontWeight.w100,
                                    color: Ascolors,
                                    fontSize: 20,
                                  ),
                                  controller: _countryController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    focusColor: Ascolors,
                                    border: InputBorder.none,
                                    labelText: 'Country',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Country is required';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                    var result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CountryList(),
                                      ),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        _countryController.text = result.name;
                                        _selectedCountry = result.code;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: boxcolor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextFormField(
                                    style: GoogleFonts.alata(
                                      fontWeight: FontWeight.w100,
                                      color: Ascolors,
                                      fontSize: 20,
                                    ),
                                    controller: _pincodeController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      focusColor: Ascolors,
                                      border: InputBorder.none,
                                      labelText: 'Pin Code',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Pin code is required';
                                      }
                                      if (value.length != 6) {
                                        return 'Invalid pin code';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: _submitForm,
                        child: Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Ascolors,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Register',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: bgcolors,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const SizedBox(),
                            Text(
                              'Already member ?',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: Ascolors,
                                fontSize: 20,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: LoginForm(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.alata(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.blue,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      var url =
          'https://api.postalpincode.in/pincode/${_pincodeController.text}';
      var response = await http.get(Uri.parse(
          'https://api.postalpincode.in/pincode/${_pincodeController.text}'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var postOffice = data[0]['PostOffice'][0];
        var district = postOffice['District'];
        var state = postOffice['State'];

        var registrationData = {
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'address': _addressController.text,
          'country': _selectedCountry,
          'pincode': _pincodeController.text,
          'district': district,
          'state': state,
        };

        // TODO: Send registration data to server
        print(registrationData);

        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch details for the provided pin code'),
            actions: [],
          ),
        );
      }
    }
  }
}

class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});
}

class CountryList extends StatelessWidget {
  final List<Country> _countries = [
    Country(name: 'India', code: 'IN'),
    Country(name: 'United States', code: 'US'),
    Country(name: 'United Kingdom', code: 'GB'),
    Country(name: 'Australia', code: 'AU'),
    Country(name: 'Canada', code: 'CA'),
    Country(name: 'France', code: 'FR'),
    Country(name: 'Germany', code: 'DE'),
    Country(name: 'Italy', code: 'IT'),
    Country(name: 'Japan', code: 'JP'),
    Country(name: 'Russia', code: 'RU'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _countries[index].name,
              textAlign: TextAlign.start,
              style: GoogleFonts.alata(
                fontWeight: FontWeight.w100,
                color: Ascolors,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context, _countries[index]);
            },
          );
        },
      ),
    );
  }
}
