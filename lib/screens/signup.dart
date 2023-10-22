import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors.dart';
import '../main.dart';
import '../model/donor.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickSignIn;

  const SignUpPage({
    Key? key,
    required this.onClickSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // donor detail controllers
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final weightController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final nicNumberController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final otherDetailsController = TextEditingController();

  // hospital details controllers
  //final hospitalNameController = TextEditingController();
  //final hospitalType = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    genderController.dispose();
    dobController.dispose();
    weightController.dispose();
    bloodGroupController.dispose();
    addressController.dispose();
    cityController.dispose();
    districtController.dispose();
    nicNumberController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    otherDetailsController.dispose();

    //hospitalNameController.dispose();
    //hospitalType.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      dobController.text = formatDate(picked);
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _selectGender(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(
            'Select Gender',
            style: TextStyle(
              color: darkRedColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Male');
              },
              child: Text('Male', style: TextStyle(color: Colors.black)),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Female');
              },
              child: Text('Female', style: TextStyle(color: Colors.black)),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Other');
              },
              child: Text('Other', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    ).then((selectedGender) {
      if (selectedGender != null) {
        // Handle the selected gender here
        genderController.text = selectedGender;
      }
    });
  }

  void _selectBlood(BuildContext context) {
    String? selectedBloodGroup;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select Blood Group',
            style: TextStyle(
              color: darkRedColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          content: DropdownButtonFormField<String>(
            value: selectedBloodGroup,
            items: [
              'O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'
            ].map((bloodGroup) {
              return DropdownMenuItem<String>(
                value: bloodGroup,
                child: Text(bloodGroup),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedBloodGroup = value;
                bloodGroupController.text = selectedBloodGroup ?? '';
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        );
      },
    );
  }

  void _selectDistrict(BuildContext context, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select District',
            style: TextStyle(
              color: darkRedColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildOption('Ampara', controller),
                _buildOption('Anuradhapura', controller),
                _buildOption('Badulla', controller),
                _buildOption('Batticaloa', controller),
                _buildOption('Colombo', controller),
                _buildOption('Galle', controller),
                _buildOption('Gampaha', controller),
                _buildOption('Hambantota', controller),
                _buildOption('Jaffna', controller),
                _buildOption('Kaluthara', controller),
                _buildOption('Kandy', controller),
                _buildOption('Kegalle', controller),
                _buildOption('Kilinochchi', controller),
                _buildOption('Kurunagala', controller),
                _buildOption('Mannar', controller),
                _buildOption('Mathale', controller),
                _buildOption('Matara', controller),
                _buildOption('Moneragala', controller),
                _buildOption('Mullaitivu', controller),
                _buildOption('Polonnaruwa', controller),
                _buildOption('Puttalam', controller),
                _buildOption('Rathnapura', controller),
                _buildOption('Trincomalee', controller),
                _buildOption('Vavuniya', controller),
              ],
            ),
          ),
        );
      },
    );
  }
  // void _selectHospital(BuildContext context, TextEditingController controller) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text(
  //           'Select Your Hospital',
  //           style: TextStyle(
  //             color: darkRedColor,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //             letterSpacing: 2,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               _buildOptionH('District General Hospital Gampaha', controller),
  //               _buildOptionH('LRH', controller),
  //               _buildOptionH('Nawaloka Hospital, Colombo', controller),
  //               _buildOptionH('District General Hospital Matara', controller),
  //               _buildOptionH('Lanka Hospitals Colombo', controller),
  //               _buildOptionH('Hemas Hospitals  Wattala', controller),
  //               _buildOptionH('Apeksha Hospital Maharagama', controller),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget _buildOptionH(String option, TextEditingController controller) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         controller.text = option;
  //         Navigator.pop(context); // Close the dialog after selecting an option.
  //       });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(vertical: 16),
  //       child: Text(
  //         option,
  //         style: const TextStyle(
  //           fontSize: 18,
  //           color: mainRedColor,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  List<String> sriLankanCities = [
    'Colombo',
    'Kandy',
    'Galle',
    'Jaffna',
    'Negombo',
    'Trincomalee',
    'Anuradhapura',
    'Matara',
    'Ratnapura',
    'Badulla',
    'Hambantota',
    'Kurunegala',
    'Ampara',
    'Polonnaruwa',
    'Batticaloa',
    'Kalutara',
    'Nuwara Eliya',
    'Kegalle',
    'Chilaw',
    'Gampaha',
    'Maharagama',
    'Panadura',
    'Moratuwa',
    'Balangoda',
    'Wennappuwa',
    'Dehiwala-Mount Lavinia',
    'Ambalangoda',
    'Homagama',
    'Horana',
    'Bandarawela',
    'Gampola',
    'Monaragala',
    'Tissamaharama',
    'Hikkaduwa',
    'Beruwala',
    'Horawala',
    'Sooriyawewa',
    'Mannar',
    'Kataragama',
    'Dickwella',
    'Puttalam',
    'Ambalantota',
    'Beragala',
    'Chawakachcheri',
    'Galkiriyagama',
    'Weligama',
    'Point Pedro',
    'Tangalle',
    'Elpitiya',
  ];
  void _selectCity(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a City'),
          content: Container(
            width: double.minPositive,
            child: SingleChildScrollView( // Wrap with a SingleChildScrollView
              child: Column(
                children: sriLankanCities.map((city) => _buildOptions(city)).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildOptions(String city) {
    return ListTile(
      title: Text(city),
      onTap: () {
        setState(() {
          cityController.text = city;
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildOption(String option, TextEditingController controller) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.text = option;
          Navigator.pop(context); // Close the dialog after selecting an option.
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          option,
          style: const TextStyle(
            fontSize: 18,
            color: mainRedColor,
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    if (nameController.text.isEmpty ||
        genderController.text.isEmpty ||
        dobController.text.isEmpty ||
        bloodGroupController.text.isEmpty ||
        weightController.text.isEmpty ||
        addressController.text.isEmpty ||
        cityController.text.isEmpty ||
        districtController.text.isEmpty ||
        nicNumberController.text.isEmpty ||
        mobileNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Some values are empty ! Check your details...',
          ),
          backgroundColor: lightRedColor,
          padding: EdgeInsets.all(12),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      if (passwordController.text.trim() == rePasswordController.text.trim()) {
        try {
          final donor = Donor(
              name: nameController.text.trim(),
              gender: genderController.text.trim(),
              dob: DateTime.parse(dobController.text.trim()),
              bloodGroup: bloodGroupController.text.trim(),
              weight: double.parse(weightController.text.trim()),
              address: addressController.text.trim(),
              city: cityController.text.trim(),
              district: districtController.text.trim(),
              nicNumber: nicNumberController.text.trim(),
              mobileNumber: int.parse(mobileNumberController.text.trim()),
              eMail: emailController.text.trim(),
              passWord: passwordController.text.trim(),
              otherDetails: otherDetailsController.text.trim());
          try {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            final donorToSave = FirebaseFirestore.instance
                .collection('donors')
                .doc(donor.eMail);
            final json = donor.toJson();
            await donorToSave.set(json);
          } on FirebaseAuthException catch (e) {
            String? errorMessage;
            setState(() {
              errorMessage = e.message;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorMessage!,
                ),
                backgroundColor: lightRedColor,
                padding: const EdgeInsets.all(12),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        } on Exception catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Some values are incorrect! Check your details...',
              ),
              backgroundColor: lightRedColor,
              padding: EdgeInsets.all(12),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Mismatched password....',
            ),
            backgroundColor: lightRedColor,
            padding: EdgeInsets.all(12),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 24,
              ),
            ),
          ),
          backgroundColor: mainRedColor,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.person_2_outlined),
                text: "DONOR",
              ),
              Tab(
                icon: Icon(Icons.home_work_outlined),
                text: "Hospital",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.005,
                    ),
                    TextFormField(
                      controller: nameController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Enter Your Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor, // underline color
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: genderController,
                      decoration: const InputDecoration(
                        labelText: 'Select Your Gender',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      readOnly: true, // To prevent manual input
                      onTap: () {
                        _selectGender(context);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: dobController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Date of Birth (yyyy-mm-dd)',
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            color: darkRedColor,
                            size: 25,
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                    )
                    ,
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: bloodGroupController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Select Your Blood Group',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor, // underline color
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      readOnly: true, // To prevent manual input
                      onTap: () {
                        _selectBlood(context);
                      },
                    ),

                    TextFormField(
                      controller: weightController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Enter Your Last Weight',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor, // underline color
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: addressController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Enter Your Current Address',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor, // underline color
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        hintText: 'Select a city',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkRedColor,
                              width: 2.0,
                            )
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      readOnly: true, // To prevent manual input
                      onTap: () {
                        _selectCity(context);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: districtController,
                      decoration: const InputDecoration(
                        labelText: 'District',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkRedColor,
                              width: 2.0,
                            )
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      readOnly: true, // To prevent manual input
                      onTap: () {
                        _selectDistrict(context, districtController);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                    TextFormField(
                      controller: nicNumberController,
                      style: const TextStyle(
                        fontSize: 18,
                        // color: darkRedColor,
                        // fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Enter Your NIC Number',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: mobileNumberController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Enter Your Mobile Number',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,//  when it's not currently selected by the user
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,//when it's currently selected by the user or ready for input
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText:'Enter Your E-mail Address' ,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Password (Atleast 6 characters)',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: rePasswordController,
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Re - Type Password",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    TextFormField(
                      controller: otherDetailsController,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Other Details - (Diseases, Allergies)",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mainRedColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkRedColor,
                            width: 2.0,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signUp();
                        // Navigator.of(context).pushReplacementNamed('/home');
                        // SigninPage(onClickRegister: () {
                        //    Navigator.of(context).pushReplacementNamed('/SigninPage');
                        //   },
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: buttonBorderColor,
                          width: 2,
                        ),
                        backgroundColor: mainRedColor,
                        foregroundColor: Colors.white,
                        minimumSize: Size(
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.14),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: buttonBorderColor,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Already have an account? ',
                          ),
                          TextSpan(
                            text: 'SIGN IN',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: mainRedColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickSignIn,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : [
                  SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.005,
                ),
                TextFormField(
                  controller: nameController,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Enter Your Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: mainRedColor, // underline color
                        width: 2.0,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: mainRedColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: darkRedColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.01,
                ),

               ]
              ),
             ),
            )
          ],
        ),
      ),
    );
  }
}
