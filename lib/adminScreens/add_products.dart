import 'dart:io';

import 'package:flutter/material.dart';
import 'package:orderapp/tools/app_data.dart';
import 'package:orderapp/tools/app_tools.dart';
import 'package:image_picker/image_picker.dart';

class addProducts extends StatefulWidget {
  @override
  _addProductsState createState() => _addProductsState();
}

class _addProductsState extends State<addProducts> {
  List<DropdownMenuItem<String>> _dropDownItemsOz1;
  List<DropdownMenuItem<String>> _dropDownItemsOz2;
  String selectedMalzeme = 'deneme';
  String selectedBoy = 'deneme';
  List<String> ListOz1 = List();
  List<String> ListOz2 = List();



  Map<int, File> imageMap = Map();

  TextEditingController prodcutTitle = new TextEditingController();
  TextEditingController prodcutPrice = new TextEditingController();
  TextEditingController prodcutDesc = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ListOz1 = List.from(malzemeCesidi);
    _dropDownItemsOz1 = buildAndGetDropDownOz1(ListOz1);
    selectedMalzeme = _dropDownItemsOz1[0].value;

    ListOz2 = List.from(urunBoyu);
    _dropDownItemsOz2 = buildAndGetDropDownOz2(ListOz2);
    selectedBoy = _dropDownItemsOz2[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Ürün Ekleme'),
          centerTitle: false,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton.icon(
                  color: Colors.white,
                  textColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  splashColor: Colors.deepOrange,
                  onPressed: () => pickImage(),
                  icon: Icon(Icons.add),
                  label: Text("Resim ekle"),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              MultiImagePickerList(
                  imageList: imageList,
                  removeNewImage: (index) {
                    removeImage(index);
                  }),
              productTextField(
                  productTitle: "Ürün Adı",
                  productHintText: "Ürün adını giriniz.",
                  productController: prodcutTitle,
                  productHeight: 40),
              SizedBox(
                height: 10.0,
              ),

              productTextField(
                  productTitle: "Ürün Fiyatı",
                  productHintText: "Ürün fiyatını giriniz",
                  textType: TextInputType.number,
                  productController: prodcutPrice),

              productTextField(
                  productTitle: "Ürün Detayı",
                  productHintText: "Ürün detayını giriniz.",
                  productController: prodcutDesc,
                  productHeight: 40),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Column(

                  children: <Widget>[

                    productDropDown(
                        dropDownTitle: 'Malzeme',
                        selectedItem: selectedMalzeme,
                        dropDownItems: _dropDownItemsOz1,
                        changedDropDownItems: myChangedDropDownItemsHamur),
                    productDropDown(
                      dropDownTitle: 'Ürün Boyu',
                      selectedItem: selectedBoy,
                      dropDownItems: _dropDownItemsOz2,
                      changedDropDownItems: myChangedDropDownItemsMiktar,
                    ),
                    appButton(
                      btnPadding: 90,
                      btnTxt: "Ürün Ekle",
                      btnColor: Theme
                          .of(context)
                          .primaryColor,
                      onBtnClicked: addNewProduct,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }


  void myChangedDropDownItemsHamur(String selectedItem) {
    setState(() {
      selectedMalzeme = selectedItem;
      print(selectedItem);
    });
  }

  void myChangedDropDownItemsMiktar(String selectedItem) {
    setState(() {
      selectedBoy = selectedItem;
      print(selectedItem);
    });
  }

  List<File> imageList = List();

  pickImage() async {
    List<File> imageFile = List();
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile.add(file);


      if (imageList == null) {
        imageList = List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {});
    }
  }


  removeImage(int index) async {
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState(() {});
  }


  addNewProduct() {
    if (imageList == null || imageList.isEmpty) {
      showSnackBar("Ürün fotoğrafı boş bırakılamaz.", scaffoldKey);
      return;
    }

    if (prodcutTitle.text == "") {
      showSnackBar("Ürün adı boş bırakılamaz.", scaffoldKey);
      return;
    }

    if (prodcutPrice.text == "") {
      showSnackBar("Ürün fiyatı boş bırakılamaz.", scaffoldKey);
      return;
    }

    if (prodcutDesc.text == "") {
      showSnackBar("Ürün detayı boş bırakılamaz.", scaffoldKey);
      return;
    }

    if (selectedMalzeme == "Malzeme seç") {
      showSnackBar("Malzeme seçimi yapınız.", scaffoldKey);
      return;
    }

    if (selectedBoy == "Ürün boyu seç") {
      showSnackBar("Boy seçimi yapınız.", scaffoldKey);
      return;
    }


    Map newProduct = {};
  }


}



