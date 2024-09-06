import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(BloodDonationAndHIVRiskFormApp());
}

class BloodDonationAndHIVRiskFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation & HIV Risk Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CombinedFormScreen(),
    );
  }
}

class CombinedFormScreen extends StatefulWidget {
  @override
  _CombinedFormScreenState createState() => _CombinedFormScreenState();
}

class _CombinedFormScreenState extends State<CombinedFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Define form fields controllers
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _donorCardNumberController = TextEditingController();
  final TextEditingController _placeOfCollectionController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String? _gender;
  String? _maritalStatus;
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _ethnicityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _educationLevelController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _workplaceController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emergencyContactNameController = TextEditingController();
  final TextEditingController _emergencyContactPhoneController = TextEditingController();
  final TextEditingController _signatureController = TextEditingController();
  TextEditingController vaccineController = TextEditingController();
TextEditingController medicationController = TextEditingController();
TextEditingController returnDateController = TextEditingController();

  DateTime? _selectedDate;

  String _receivedTransfusion = 'No';
  final TextEditingController _transfusionDateController = TextEditingController();
  String _donatedBlood = 'No';
  bool? _lastDonationWentWell;
  Map<String, bool> healthIssues = {
    'Epilepsy': false,
    'Sexually Transmitted Infection': false,
    'Skin rashes': false,
    'Chest pain': false,
    'Mouth sores': false,
    'Asthma': false,
    'Jaundice': false,
    'Joint pain': false,
    'Fainting': false,
    'Diabetes': false,
    'Blood disease': false,
    'Anemia': false,
    'Bloody urine': false,
    'Hypertension': false,
    'Limb tremors': false,
    'Heart disease': false,
    'Diarrhea': false,
    'Hemorrhoids': false,
    'Excessive fatigue': false,
    'Swollen glands': false,
    'Fever': false,
    'Cancer': false,
    'Ulcer': false,
    'Dizziness': false,
    'Sickle cell disease': false,
    'Cough for more than 1 month': false,
  };

  // Additional fields for medical questionnaire
  bool hadSurgery = false;
  bool beenVaccinated = false;
  bool takingMedication = false;
  bool hadDentalCare = false;
  bool changedPartners = false;

  String? vaccine;
  String? medication;

  // HIV Risk Assessment fields
  int? numberOfPartners;
  bool hasHIVPositivePartner = false;
  bool hadUnprotectedSex = false;
  bool sharedNeedles = false;

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _dateController.dispose();
    _donorCardNumberController.dispose();
    _placeOfCollectionController.dispose();
    _bloodGroupController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _dobController.dispose();
    _ethnicityController.dispose();
    _addressController.dispose();
    _professionController.dispose();
    _educationLevelController.dispose();
    _neighborhoodController.dispose();
    _workplaceController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _emergencyContactNameController.dispose();
    _emergencyContactPhoneController.dispose();
    _transfusionDateController.dispose();
    _signatureController.dispose();
    super.dispose();
  }

