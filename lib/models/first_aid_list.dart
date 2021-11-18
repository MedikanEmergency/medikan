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
      title: 'Bỏng',
      image: 'assets/images/first_aid_img/Bong/main1.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Bong/1.jpg', descript: 'Xả nước mát váo vùng bị bỏng trong vài phút (KHÔNG sử dụng nước đá)', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Bong/2.jpg', descript: 'Đắp vết bỏng bằng một băng gạc mỏng', step: 'Bước 2'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Bong/3.jpg', descript: 'Không bôi thuốc mỡ, bơ, hoặc các chất bôi trơn lên vết bỏng', step: 'Bước 3'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Bong/4.jpg', descript: 'Không làm vỡ bất kỳ mụn nước nào hình thành do vết bỏng', step: 'Bước 4'),
      ]),
  FirstAid(
      id: 2,
      title: 'Chảy máu',
      image: 'assets/images/first_aid_img/Chaymau/main1.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Chaymau/1.jpg', descript: 'Xác định vị trí vết cắt và độ sâu', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Chaymau/2.jpg', descript: 'Nếu nặng thì cần bóp chặt vết thương để tạo áp lực trực tiếp ngăn máu chảy, nếu nhẹ thì cần sát khuẩn', step: 'Bước 2'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Chaymau/3.jpg', descript: 'Dùng gạc thấm nước,gạc không dính hoặc vải sạch để che vết thương', step: 'Bước 3'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Chaymau/4.jpg', descript: 'Gọi cấp cứu nếu có các dấu hiệu xấu', step: 'Bước 4'),    
      ]),
  FirstAid(
      id: 3,
      title: 'Điện giật',
      image: 'assets/images/first_aid_img/Diengiat/main1.png',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Diengiat/1.jpg', descript: 'Ngắt nguồn điện hoặc di chuyển nạn nhân ra xa khỏi nguồn điện', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Diengiat/2.jpg', descript: 'Nếu còn thở, lập tức kiểm tra tình trạng và đưa đi cơ sở y tế gần nhất', step: 'Bước 2'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Diengiat/3.jpg', descript: 'Nếu không còn thở, lập tức thực hiện hô hấp cho nạn nhân và gọi cấp cứu', step: 'Bước 3'),
      ]),
  FirstAid(
      id: 4,
      title: 'Đột quỵ',
      image: 'assets/images/first_aid_img/Dotquy/main1.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Dotquy/dauhieu.jpg', descript: 'Nạn nhân thấy nhức đầu, yếu hoặc tê vùng tay, mặt chân, mất thăng bằng chóng mặt', step: 'Dấu hiệu'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Dotquy/1.jpg', descript: 'Kiểm tra nạn nhân có thể nói chuyện bình thường hay cử động lưỡi hay không', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Dotquy/2.jpg', descript: 'Nếu phát hiện có dấu hiệu ngưng tim, cần gọi cấp cứu 115 và làm thao tác phổi CPR', step: 'Bước 2'),
      ]),
  FirstAid(
      id: 5,
      title: 'Đuối nước',
      image: 'assets/images/first_aid_img/Duoinuoc/main1.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Duoinuoc/1.jpg', descript: 'Nhanh chóng thảy cho nạn nhân bất cứ vật gì có thể bám vào và nổi lên được', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Duoinuoc/2.jpg', descript: 'Sau khi đưa nạn nhân lên bờ, kiểm tra phản ứng và hơi thở', step: 'Bước 2'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Duoinuoc/3.jpg', descript: 'Nếu không còn thở, gọi cấp cứu và hô hấp cho nạn nhân', step: 'Bước 3'),
      ]),
  FirstAid(
      id: 6,
      title: 'Gãy xương',
      image: 'assets/images/first_aid_img/Gayxuong/main1.jpg',
      descript: [
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Gayxuong/dauhieu.jpg', descript: 'Nạn nhân cảm thấy đau, sưng, bầm, tím, biến dạng, không sử dụng được phần chi đó như thông thường', step: 'Dấu hiệu'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Gayxuong/1.jpg', descript: 'Hạn chế di chuyển và đừng cố bẻ thẳng xương bị gãy', step: 'Bước 1'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Gayxuong/2.jpg', descript: 'Xử lý các vế thương ngoài da bằng nước sạch hoặc nước sát khuẩn chuyên dụng (nếu có)', step: 'Bước 2'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Gayxuong/3.jpg', descript: 'Cố định tạm thời xương gãy bằng nẹp hoặc băng ép đễ giữ cho nó bất động', step: 'Bước 3'),
        DescriptFirstAid(
            image: 'assets/images/first_aid_img/Gayxuong/4.jpg', descript: 'Chườm túi lạnh lên vết thương.Thường xuyên nâng cao chi bị gãy sau khi cố định để giảm sưng nề', step: 'Bước 4'),
      ]),
];
