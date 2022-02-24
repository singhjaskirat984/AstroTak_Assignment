import 'package:astrotak_assignment/providers/all_relative_provider.dart';
import 'package:astrotak_assignment/utilities/loading_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';
import '../utilities/size_config.dart';

class FriendsAndFamilyProfileScreen extends StatefulWidget {
  static const String id = 'friends_and_family_profile_screen';

  const FriendsAndFamilyProfileScreen({Key? key}) : super(key: key);

  @override
  _FriendsAndFamilyProfileScreenState createState() =>
      _FriendsAndFamilyProfileScreenState();
}

class _FriendsAndFamilyProfileScreenState extends State<FriendsAndFamilyProfileScreen> {
  late bool _addNewProfile = false;
  final List<String> amPmList = ['AM', 'PM'];
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController yearController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  String genderDropDown = 'MALE';
  String relationDropDown = 'Father';

  @override
  void initState() {
    context.read<AllRelativeProvider>().getAllRelativesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allRelativeProvider = Provider.of<AllRelativeProvider>(context);
    final allRelativesModel = Provider.of<AllRelativeProvider>(context, listen: true).allRelativesModel;
    return Stack(
      children: [
        (_addNewProfile)
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 70.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _addNewProfile = false;
                                  });
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 22.0,
                            ),
                            const Text(
                              "Add New Profile",
                              style: TextStyle(fontSize: 22),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      _buildNameInput(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Date Of Birth",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      _buildDOBInput(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Time of Birth",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      _buildTOBInput(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Place of Birth",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      _buildPOBInput(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(child: _buildGenderInput()),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: _buildRelationInput(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // _submit();
                            }
                          },
                          child: const Text(
                            "Save Changes",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(
                                        color: Colors.orange))),
                            // maximumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
                            // minimumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
                            // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: walletBanner(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: SizeConfig.screenWidth * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.indigo.withOpacity(0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            )),
                            Expanded(
                                child: Text(
                              "DOB",
                              style: TextStyle(
                                  color: Colors.indigo.withOpacity(0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            )),
                            Expanded(
                                child: Text(
                              "TOB",
                              style: TextStyle(
                                  color: Colors.indigo.withOpacity(0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            )),
                            Expanded(
                                child: Text(
                              "Relation",
                              style: TextStyle(
                                  color: Colors.indigo.withOpacity(0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    (allRelativeProvider.loadingStatus == LoadingStatus.completed) ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: allRelativesModel?.data.allRelatives.length,
                        itemBuilder: (context, index){
                        String? name = allRelativesModel?.data.allRelatives[index].fullName;
                        String? dob = allRelativesModel?.data.allRelatives[index].birthDetails.dobDay.toString()??"null" "-" "${allRelativesModel?.data.allRelatives[index].birthDetails.dobMonth}" "-" "${allRelativesModel?.data.allRelatives[index].birthDetails.dobYear}";
                        String? tob = allRelativesModel?.data.allRelatives[index].birthDetails.tobHour.toString()??"null" ":" "${allRelativesModel?.data.allRelatives[index].birthDetails.tobMin}";
                        String? relation = allRelativesModel?.data.allRelatives[index].relation;
                        print("$name $dob $tob $relation");
                        return _relativeCard(name!,dob,tob,relation!);
                        }
                    ) : const Center(child: CircularProgressIndicator(),),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _addNewProfile = true;
                          });
                        },
                        child: const Text(
                          "+ Add New Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal),
                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: const BorderSide(
                                          color: Colors.orange))),
                          // maximumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
                          // minimumSize: MaterialStateProperty.all<Size>(const Size(170, 40)),
                          // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: const [
                  Button(
                    txt: 'My Profile',
                    txtColor: Colors.black,
                    btnColor: Colors.white,
                    borderColor: Colors.white,
                  ),
                  Button(
                    txt: 'Friends and Family Profile',
                    txtColor: Colors.white,
                    btnColor: Colors.orange,
                    borderColor: Colors.orange,
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _relativeCard(String name, String dob, String tob, String relation){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: SizeConfig.screenWidth,
            child: Card(
              elevation: 2.0,
              color: Colors.grey,
              child: Row(
                children: [
                  Expanded(child: Text(name)),
                  Expanded(child: Text(dob)),
                  Expanded(child: Text(tob)),
                  Expanded(child: Text(relation)),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }

  Widget _buildRelationInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Relation",
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 13,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 7.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            items: [
              'Father',
              'Mother',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  relationDropDown = value;
                }
              });
            },
            value: relationDropDown,
            hint: const Text(
              "Gender: ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            iconDisabledColor: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget _buildGenderInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 13,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 7.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black.withOpacity(0.5))),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            items: ['MALE', 'FEMALE'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  genderDropDown = value;
                }
              });
            },
            value: genderDropDown,
            hint: const Text(
              "Gender: ",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            iconDisabledColor: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget _buildPOBInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        cursorColor: Colors.black,
        textAlign: TextAlign.start,
        controller: placeController,
        autofocus: true,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter valid Place of Birth.';
          }
          return null;
        },
        style: const TextStyle(color: Colors.black, fontSize: 12),
        decoration: InputDecoration(
          hintText: 'Enter your Place of Birth',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        onSaved: (value) {
          // print('Password ${value}');
        },
      ),
    );
  }

  Widget _buildTOBInput() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                controller: hourController,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 2,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'invalid';
                  }else if(int.parse(value)<=0 || int.parse(value)>12){
                    return "invalid hrs";
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'HH',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  // print('Password ${value}');
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                controller: minutesController,
                autofocus: true,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 2,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'invalid';
                  }else if(int.parse(value)<0 || int.parse(value)>60){
                    return "invalid mins";
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'MM',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  // print('Password ${value}');
                },
              ),
            ),
            // const SizedBox(width: 10.0,),
            const SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                children: [
                  for (int i = 0; i < amPmList.length; i++)
                    SizedBox(
                      height: 52,
                      width: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Text(
                          amPmList[i],
                          style: TextStyle(
                              color: (_selectedIndex == i)
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.5),
                              fontSize: 14),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              (_selectedIndex == i)
                                  ? Colors.indigo
                                  : Colors.white),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildDOBInput() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                controller: dayController,
                autofocus: true,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 2,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'invalid';
                  }else if(int.parse(value)<1 || int.parse(value)>31){
                    return "invalid day";
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'DD',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  // print('Password ${value}');
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                controller: monthController,
                autofocus: true,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 2,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'invalid';
                  }else if(int.parse(value)<1 || int.parse(value)>12){
                    return "invalid hrs";
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'MM',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  // print('Password ${value}');
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                controller: yearController,
                autofocus: true,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 4,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'invalid';
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.black, fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'YYYY',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) {
                  // print('Password ${value}');
                },
              ),
            )
          ],
        ));
  }

  Widget _buildNameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        cursorColor: Colors.black,
        textAlign: TextAlign.start,
        controller: nameController,
        autofocus: true,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter valid Name.';
          }
          return null;
        },
        style: const TextStyle(color: Colors.black, fontSize: 12),
        decoration: InputDecoration(
          hintText: 'Enter your Full Name',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        onSaved: (value) {
          // print('Password ${value}');
        },
      ),
    );
  }

  Widget walletBanner() {
    return Container(
      width: SizeConfig.screenWidth,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.indigo.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
                height: 25,
                width: 0,
                child: Icon(
                  Icons.account_balance_wallet_rounded,
                  size: 25.0,
                  color: Colors.indigo,
                )),
            const Text("Wallet Balance: ₹0",
                style: TextStyle(color: Colors.indigo, fontSize: 15.0)),
            SizedBox(
              height: 30,
              width: 100,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Add Money",
                  style: TextStyle(color: Colors.indigo, fontSize: 12.0),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.indigo))),
                  // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
