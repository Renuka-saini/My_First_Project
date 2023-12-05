import 'package:flutter/material.dart';
import 'package:my_first_project/controller/fatchMeme.dart';
import 'package:my_first_project/controller/saveMyData.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}):super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;


  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    GetInitMemeNo();

    UpdateImg();
  }

   GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo!>100){
      targetMeme = 500;
    }else if (memeNo!>500){
      targetMeme = 1000;
    }
    setState(() {

    });
  }
  void UpdateImg() async {

    String getImgUrl = await FatchMeme().fatchNewMeme();
    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Meme #${memeNo.toString()}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Target ${targetMeme}Memes",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              isLoading ? 
              Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator()),
                      ),
                    )
                  : Image.network(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitHeight,
                      imgUrl,
                    ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await SaveMyData.saveData(memeNo!+1);
                  GetInitMemeNo();

                  UpdateImg();
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                      child: Text(
                    "More Fun!!",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              ),
              Spacer(),
              Text(
                'App Created By',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Renu Saini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
