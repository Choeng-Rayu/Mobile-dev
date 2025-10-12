// String eleminateMatchSymbols(String symbols){
//   final eleminated = symbols.replaceAll("()", "").replaceAll("[]", "").replaceAll("{}", "");
//   // (eleminated == symbols) ? symbols : symbols(eleminated);
//   return (eleminated == symbols) ? symbols : eleminateMatchSymbols(eleminated);
// }
// void main (){
//   // const input = "{what is (42)}?";
//   // const input = "{text}";
//   const input = "{[[(ab)]c]d}";
//   const validSymbols = <String> {
//     "{", "(", "[", "}", ")", "]"
//   };
//   // const validSymbols2 = <String> {
//   //   "}", ")", "]"
//   // };
//   // print(input.split(""));
//   // final checkSymbols = input.split("").where((symbols) => validSymbols.contains(symbols)).toList();
//   // if(checkSymbols.isEmpty) print("balanced");
//   // else print("not balanced");
//   var stackOpens = input.split("").where((comparedSymbol) => validSymbols.contains(comparedSymbol)).join();
//   stackOpens = eleminateMatchSymbols(stackOpens);
//   if(stackOpens.isEmpty) print("balanced");
//   else print("not balanced");
//   // final stackCloses = input.split("").where((comparedSymbol) => validSymbols2.contains(comparedSymbol)).toList();
//   print(stackOpens);
//   // print(stackCloses);
// }
//
//
//
//













// // last version
// String eleminateMatchSymbols(String symbols){
//   final eleminated = symbols.replaceAll("()", "").replaceAll("[]", "").replaceAll("{}", "");
//   return (eleminated == symbols) ? symbols : eleminateMatchSymbols(eleminated);
// }
// void main (){
//   // const input = "{what is (42)}?";
//   const input = "[text}";
//   // const input = "{[[(ab)]c]d}";
//   const validSymbols = <String> {
//     "{", "(", "[", "}", ")", "]"
//   };
//
//   var stackOpens = input.split("").where((comparedSymbol) => validSymbols.contains(comparedSymbol)).join();
//   stackOpens = eleminateMatchSymbols(stackOpens);
//    print(stackOpens.isEmpty ? "balanced" : "not Balanced");
// }





String eleminateMatchSymbols(String symbols){ // using recursive
  final eleminated = symbols.replaceAll("()", "").replaceAll("[]", "").replaceAll("{}", "");
  return (eleminated == symbols) ? symbols : eleminateMatchSymbols(eleminated); // if eleminated == symbols calling the function again and again until it not equal
}
void main (){
  // const input = "{what is (42)}?";
  // const input = "[text}";
  const input = "{{[[(ab)]c]d}}";
  const validSymbols = [
    "{", "(", "[", "}", ")", "]"
  ];

  // var stackOpens = input.split("").where((comparedSymbol) => validSymbols.contains(comparedSymbol)).join(); // for simple way
  final checkSymboles = eleminateMatchSymbols(input.split("").where((comparedSymbol) => validSymbols.contains(comparedSymbol)).join()); // in advance
  print(checkSymboles.isEmpty ? "balanced" : "not Balanced");
}





