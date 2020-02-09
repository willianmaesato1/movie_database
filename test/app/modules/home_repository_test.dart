import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';


class MockClient extends Mock implements Dio {}

void main() {
  MockClient client;

  setUp(() {
    client = MockClient();
  });

  group('HomeRepository Test', () {
    test("First Test", () {
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
    });
  });
}
