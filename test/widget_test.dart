import 'package:flutter_test/flutter_test.dart';
import 'package:interview_project/ApiServices/api_services.dart';

void main() {
//Implementation Unit Testing

//Api success
  test('getFoodList returns a list of businesses Api Pass', () async {
    ApiServices apiServices = ApiServices();
    var response = await apiServices.getFoodList();

    expect(response.statusCode, 200);
  });

//Api token invalid
  test('When Token Invalid', () async {
    ApiServices apiServices = ApiServices();
    var response = await apiServices.getFoodList();

    expect(response.statusCode, 400);
  });

//Api params not passed
  test('When params not passed ', () async {
    ApiServices apiServices = ApiServices();
    var response = await apiServices.getFoodList();

    expect(response.statusCode, 400);
  });

//Api Internal server error
  test('When Internal server error', () async {
    ApiServices apiServices = ApiServices();
    var response = await apiServices.getFoodList();

    expect(response.statusCode, 500);
  });
}
