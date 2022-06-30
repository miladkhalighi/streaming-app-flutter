

class CategoryItemModel {
  String name;
  String iconPath;

  CategoryItemModel({required this.name,required this.iconPath});
}

List<CategoryItemModel> categoryItemsList = [
  CategoryItemModel(
      name: 'All',
      iconPath: 'assets/icons/activity.svg'
  ),
  CategoryItemModel(
      name: 'Music',
      iconPath: 'assets/icons/music.svg'
  ),
  CategoryItemModel(
      name: 'Sports',
      iconPath: 'assets/icons/sport.svg'
  ),
  CategoryItemModel(
      name: 'Food',
      iconPath: 'assets/icons/pizza-1.svg'
  ),
  CategoryItemModel(
      name: 'News',
      iconPath: 'assets/icons/vec.svg'
  ),
];