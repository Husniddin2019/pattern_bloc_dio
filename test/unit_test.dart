
import 'package:flutter_test/flutter_test.dart';
import 'package:pattern_bloc/model/contacts.dart';
import 'package:pattern_bloc/service/http.dart';

main (){
test("Contacts is not null", () async {
var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
List<Contacts> contacts = Network.parsePostList(response!);
expect(contacts, isNotNull);
});

test("Uzunlik", () async {
  var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
  List<Contacts> contacts = Network.parsePostList(response!);
  expect(contacts.length, greaterThan(0));
});

test("yuztami", () async {
  var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
  List<Contacts> contacts = Network.parsePostList(response!);
  expect(contacts.length, equals(53));
});
}