import 'package:flutter/material.dart';

class PageOnBoard {
  final String title, content, image;
  final int id;

  PageOnBoard({
    required this.title,
    required this.content,
    required this.image,
    required this.id,
  });
}

List<PageOnBoard> pageOnboard = [
  PageOnBoard(
    id: 1,
    title: 'Chào mừng đến với Medikan',
    content: 'Ứng dụng cung cấp những phương pháp sơ cấp cứu cần thiết trong nhiều trường hợp và nhiều dịch vụ tiện ích khác cho người dùng',
    image: 'assets/images/onBoard_img/onboard1.svg'
  ),
  PageOnBoard(
    id: 2,
    title: 'Cuộc gọi khẩn cấp SOS',
    content: 'Tự động phát vị trí hiện tại của người dùng và nhắn tin cho bác sĩ và người thân trong các tình huống khẩn cấp',
    image: 'assets/images/onBoard_img/onboard2.svg'
  ),
  PageOnBoard(
    id: 3,
    title: 'Theo dõi sức khỏe',
    content: 'Lưu trữ hồ sơ y tế cá nhân giúp bạn tự theo dõi sức khỏe của mình hằng ngày',
    image: 'assets/images/onBoard_img/onboard3.svg'
  ),
  PageOnBoard(
    id: 4,
    title: 'Tin nóng mỗi ngày',
    content: 'Các tin tức về dịch bệnh COVID-19 và các mẹo hay về y học được cập nhật hằng ngày',
    image: 'assets/images/onBoard_img/onboard4.svg'
  ),
];