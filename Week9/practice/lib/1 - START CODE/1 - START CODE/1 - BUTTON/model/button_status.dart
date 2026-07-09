class ButtonStatus {
  String name;
  bool selected;

  ButtonStatus({required this.name, required this.selected});

  @override
  String toString() {
    return 'name: $name\nselected: $selected';
  }
}