void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation & HIV Risk Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Basic Information
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date';
                    }
                    return null;
                  },
                ),
     
                TextFormField(
                  controller: _donorCardNumberController,
                  decoration: InputDecoration(labelText: 'Donor Card Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the donor card number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _placeOfCollectionController,
                  decoration: InputDecoration(labelText: 'Place of Collection'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the place of collection';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _bloodGroupController,
                  decoration: InputDecoration(labelText: 'Blood Group'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the blood group';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name(s)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the last name';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: InputDecoration(labelText: 'Gender'),
                  items: ['M', 'F'].map((label) => DropdownMenuItem(
                    child: Text(label),
                    value: label,
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _maritalStatus,
                  decoration: InputDecoration(labelText: 'Marital Status'),
                  items: ['Married', 'Single', 'Widowed'].map((label) => DropdownMenuItem(
                    child: Text(label),
                    value: label,
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _maritalStatus = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a marital status';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(labelText: 'Born on'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of birth';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ethnicityController,
                  decoration: InputDecoration(labelText: 'Ethnicity'),
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _professionController,
                  decoration: InputDecoration(labelText: 'Profession'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the profession';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _educationLevelController,
                  decoration: InputDecoration(labelText: 'Education Level'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the education level';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _neighborhoodController,
                  decoration: InputDecoration(labelText: 'Neighborhood'),
                ),
                TextFormField(
                  controller: _workplaceController,
                  decoration: InputDecoration(labelText: 'Workplace'),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emergencyContactNameController,
                  decoration: InputDecoration(labelText: 'Name of Emergency Contact'),
                ),
                TextFormField(
                  controller: _emergencyContactPhoneController,
                  decoration: InputDecoration(labelText: 'Phone of Emergency Contact'),
                ),
                // Medical Questionnaire
                RadioListTile(
                  title: Text('Have you received a blood transfusion in the last 4 months?'),
                  value: 'Yes',
                  groupValue: _receivedTransfusion,
                  onChanged: (value) {
                    setState(() {
                      _receivedTransfusion = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: 'No',
                  groupValue: _receivedTransfusion,
                  onChanged: (value) {
                    setState(() {
                      _receivedTransfusion = value.toString();
                    });
                  },
                ),
                if (_receivedTransfusion == 'Yes')
                  TextFormField(
                    controller: _transfusionDateController,
                    decoration: InputDecoration(labelText: 'When did you receive the blood transfusion?'),
                  ),
                RadioListTile(
                  title: Text('Have you ever donated blood?'),
                  value: 'Yes',
                  groupValue: _donatedBlood,
                  onChanged: (value) {
                    setState(() {
                      _donatedBlood = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: 'No',
                  groupValue: _donatedBlood,
                  onChanged: (value) {
                    setState(() {
                      _donatedBlood = value.toString();
                    });
                  },
                ),
                if (_donatedBlood == 'Yes')
                  RadioListTile(
                    title: Text('Did your last donation go well? Yes'),
                    value: true,
                    groupValue: _lastDonationWentWell,
                    onChanged: (value) {
                      setState(() {
                        _lastDonationWentWell = value;
                      });
                    },
                  ),
                if (_donatedBlood == 'Yes')
                  RadioListTile(
                    title: Text('No'),
                    value: false,
                    groupValue: _lastDonationWentWell,
                    onChanged: (value) {
                      setState(() {
                        _lastDonationWentWell = value;
                      });
                    },
                  ),
                // Health issues
                ...healthIssues.keys.map((issue) {
                  return CheckboxListTile(
                    title: Text(issue),
                    value: healthIssues[issue],
                    onChanged: (value) {
                      setState(() {
                        healthIssues[issue] = value ?? false;
                      });
                    },
                  );
                }).toList(),
                // Additional Medical Questions
                RadioListTile(
                  title: Text('Have you had surgery in the last 4 months? Yes'),
                  value: true,
                  groupValue: hadSurgery,
                  onChanged: (value) {
                    setState(() {
                      hadSurgery = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: hadSurgery,
                  onChanged: (value) {
                    setState(() {
                      hadSurgery = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Have you been vaccinated in the last 4 months? Yes'),
                  value: true,
                  groupValue: beenVaccinated,
                  onChanged: (value) {
                    setState(() {
                      beenVaccinated = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: beenVaccinated,
                  onChanged: (value) {
                    setState(() {
                      beenVaccinated = value!;
                    });
                  },
                ),
                if (beenVaccinated)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Which vaccine?'),
                    onChanged: (value) {
                      vaccine = value;
                    },
                  ),
                RadioListTile(
                  title: Text('Are you currently taking any medication? Yes'),
                  value: true,
                  groupValue: takingMedication,
                  onChanged: (value) {
                    setState(() {
                      takingMedication = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: takingMedication,
                  onChanged: (value) {
                    setState(() {
                      takingMedication = value!;
                    });
                  },
                ),
                if (takingMedication)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Which medication?'),
                    onChanged: (value) {
                      medication = value;
                    },
                  ),
                RadioListTile(
                  title: Text('Have you had dental care in the last 4 months? Yes'),
                  value: true,
                  groupValue: hadDentalCare,
                  onChanged: (value) {
                    setState(() {
                      hadDentalCare = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: hadDentalCare,
                  onChanged: (value) {
                    setState(() {
                      hadDentalCare = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Have you changed partners in the last 4 months? Yes'),
                  value: true,
                  groupValue: changedPartners,
                  onChanged: (value) {
                    setState(() {
                      changedPartners = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: changedPartners,
                  onChanged: (value) {
                    setState(() {
                      changedPartners = value!;
                    });
                  },
                ),
                // HIV Risk Assessment
                TextFormField(
                  decoration: InputDecoration(labelText: 'How many sexual partners have you had in the past 6 months?'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    numberOfPartners = int.tryParse(value);
                  },
                ),
                RadioListTile(
                  title: Text('Do you have a sexual partner who is HIV positive? Yes'),
                  value: true,
                  groupValue: hasHIVPositivePartner,
                  onChanged: (value) {
                    setState(() {
                      hasHIVPositivePartner = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: hasHIVPositivePartner,
                  onChanged: (value) {
                    setState(() {
                      hasHIVPositivePartner = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Have you had unprotected sex in the past 6 months? Yes'),
                  value: true,
                  groupValue: hadUnprotectedSex,
                  onChanged: (value) {
                    setState(() {
                      hadUnprotectedSex = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: hadUnprotectedSex,
                  onChanged: (value) {
                    setState(() {
                      hadUnprotectedSex = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Have you shared needles in the past 6 months? Yes'),
                  value: true,
                  groupValue: sharedNeedles,
                  onChanged: (value) {
                    setState(() {
                      sharedNeedles = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: false,
                  groupValue: sharedNeedles,
                  onChanged: (value) {
                    setState(() {
                      sharedNeedles = value!;
                    });
                  },
                ),
                // PLEASE READ THE FOLLOWING CAREFULLY
              Text(
              'Please Read Carefully Before Donating Blood',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 8),
               Text(
              'You cannot donate blood if you:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
              Text(
              '• Are under 18 or over 65 years old',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '• Have donated blood in the last three (03) months',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '• Have had a recent surgery or transfusion',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '• Have viral hepatitis',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
             Text(
              '• Have had sexual contact with individuals from high-risk groups (casual partners, individuals with AIDS or HIV positive, homosexuals, drug users)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'If you meet any of the above criteria, you are not eligible to donate blood at this time.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for your understanding and cooperation.',
              style: TextStyle(fontSize: 16),
            ),
            
            Text(
                'INFORMED CONSENT\n'
                'I declare on my honor that I have not hidden any illnesses or behaviors. '
                'I authorize the Blood Transfusion Center to collect my blood. I know that syphilis, HIV, '
                'and hepatitis B and C viruses can be transmitted through blood transfusion. I also know that my blood '
                'will be tested for these diseases, and I do not consider myself to be at risk of transmitting them. If I have '
                'doubts, I will not donate my blood. In case of doubt, my blood donation will be excluded as a precaution.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text('Date: ', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        ),
                        child: Text(
                          _selectedDate != null
                              ? DateFormat.yMMMd().format(_selectedDate!)
                              : 'Select Date',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              TextFormField(
                controller: _signatureController,
                decoration: InputDecoration(
                  labelText: "Donor's Signature",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your signature';
                  }
                  return null;
                },
              ),



                // ELEVATEDBUTTON
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted successfully')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';

// void main() {
//   runApp(MedicalQuestionnaireApp());
// }

class MedicalQuestionnaireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Questionnaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicalQuestionnaireScreen(),
    );
  }
}

class MedicalQuestionnaireScreen extends StatefulWidget {
  @override
  _MedicalQuestionnaireScreenState createState() => _MedicalQuestionnaireScreenState();
}

class _MedicalQuestionnaireScreenState extends State<MedicalQuestionnaireScreen> {
  // Controllers for text fields
  final TextEditingController transfusionDateController = TextEditingController();
  final TextEditingController vaccineController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController abroadCountryController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();

  // Checkboxes
  bool receivedTransfusion = false;
  bool donatedBlood = false;
  bool lastDonationWentWell = false;
  bool hadSurgery = false;
  bool beenVaccinated = false;
  bool takingMedication = false;
  bool hadDentalCare = false;
  bool changedPartners = false;
  bool drugUser = false;
  bool partnerDrugUser = false;
  bool homosexual = false;
  bool bittenBySomeone = false;
  bool injuryWithUsedObject = false;
  bool scarificationsTattoosPiercings = false;
  bool stayedAbroad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Questionnaire'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Have you ever received a blood transfusion?'),
            Checkbox(
              value: receivedTransfusion,
              onChanged: (value) {
                setState(() {
                  receivedTransfusion = value!;
                });
              },
            ),
            if (receivedTransfusion)
              TextFormField(
                controller: transfusionDateController,
                decoration: InputDecoration(
                  labelText: 'When?',
                  border: OutlineInputBorder(),
                ),
              ),
            SizedBox(height: 16.0),
            Text('Have you ever donated blood before?'),
            Checkbox(
              value: donatedBlood,
              onChanged: (value) {
                setState(() {
                  donatedBlood = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Did your last donation go well?'),
            Checkbox(
              value: lastDonationWentWell,
              onChanged: (value) {
                setState(() {
                  lastDonationWentWell = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            // Add more questions and text fields here...
          ],
        ),
      ),
    );
  }
}
