import 'package:flutter/material.dart';

class Store {
  String itemName;
  String itemDescription;

  double itemPrice;
  String itemImage;
  double itemRating;

  Store.items({
    this.itemImage,
    this.itemName,
    this.itemPrice,
    this.itemRating,
    this.itemDescription,
  });
}

List<Store> storeItems = [
  Store.items(
    itemImage: 'https://bit.ly/2Fx45Yb',
    itemName: 'Karışık Pizza',
    itemDescription:'Domates, peynir, sucuk, sosis ve salam.',
    itemPrice: 20,
    itemRating: 5,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2IS9H12',
    itemDescription:'Peynir, domates ve sucuk',
    itemName: 'Sucuklu Pizza',
    itemPrice: 25,
    itemRating: 10,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2FDf9Tr',
    itemDescription:'Biber, domates, mantar ve peynir',
    itemName: 'Vejeteryan Pizza',
    itemPrice: 20,
    itemRating: 15,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2X9L9EZ',
    itemName: 'Ton Balıklı Pizza',
    itemDescription:'Ton balığı, peynir ve domates.',
    itemPrice: 20,
    itemRating: 12,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2JbBs3J',
    itemName: 'Sade Pizza',
    itemDescription:'Peynir çeşitleri.',
    itemPrice: 15,
    itemRating: 5,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2XB2CKp',
    itemName: 'Pastırmalı Pizza',
    itemDescription:'Pastırma, domates ve peynir',
    itemPrice: 25,
    itemRating: 18,
  ),
  Store.items(
    itemImage: 'https://bit.ly/327NlAu',
    itemName: 'İtalyan Pizza',
    itemDescription:'İtalyan peyniri, italyan sos ve domates',
    itemPrice: 20,
    itemRating: 20,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2xgnqIm',
    itemName: 'Kavurmalı Pizza',
    itemDescription:'Kavurma, domates ve peynir',
    itemPrice: 30,
    itemRating: 25,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2XwaLA0',
    itemName: 'Doyuran Pizza',
    itemDescription:'Sosis, salam, sucuk, kavurma,domates, mantar ve peynir.',
    itemPrice: 35,
    itemRating: 24,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2LoSYV2',
    itemName: 'Türk Usulü Pizza',
    itemDescription:'Zeytin, mısır, peynir, domates, sosis ve salam.',
    itemPrice: 20,
    itemRating: 25,
  ),
];