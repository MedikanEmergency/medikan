import 'package:flutter/material.dart';


class DescriptFirstAid {
  final String image, descript, step;

  DescriptFirstAid({
    required this.image,
    required this.descript,
    required this.step,
  });
}

class FirstAid {
  final String image, title;
  final int id;
  final List<DescriptFirstAid> descript;

  FirstAid({
    required this.image,
    required this.title,
    required this.id,
    required this.descript,
  });
}

List<FirstAid> firstaid = [
  FirstAid(
      id: 1,
      title: 'Gãy xương',
      image: 'assets/images/first_aid_img/duck.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'abc ssa dgrre gndf asvbr', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'cde', step: 'Bước 2'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'efh', step: 'Bước 3'),
      ]),
  FirstAid(
      id: 2,
      title: 'Chảy máu',
      image: 'assets/images/first_aid_img/duck.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'abc', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'cde', step: 'Bước 2'),
      ]),
  FirstAid(
      id: 3,
      title: 'Bong gân',
      image: 'assets/images/first_aid_img/duck.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'abc', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'cde', step: 'Bước 2'),
      ]),
  FirstAid(
      id: 4,
      title: 'Chó táp',
      image: 'assets/images/first_aid_img/duck.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'abc', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'cde', step: 'Bước 2'),
      ]),
  FirstAid(
      id: 5,
      title: 'Điện giật',
      image: 'assets/images/first_aid_img/duck.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'abc', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'cde', step: 'Bước 2'),
      ]),
  FirstAid(
      id: 6,
      title: 'Bóng',
      image: 'assets/images/first_aid_img/duck.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'abc', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/duck.jpg', descript: 'cde', step: 'Bước 2'),
      ]),
];
