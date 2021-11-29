import 'package:flutter/material.dart';
import 'package:white_wizard/pages/ask_page.dart';
import 'package:white_wizard/const.dart';
import 'borgs_dropmenue.dart';
import 'package:sweetsheet/sweetsheet.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SelectBorg(),
  ));
}

String? selectedBorg = "الأسد " ;


class SelectBorg extends StatefulWidget {
  @override
  _SelectBorgState createState() => _SelectBorgState();
}

class _SelectBorgState extends State<SelectBorg> {
  final SweetSheet _sweetSheet = SweetSheet();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('إذا رحلت الأن ستحزن مدي حياتك'),
              actions: <Widget>[
                FlatButton(
                  child: Text('لن أرحل'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('لا أخاف منك'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          }
      );

      return value == true;
    },
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg0.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 260,),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                child: Text('أختر البرج الخاص بك',
                style: kTextStyle2,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                height: 75,
                padding:  EdgeInsets.only(left: 25.0, right: 25.0,bottom: 5.0,top: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xffc76724),
                    border: Border.all(width: 0,color: Colors.white70),
                boxShadow:[ BoxShadow(color: Colors.white70, blurRadius: 20.0, offset:  Offset(0,3))] ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.whatshot,
                      color: Colors.white,
                    ),
                    value: selectedBorg,
                    items: getDropdownItems2(),
                    iconSize: 40,
                    elevation: 20,
                    onChanged: (userSelection) {
                      setState(() {
                        selectedBorg = userSelection;
                        _sweetSheet.show(
                          context: context,
                          description: Text(
                            'لإجابة دقيقة ضع إصبعك علي الفلاش وانت تسأل سيدي',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xfff1f1f1)),
                          ),
                          color: CustomSheetColor(
                            main: Color(0xffc76724),
                            accent: Color(0xFF8B3700),
                            icon: Color(0xFFF8F8F8),
                          ),

                          positive: SweetSheetAction(
                            onPressed: () {
                              Navigator.push(context, CustomPageRoute(builder: (context){
                                return AskPage(userBorg: selectedBorg,);
                              },),);

                            },
                            title: 'حسناً',
                          ),
                          negative: SweetSheetAction(
                            onPressed: () {
                              Navigator.of(context).pop();

                            },
                            title: 'اختيار برجي مره اخري',
                          ),
                        );

                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}



