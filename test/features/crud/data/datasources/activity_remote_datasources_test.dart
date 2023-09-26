// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:to_do_list_app/features/crud/data/datasources/activity_remote_datasource.dart';
// import 'package:to_do_list_app/features/crud/data/models/response/activity_response.dart';
// import 'package:to_do_list_app/infrastructure/error/excaptions.dart';

// class MockDio extends Mock implements Dio {}

// void main() {
//   late MockDio mockDio;
//   late ActivityRemoteDataSourceImpl activityRemoteDataSourceImpl;

//   setUp(() {
//     mockDio = MockDio();
//     activityRemoteDataSourceImpl = ActivityRemoteDataSourceImpl(mockDio);
//   });

//   group('Activity Remote Datasource', () {
//     final responseMap = {
//       'title': 'string',
//       'description': 'string',
//       'category': 'string',
//       'id': 0,
//       'ownerId': 0,
//     };

//     test('should return DataActivityModel on successfull call', () async {
//       // arrange
//       when(
//         () => mockDio.get<Map<String, dynamic>>(
//           'url',
//         ),
//       ).thenAnswer(
//         (_) async => Response<Map<String, dynamic>>(
//           data: responseMap,
//           statusCode: 200,
//           requestOptions: RequestOptions(path: 'path'),
//         ),
//       );

//       // act
//       final response = await activityRemoteDataSourceImpl.getActivity();

//       // assert
//       expect(response, DataActivityModel.fromJson(responseMap));
//     });

//     test('should return DioException on Dio error', () async {
//       // arrange
//       when(
//         () => mockDio.get<Map<String, dynamic>>(
//           'url',
//           options: any(named: 'options'),
//         ),
//       ).thenThrow(DioException(requestOptions: RequestOptions(path: 'path')));

//       // act
//       final response = activityRemoteDataSourceImpl.getActivity();

//       // assert
//       expect(() => response, throwsA(isA<DioException>()));
//     });

//     test(
//       'should throw a ServerException when an unexpected error occurs',
//       () async {
//         // Arrange
//         when(
//           () => mockDio.post<Map<String, dynamic>>(
//             'ApiPath.category',
//           ),
//         ).thenThrow(Exception('Something went wrong'));

//         // Act
//         final call = activityRemoteDataSourceImpl.getActivity;

//         // Assert
//         expect(call, throwsA(isA<ServerException>()));
//       },
//     );
//   });
// }
