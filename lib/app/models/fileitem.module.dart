class FileItemModel {
  String name;
  String path;
  String type;
  String size;
  bool selected = false;

  FileItemModel({
    required this.name,
    required this.path,
    required this.type,
    this.selected = false,
    this.size = '',
  });
}
