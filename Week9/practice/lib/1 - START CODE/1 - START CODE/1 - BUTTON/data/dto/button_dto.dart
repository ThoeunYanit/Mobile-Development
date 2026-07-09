import '../../model/button_status.dart';

class ButtonDto {

  static final name = 'name';
  static final selected = 'selected';


  static ButtonStatus fromJson(Map<String, dynamic> json) {

    assert(json[name] is String);
    assert(json[selected] is bool);


    String nameValue = json[name];
    bool selectedValue = json[selected];


    return ButtonStatus(
      name: nameValue,
      selected: selectedValue,
    );
  }
}