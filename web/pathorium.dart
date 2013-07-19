import 'dart:html';
import 'package:web_ui/web_ui.dart';

InputElement txtPath = query('#txtPath');
Element placeHolder = query('#entries .placeholder');

@observable
var path = 'aa';

void main() {
  txtPath
    ..onPaste.listen(
        (e) => handleInput(e.clipboardData.getData('Text'))
    )
    ..onInput.listen(
        (e) => handleInput(e.target.value)
    );
}

void showError(String message) {
  DivElement div = query('.alert-box');
  div.text = message;
  div.style.display = 'block';
}

void handleInput(String value) {
  path = "asdjnaksjdnsad";
  clearEntries();
  List<String> entries = value.split(new RegExp(";"));
  
  placeHolder.hidden = entries.isNotEmpty;
  
  Iterator it = entries.iterator;
  while(it.moveNext()) {
    String entry = it.current;
    if( entry.isNotEmpty )
      addEntry(entry);
  }
}

void addEntry(String entry) {
  TableElement entries = query("#entries table");
  var tbody = entries.tBodies.first;
  TableRowElement newEntry = new Element.tag('tr');
  
  var cell = new Element.tag('td');
  cell.nodes.add(new CheckboxInputElement());
  newEntry.nodes.add(cell);
  
  cell = new Element.tag('td');
  var input = new TextInputElement();
  input.value = entry.trim();
  cell.nodes.add(input);
  newEntry.nodes.add(cell);
  
  tbody.nodes.add(newEntry);
}

void clearEntries() {
  TableElement entries = query("#entries table");
  TableSectionElement tbody = entries.tBodies.first;
  tbody.children.clear();
}