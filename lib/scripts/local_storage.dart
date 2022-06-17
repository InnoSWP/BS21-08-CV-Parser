import 'package:universal_html/html.dart';

save(String name, String json) {
  var values = window.localStorage;
  if (values.containsKey(name)) {
    // if the key exists, change it to unique one.
    int index = 1;
    String tempName = '$name ($index)';
    while (values.containsKey(tempName)) {
      index++;
      tempName = '$name ($index)';
    }
    name = tempName;
  }
  values[name] = json;
}

remove(String name) {
  var values = window.localStorage;
  values.remove(name);
}

load(String name) {
  var values = window.localStorage;
  return values[name];
}

loadAll() {
  var values = window.localStorage;
  var list = [];
  values.forEach((key, value) {
    list.add({key, value});
  });
  return list;
}
