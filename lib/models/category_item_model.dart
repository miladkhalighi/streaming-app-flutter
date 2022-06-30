

class CategoryItem {
  String name;
  String iconPath;

  CategoryItem({required this.name,required this.iconPath});
}

List<CategoryItem> categoryItemsList = [
  CategoryItem(
      name: 'All',
      iconPath: 'assets/icons/activity.svg'
  ),
  CategoryItem(
      name: 'assets/icons/music.svg',
      iconPath: 'iconPath'
  ),
  CategoryItem(
      name: 'assets/icons/sport.svg',
      iconPath: 'iconPath'
  ),
  CategoryItem(
      name: 'Food',
      iconPath: 'assets/icons/pizza-1.svg'
  ),
  CategoryItem(
      name: 'News',
      iconPath: 'assets/icons/vec.svg'
  ),
];