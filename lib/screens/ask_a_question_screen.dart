import 'dart:ui';

import 'package:astrotak_assignment/components/descriptions.dart';
import 'package:astrotak_assignment/models/ask_question_model.dart';
import 'package:astrotak_assignment/providers/ask_question_provider.dart';
import 'package:astrotak_assignment/screens/account_screen.dart';
import 'package:astrotak_assignment/utilities/colored_safe_area.dart';
import 'package:astrotak_assignment/utilities/loading_enum.dart';
import 'package:astrotak_assignment/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';

class AskQuestionScreen extends StatefulWidget {
  static const String id = 'ask_question_screen';

  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  final TextEditingController _titleController = TextEditingController();
  final maxLines = 5;
  List<String> questionsList = [
    "When is the right time for me to introduce my boyfriend / girlfriend?",
    "When is the right time for me to introduce my boyfriend / girlfriend?",
    "When is the right time for me to introduce my boyfriend / girlfriend?",
    "When is the right time for me to introduce my boyfriend / girlfriend?",
    "Doubtful about taking my relationship to next level?",
    "When I am going to get married?",
    "How will I meet my potential life partner?"
  ];
  String dropDownValue = "Love";

  @override
  void initState() {
    context.read<AskQuestionProvider>().getQuestionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ColoredSafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Tab(icon: Image.asset("assets/icons/icon.png"), height: 60.0),
          leading: const Tab(
            icon: SizedBox(
              child: Image(
                image: AssetImage(
                  'assets/icons/hamburger.png',
                ),
                fit: BoxFit.cover,
              ),
              height: 18,
              width: 18,
            ),
          ),
          actions:[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AccountScreen.id);
                },
                child: const Tab(
                  icon: SizedBox(
                    child: Image(
                      image: AssetImage(
                        'assets/icons/profile.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            )
          ],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // walletBanner(),
                  const SizedBox(
                    height: 60.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Ask a Question",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Descriptions(
                        text:
                            "Seek accurate answers to your life problems and guide you towards the right path whether the problems is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart provide personalized responses along with remedies",
                        size: 15.0,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Choose a Category",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.black),
                    ),
                  ),
                  // const SizedBox(height: 7.0,),
                  Consumer<AskQuestionProvider>(
                      builder: (context, askQuestionProvider, child){
                        List<QuestionCategory>? data;
                        List<String> dropDownList = [];
                        if(askQuestionProvider.loadingStatus == LoadingStatus.completed || askQuestionProvider.loadingStatus == LoadingStatus.empty){
                          data = askQuestionProvider.askQuestionModel?.data;
                          for(QuestionCategory i in data!){
                            dropDownList.add(i.name);
                          }
                        }
                        return (askQuestionProvider.loadingStatus == LoadingStatus.completed || askQuestionProvider.loadingStatus == LoadingStatus.empty) ?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: SizedBox(
                            width: SizeConfig.screenWidth,
                            child: Card(
                              elevation: 2.0,
                              borderOnForeground: true,
                              child: DropdownButton<String>(
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: dropDownList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text(value, style: const TextStyle(fontSize: 15),),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    if(value != null) {
                                      dropDownValue = value;
                                      context.read<AskQuestionProvider>().getSuggestions(value);
                                    }
                                  });
                                },
                                value: dropDownValue,
                                hint: const Text(
                                  "Select a Category: ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                iconDisabledColor: Colors.grey,
                              ),
                            ),
                          ),
                        ) : const Center(child: CircularProgressIndicator(),);
                      }
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildQuestionInputField(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Text(
                      "Ideas what to Ask (Select Any)",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Consumer<AskQuestionProvider>(
                    builder: (context, askQuestionProvider, child){
                      return (askQuestionProvider.loadingStatus == LoadingStatus.completed) ?
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                            itemCount: askQuestionProvider.suggestionsList.length,
                            itemBuilder: (context, index) {
                              return questionTile(askQuestionProvider.suggestionsList[index], index, askQuestionProvider.suggestionsList.length);
                            }),
                      ) : (askQuestionProvider.loadingStatus == LoadingStatus.empty) ?
                          const Center(child: Text("No Suggestions Available in this Category")) :
                          const Center(child: CircularProgressIndicator(),);
                    }
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: walletBanner(),
            ),
          ],
        ),
        bottomSheet: askNowBanner(),
      ),
    );
  }

  Widget questionTile(String text, int index, int listLength) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.ac_unit,
                color: Colors.orange,
                size: 20,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                  child: Text(
                text,
                style: const TextStyle(fontSize: 15.0),
              ))
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10.0,
          ),
          (index == listLength-1) ? const Descriptions(
              text:
              "Seek accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.",
              size: 15.0,
              color: Colors.black87):Container(),
          const SizedBox(
            height: 10.0,
          ),
          (index == listLength-1) ? Container(
            color: const Color.fromRGBO(250, 194, 160, 0.3),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [
                  Text("• Personalised responses provided by our team of vedic astrologers within 24 hours.", style: TextStyle(color: Colors.orangeAccent, fontSize: 15.0),),
                  Text("• Qualified and experienced astrologers will look into your birth chart and provide the right guidance.", style: TextStyle(color: Colors.orangeAccent, fontSize: 15.0),),
                  Text("You can seek answers to any part of your life and for most pressing issues.", style: TextStyle(color: Colors.orangeAccent, fontSize: 15.0),),
                  Text("• Our team of vedic astrologers will not just provide answers but also suggest a remedial solution.", style: TextStyle(color: Colors.orangeAccent, fontSize: 15.0),),
                ],
              ),
            ),
          ):Container(),
        ],
      ),
    );
  }

  Widget buildQuestionInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        keyboardType: TextInputType.multiline,
        controller: _titleController,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Type your question here.',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        maxLines: 10,
        minLines: 4,
        maxLength: 150,
      ),
    );
  }

  Widget askNowBanner() {
    return Container(
      color: Colors.indigo,
      width: SizeConfig.screenWidth,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("₹150(1 Question on $dropDownValue)",
                style: const TextStyle(color: Colors.white, fontSize: 15.0)),
            SizedBox(
              height: 30,
              width: 100,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Ask Now",
                  style: TextStyle(color: Colors.indigo, fontSize: 12.0),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.white))),
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

  Widget walletBanner() {
    return Container(
      color: Colors.indigo,
      width: SizeConfig.screenWidth,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Wallet Balance: ₹0",
                style: TextStyle(color: Colors.white, fontSize: 15.0)),
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
                          side: const BorderSide(color: Colors.white))),
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
