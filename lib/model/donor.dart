class Donor {
  String name;
  String gender;
  DateTime dob;
  String bloodGroup;
  double weight;
  String address;
  String city;
  String district;
  String nicNumber;
  int mobileNumber;
  String eMail;
  String passWord;
  String otherDetails;

  Donor({
    required this.name,
    required this.gender,
    required this.dob,
    required this.bloodGroup,
    required this.weight,
    required this.address,
    required this.city,
    required this.district,
    required this.nicNumber,
    required this.mobileNumber,
    required this.eMail,
    required this.passWord,
    required this.otherDetails,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'dob': dob,
        'bloodGroup': bloodGroup,
        'weight': weight,
        'address': address,
        'city': city,
        'district': district,
        'nicNumber': nicNumber,
        'mobileNumber': mobileNumber,
        'eMail': eMail,
        'passWord': passWord,
        'otherDetails': otherDetails,
      };

  static Donor fromJson(Map<String, dynamic> json) => Donor(
        name: json['name'],
        gender: json['gender'],
        dob: json['dob'],
        bloodGroup: json['bloodGroup'],
        weight: json['weight'],
        address: json['address'],
        city: json['city'],
        district: json['district'],
        nicNumber: json['nicNumber'],
        mobileNumber: json['mobileNumber'],
        eMail: json['eMail'],
        passWord: json['passWord'],
        otherDetails: json['otherDetails'],
      );
}
