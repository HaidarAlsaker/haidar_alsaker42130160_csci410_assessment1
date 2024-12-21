import 'package:flutter/material.dart';
List<String> methods=['Email','Phone','SMS'];
class Pagee extends StatefulWidget {
  const Pagee({super.key});

  @override
  State<Pagee> createState() => _PageState();
}

class _PageState extends State<Pagee> {
  final TextEditingController _name=new TextEditingController();
  final TextEditingController _email=new TextEditingController();
  String? gender='';
  String Prefer=methods.first;
  bool sub=false;
  String text='';
  bool allTrue=false;
  String? subscrib='No';
  bool CheckEmail(String s){
    bool dot=false;
    bool at=false;
    for(int i=0;i<s.length;i++){
      if(s[i]=='.'){
        dot=true;
      }else if(s[i]=='@'){
        at=true;
      }else{
        continue;
      }
    }
    return dot && at;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('A Small Contant Form'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(height:20),
              Text(
                'Name',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your email',
                ),
                controller: _name,
              ),
              SizedBox(height:20),
              Text(
                'Email',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your email',
                ),
                controller: _email,
              ),
              SizedBox(height:20),
              Text(
                'Gender',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Radio(value: 'Male', groupValue: gender, onChanged: (val){
                    setState(() {
                      gender=val as String;
                    });
                  }),
                  const Text('Male'),
                  Radio(value: 'Female', groupValue: gender, onChanged: (val){
                    setState(() {
                      gender=val as String;
                    });
                  }),
                  const Text('Female'),
                  Radio(value: 'Other', groupValue: gender, onChanged: (val){
                    setState(() {
                      gender=val as String;
                    });
                  }),
                  const Text('Other'),
                ],
              ),
              DropdownMenu(
                  dropdownMenuEntries: methods.map<DropdownMenuEntry<String>>((String val) {
                    return DropdownMenuEntry(value: val, label:val.toString());
                  }).toList(),
                  width: 380,
                  initialSelection: Prefer,
                  onSelected: (String? s) {
                    setState(() {
                      Prefer=s as String;
                    });
                  }
              ),
              SizedBox(height:20),
              Row(
                children: [
                  Checkbox(value: sub, onChanged: (bool? val){
                    setState(() {
                      sub=val as bool;
                      if (val){
                        subscrib='Yes';
                      }else{
                        subscrib='No';
                      }
                    });
                  }),
                  Text('Subscribe to newslatter')
                ],
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: (){
                        if(_name.text==''|| _email.text=='' || gender=='' || Prefer==''){
                          setState(() {
                            text='Please fill out all fields';
                          });
                        }else if(!CheckEmail(_email.text)){
                          setState(() {
                            text='Please enter a valid email address';
                          });
                        }else{

                          setState(() {
                            allTrue=true;
                          });

                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Submit')
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton.icon(
                      onPressed: (){
                        _name.clear();
                        _email.clear();
                        setState(() {
                          gender='';
                          Prefer=methods.first;
                          sub=false;
                          subscrib='No';
                          text='';
                          allTrue=false;
                        });

                      },
                      icon: Icon(Icons.clear),
                      label: Text('Clear')
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Visibility(
                  visible: allTrue,
                  child:Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Text('Submitted Information:',style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 8,),
                            Text('Name: '+_name.text),
                            Text('Email: '+_email.text),
                            Text('Gender: '+gender!),
                            Text('Preferred Contact Method: '+Prefer),
                            Text('Subscribed to Newsletter: '+subscrib!)
                          ],
                        ),
                      )
                  )
              ),
              Visibility(
                  visible: !allTrue,
                  child:Center(
                      child:  Column(
                        children: [
                          Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red))
                        ],
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}