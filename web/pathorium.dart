import 'dart:html';
import 'package:web_ui/web_ui.dart';

InputElement txtPath = query('#txtPath');
Element placeHolder = query('#entries .placeholder');
TableElement table = query("#entries table");
PathManager manager = new PathManager();

@Observable
String pathVar = '';

@Observable
String pathSeparator = ':';

void main() {
  txtPath
    ..onPaste.listen(
        (e) => varToTable(e.clipboardData.getData('Text'))
    )
    ..onInput.listen(
        (e) => varToTable(e.target.value)
    );
  
  table
    ..onInput.listen(
        tableToInput
    )
    ..onChange.listen(
        tableToInput
    );
  
  table.hidden = true;
  
  if (window.navigator.appVersion.indexOf("Win")!=-1 ) {
    pathSeparator = ";";
  }
}

void showError(String message) {
  DivElement div = query('.alert-box');
  div.text = message;
  div.style.display = 'block';
}

void varToTable(String value) {
  manager.setFromVar(value);
  updateTable();
}

void updateInput() {
  txtPath.value = manager.getVariable();
}

void updateTable() {
  var entries = manager.entries;
  table.hidden = entries.isEmpty;
  placeHolder.hidden = entries.isNotEmpty;
  
  var tbody = table.tBodies.first;
  tbody.children.clear();
  
  if(entries.isNotEmpty) {
    Iterator it = entries.iterator;
    while(it.moveNext()) {
      String entry = it.current;
      if( entry.isNotEmpty )
        addTableEntry(entry, tbody);
    }
  }
}

void addTableEntry(String entry, tbody) {
  TableRowElement newEntry = new Element.tag('tr');
  
  var cell = new Element.tag('td');
  var input = new TextInputElement();
  input.value = entry.trim();
  cell.nodes.add(input);
  newEntry.nodes.add(cell);
  
  tbody.nodes.add(newEntry);
}

void tableToInput(ev) {
  manager.clearEntries();
  table.queryAll('input').forEach( (e) {
    manager.addEntry(e.value);
  });
  updateInput();
}


// logic

class PathManager {

  List<String> entries = new List<String>(0);
  
  void setFromVar(String pathVariable) {
    this.entries = pathVariable.split(pathSeparator);
  }
  
  void removeEntry(int index) {
    entries.removeAt(index);
  }
  
  String getVariable() {
    if(entries == null) {
      return "";
    }
    
    return entries.join(pathSeparator);
  }
  
  void addEntry(String entry) => entries.add(entry);
  void clearEntries() => entries.clear();  
}