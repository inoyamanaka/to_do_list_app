// // ignore_for_file: inference_failure_on_instance_creation

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:to_do_list_app/features/crud/data/datasources/activity_remote_datasource.dart';
// import 'package:to_do_list_app/features/crud/data/models/request/activity_request.dart';
// import 'package:to_do_list_app/features/crud/data/repositories/activity_repository_impl.dart';
// import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
// import 'package:to_do_list_app/infrastructure/error/failures.dart';

// class MockActivityRemoteDataSource extends Mock
//     implements ActivityRemoteDataSource {}

// void main() {
//   late MockActivityRemoteDataSource dataSource;
//   late ActivityRepositoryImpl repositoryImpl;

//   setUp(() {
//     dataSource = MockActivityRemoteDataSource();
//     repositoryImpl = ActivityRepositoryImpl(dataSource);
//   });

//   group('ActicityRepoImpl get', () {
//     final remoteEntity = DataActivityEntity(
//       title: 'aa',
//       category: '222',
//       description: '231',
//       id: 1,
//       ownerId: 1,
//     );
//     test('should return Right on success', () async {
//       // Arrange
//       when(() => dataSource.getActivity())
//           .thenAnswer((_) async => remoteEntity);

//       // Act
//       final result = await repositoryImpl.getActivity();

//       // Assert
//       expect(result, Right(remoteEntity));
//       verify(() => repositoryImpl.getActivity()).called(1);
//     });

//     test('should return DioException on Dio error', () async {
//       final dioError = DioException(
//         response: Response(
//           data: {'message': 'Error message'},
//           statusCode: 500,
//           requestOptions: RequestOptions(path: 'path'),
//         ),
//         requestOptions: RequestOptions(path: 'path'),
//       );
//       // arrange
//       when(
//         () => dataSource.getActivity(),
//       ).thenThrow(dioError);

//       // act
//       final response = await repositoryImpl.getActivity();

//       // assert
//       expect(response, const Left(ServerFailure('Error message')));
//     });

//     test(
//       'should throw a ServerException when an unexpected error occurs',
//       () async {
//         // Arrange
//         when(
//           () => dataSource.getActivity(),
//         ).thenThrow('Something went wrong');

//         // Act
//         final call = await repositoryImpl.getActivity();

//         // Assert
//         expect(call, const Left(ServerFailure('Something went wrong')));
//       },
//     );
//   });
//   group('ActicityRepoImpl add', () {
//     final body = DataActivityBody(
//       title: 'Test',
//       category: 'Jajanan',
//       description: 'apa aja',
//     );
//     final remoteEntity = DataActivityEntity(
//       category: 'Jajanan',
//       description: 'apa aja',
//       id: 1,
//       ownerId: 1,
//       title: 'Test',
//     );

//     test('should return Right on success', () async {
//       // Arrange
//       when(() => dataSource.addActivity(body))
//           .thenAnswer((_) async => remoteEntity);

//       // Act
//       final result = await repositoryImpl.addActivity(body);

//       // Assert
//       expect(result, Right(remoteEntity));
//     });

//     test('should return DioException on Dio error', () async {
//       final dioError = DioException(
//         response: Response(
//           data: {'message': 'Error message'},
//           statusCode: 500,
//           requestOptions: RequestOptions(path: 'path'),
//         ),
//         requestOptions: RequestOptions(path: 'path'),
//       );
//       // arrange
//       when(
//         () => dataSource.addActivity(body),
//       ).thenThrow(dioError);

//       // act
//       final response = await repositoryImpl.addActivity(body);

//       // assert
//       expect(response, const Left(ServerFailure('Error message')));
//     });

//     test(
//       'should throw a ServerException when an unexpected error occurs',
//       () async {
//         // Arrange
//         when(
//           () => dataSource.addActivity(body),
//         ).thenThrow('Something went wrong');

//         // Act
//         final call = await repositoryImpl.addActivity(body);

//         // Assert
//         expect(call, const Left(ServerFailure('Something went wrong')));
//       },
//     );
//   });
// }
