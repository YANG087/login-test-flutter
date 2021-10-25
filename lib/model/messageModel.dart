class Message{
  String? contents;
  String? sender;
  String? reciver;
  String? sendDate;
  String? viewYn;

  Message(String? contents, String? sender, String? reciver, String? sendDate, String? viewYn){
    this.contents = contents;
    this.sender = sender;
    this.reciver = reciver;
    this.sendDate = sendDate;
    this.viewYn = viewYn;
  }
}