class MessageStreak {
  bool isDoctor;
  List<String> msg = [];

  MessageStreak({required this.isDoctor});

  void addMsg(String m) {
    msg.add(m);
  }
}
