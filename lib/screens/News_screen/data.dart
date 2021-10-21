class Article {
  String image;
  String title;
  String description;
  String time;
  String author;
  String category;
  String authorImg;

  Article({
    required this.image,
    required this.title,
    required this.description,
    required this.time,
    required this.author,
    required this.category,
    required this.authorImg,
  });
}


final List<Article> forYou = [
  Article(
    category: 'Mẹo vặt',
    title: 'Vệ sinh tay đúng cách',
    description:
        'Bạn có thể rửa tay bằng xà phòng diệt trùng và nước (lạnh hay ấm đều được), vì đây là cách hiệu quả nhất để loại trừ các tác nhân gây hại trên tay ở hầu hết tình huống.Ngoài ra có thể bằng nước rửa tay (dạng bọt, kem, hoặc gel) (hand sanitizers) có chứa 60%-95% cồn (alcohol) trong tình huống không thể rửa tay bằng xà phòng và nước. Tuy nhiên, cần lưu ý rằng cách này không loại trừ hết tất cả các tác nhân gây bệnh hoặc hóa chất độc hại trên tay.',
    time: '30min trước',
    author: 'Bao Thanh nien',
    image: 'assets/image_news/rua_tay.jpg',
    authorImg: 'assets/image_news/skyNews.png',
  ),
  Article(
    category: 'Tin tức',
    title: 'Nhiều người không trung thực để nhận 2 lần hỗ trợ Covid-19',
    description:
        'Theo lãnh đạo UBND H.Hóc Môn, việc chi hỗ trợ đợt 3 (tính đến ngày 19.10), trên địa bàn đã chi cho 346.758 trường hợp khó khăn do ảnh hưởng Covid-19. Lãnh đạo UBND huyện đã chỉ đạo rà soát, kiểm tra trên "Hệ thống quản lý và hỗ trợ phòng chống, dịch Covid-19" và phát hiện 15 trường hợp người dân kê khai không trung thực để nhận 2 lần hỗ trợ.',
    time: '2h trước',
    author: 'VN Express',
    image: 'assets/image_news/Covid1.png',
    authorImg: 'assets/image_news/Vn_Express.png',
  ),
  Article(
    category: 'Tin tức',
    title: 'Ngày 20/10, cả nước ghi nhận 3.646 ca mắc COVID-19 ',
    description:
        'Theo Bộ Y tế, tính 17h ngày 19/10 đến 17h ngày 20/10, trên Hệ thống Quốc gia quản lý ca bệnh COVID-19 ghi nhận 3.646 ca nhiễm mới, trong đó 11 ca nhập cảnh và 3.635 ca ghi nhận trong nước (tăng 608 ca so với ngày trước đó) tại 50 tỉnh, thành phố (có 1.810 ca trong cộng đồng).',
    time: '3h trước',
    author: 'VTC',
    image: 'assets/image_news/Covid2.png',
    authorImg: 'assets/image_news/VTC.png',
  ),
  Article(
    category: 'Mẹo vặt',
    title: 'Lời khuyên giấc ngủ cho thanh thiếu niên',
    description:
        'Bác sĩ khuyên không ăn quá nhiều trước khi đi ngủ,sử dụng màn hình trong phòng ngủ. Ngoài ra,tập thể dục để giấc ngủ tốt hơn và không dùng chất caffeine để đánh bại chứng mất ngủ cũng là những điều nên làm.',
    time: '3h30 trước',
    author: 'VN Express',
    image: 'assets/image_news/cach_ngu.png',
    authorImg: 'assets/image_news/Vn_Express.png',
  ),
  Article(
    category: 'Mẹo vặt',
    title: 'Cách sống cho một dạ dày khỏe mạnh',
    description:
        'Một số cách có thể giúp có thể kể đến như: Xua tan căng thẳng để giảm cơn đau dạ dày, bỏ hút thuốc lá hay ăn uống đúng cách. Ngoài ra, chúng ta cũng nên giảm cân khi bạn quá cân hoặc đừng uống rượu bia quá nhiều. ',
    time: '8h45 trước',
    author: 'Bao thanh nien',
    image: 'assets/image_news/da_day.png',
    authorImg: 'assets/image_news/bao_thanhnien.png',
  ),
  Article(
    category: 'Tin tức',
    title: 'Bình Dương đã an toàn về Covid-19',
    description:
        'Chiều 20.10, ông Nguyễn Hồng Chương, Giám đốc Sở Y tế tỉnh Bình Dương, đã ký văn bản đánh giá về tình trạng Covid 19. Cụ thể, có 42 xã, phường có nguy cơ cấp độ 1 (vùng xanh), 27 xã, phường cấp độ 2 (vùng vàng) và 22 xã, phường cấp độ 3 (vùng cam), không có xã phường cấp độ 4 (vùng đỏ). Đáng chú ý, có H.Phú Giáo 100% các xã, thị trấn là vùng xanh.',
    time: '11h22 trước',
    author: 'VTC',
    image: 'assets/image_news/Covid3.png',
    authorImg: 'assets/image_news/VTC.png',
  ),
  Article(
    category: 'Mẹo vặt',
    title: '10 lí do đau đầu đáng ngạc nhiên',
    description:
        'Xả hơi sau khi căng thẳng; Dồn nén bực tức; Tư thế làm việc không đúng cách; Nước hoa của bạn; Thời tiết xấu; Tật nghiến răng; Ánh sáng chói và nhấp nháy; Đồ ăn trưa đóng hộp; Đau đầu vì quan hệ tình dục; Kem',
    time: '1ngày trước',
    author: 'VN Express',
    image: 'assets/image_news/dau_dau.png',
    authorImg: 'assets/image_news/Vn_Express.png',
  ),
];
