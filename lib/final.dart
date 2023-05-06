import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koka2/cdfd.dart';

class Final extends StatefulWidget {
  const Final({Key? key}) : super(key: key);

  @override
  State<Final> createState() => _FinalState();
}

class _FinalState extends State<Final> {
  List<Map<String , dynamic>> Choose= [
    {"id": 1, "icon":'assets/baby-boy.png',"name" :
    "جراحة الطفل","fun": (){} },
    {"id": 2, "icon":'assets/brain.png',"name" : " جراحه المخ والأعصاب" ,"fun": (){}},
    {"id": 3, "icon":'assets/backbone.png',"name" : "جراحه العمود الفقرى" ,"fun": (){}},
    {"id": 4, "icon":'assets/blood.png',"name" : "أمراض الدم"  ,"fun": (){}},
    {"id": 5, "icon":'assets/heart.png',"name" : "جراحه القلب والصدر"  ,"fun": (){}},
    {"id": 6, "icon":'assets/ivf.png',"name" : "اطفال انابيب"  ,"fun": (){}},
    {"id": 7, "icon":'assets/joint.png',"name" : "الروماتيزم"  ,"fun": (){}},
    {"id": 8, "icon":'assets/skin.png',"name" : "جلدىة"  ,"fun": (){}},
    {"id": 9, "icon":'assets/skull.png',"name" : "جراحه الوجه والفكين" ,"fun": (){}},
    {"id": 10, "icon":'assets/tooth.png',"name" : "أسنان"  ,"fun": (){}},
    {"id": 11, "icon":'assets/veins.png',"name" : "جراحه اوعية دموية"  ,"fun": (){}},
    {"id": 12, "icon":'assets/immunology.png',"name" : "الحساسية والمناعة"  ,"fun": (){}},
    {"id": 13, "icon":'assets/intestine.png',"name" : "جراحه الأمعاء"  ,"fun": (){}},
    {"id": 14, "icon":'assets/kidney.png',"name" : "جراحه كليه"  ,"fun": (){}},
    {"id": 15, "icon":'assets/masculine.png',"name" : "ذكور"  ,"fun": (){}},
    {"id": 16, "icon":'assets/neoplasm.png',"name" : "جراحه ورم"  ,"fun": (){}},
    {"id": 17, "icon":'assets/runny-nose.png',"name" : "الأنف والأذن و حنحره"  ,"fun": (){}},
    {"id": 18, "icon":'assets/sugar-blood-level.png',"name" : "السكر و غدد صماء"  ,"fun": (){}},
    {"id": 19, "icon":'assets/surgical-instrument.png',"name" : "الجراحه العامة"  ,"fun": (){}},
    {"id": 20, "icon":'assets/liver.png',"name" : "الجراحه الكبد"  ,"fun": (){}},
  ];

  List<Map<String , dynamic>> found= [];
  @override
  void initState() {
    found = Choose;
    super.initState();
  }
  void runFilter(String key){
    List<Map<String , dynamic>> results= [];
    if(key.isEmpty){
      results = Choose;
    }else{
      results = Choose.where((element) =>
          element["name"].toLowerCase().contains(key.toLowerCase())).toList();
    }
    setState(() {
      found=results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text("جميع التخصصات"),
        ),
        body: Column(
          children: [
            TextFormField(
              onChanged: (value) => runFilter(value),
              decoration: const InputDecoration(
                labelText: 'البحث',
                hintText: 'البحث',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: found.length,
                itemBuilder: (context , index)=>
                    InkWell(
                    child:InkWell(
                      onDoubleTap:found[index]["fun"]  ,
                      onTap:found[index]["fun"] ,
                      child:  Card(
                        key: ValueKey(found[index]["id"]),
                        child: Row(
                          children: [
                            Expanded(flex: 1,
                                child: Image.asset(found[index]["icon"].toString(),
                                    height: 40)
                            ),
                            Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: Text(found[index]["name"].toString(),),
                                ))
                          ],
                        ),
                      ),
                    )
                )
            ),)
          ],
        )
    );
  }
}
