import 'package:flutter/material.dart';

class Store {
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  Store.items({
    this.itemImage,
    this.itemName,
    this.itemPrice,
    this.itemRating,
  });
}

List<Store> storeItems =[
  Store.items(
    itemImage: 'https://bit.ly/2Fx45Yb',
    itemName: 'Karışık Pizza',
    itemPrice: 20,
    itemRating: 5 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2IS9H12',
    itemName: 'Sucuklu Pizza',
    itemPrice: 25,
    itemRating: 10 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2FDf9Tr',
    itemName: 'Vejeteryan Pizza',
    itemPrice: 20,
    itemRating: 15 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2X9L9EZ',
    itemName: 'Ton Balıklı Pizza',
    itemPrice: 20,
    itemRating: 12 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2JbBs3J',
    itemName: 'Sade Pizza',
    itemPrice: 15,
    itemRating: 5 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2XB2CKp',
    itemName: 'Pastırmalı Pizza',
    itemPrice: 25,
    itemRating: 18 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/327NlAu',
    itemName: 'İtalyan Pizza',
    itemPrice: 20,
    itemRating: 20 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2xgnqIm',
    itemName: 'Kavurmalı Pizza',
    itemPrice: 30,
    itemRating: 25 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2XwaLA0',
    itemName: 'İtalyan Pizza',
    itemPrice: 20,
    itemRating: 20 ,
  ),
  Store.items(
    itemImage: 'https://bit.ly/2LoSYV2',
    itemName: 'Kavurmalı Pizza',
    itemPrice: 30,
    itemRating: 25 ,
  ),
];