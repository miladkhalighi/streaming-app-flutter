class SessionModel {
  String view;
  String imagePath;
  String userName;
  String userImgPath;
  String title;
  String category;

  SessionModel({
    required this.view,
    required this.imagePath,
    required this.userName,
    required this.userImgPath,
    required this.title,
    required this.category,
  });
}

List<SessionModel> sessionList = [
  SessionModel(
      view: '6.4K',
      imagePath: 'assets/images/user1.png',
      userName: 'Sara',
      userImgPath: 'assets/images/user5.png',
      title: 'Hello from Pakistan',
      category: 'like',
  ),
  SessionModel(
    view: '5.1K',
    imagePath: 'assets/images/user2.png',
    userName: 'David',
    userImgPath: 'assets/images/user6.png',
    title: 'Book Day!',
    category: 'like',
  ),
  SessionModel(
    view: '4K',
    imagePath: 'assets/images/user3.png',
    userName: 'Sara',
    userImgPath: 'assets/images/user5.png',
    title: 'Hello from Pakistan',
    category: 'like',
  ),
  SessionModel(
    view: '2.5K',
    imagePath: 'assets/images/user4.png',
    userName: 'Sara',
    userImgPath: 'assets/images/user5.png',
    title: 'Hello from Pakistan',
    category: 'trend',
  ),
  SessionModel(
    view: '6.4K',
    imagePath: 'assets/images/user5.png',
    userName: 'Sara',
    userImgPath: 'assets/images/user5.png',
    title: 'Hello from Pakistan',
    category: 'trend',
  ),
  SessionModel(
    view: '6.4K',
    imagePath: 'assets/images/user6.png',
    userName: 'Sara',
    userImgPath: 'assets/images/user5.png',
    title: 'Hello from Pakistan',
    category: 'trend',
  ),
];
