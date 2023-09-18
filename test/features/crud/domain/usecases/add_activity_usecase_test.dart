// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_app/features/crud/data/models/request/activity_request.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/activity_repository.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/add_activity_usecase.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';

class MockActivityRepository extends Mock implements ActivityRepository {}

void main() {
  late AddActivityUseCase addActivityUseCase;
  late MockActivityRepository mockActivityRepository;

  setUp(() {
    mockActivityRepository = MockActivityRepository();
    addActivityUseCase = AddActivityUseCase(mockActivityRepository);
  });

  group('Get activity use case', () {
    final response = DataActivityEntity(
      title: 'Makan siang',
      description: 'Makan di restoran',
      category: 'Makanan',
      id: 1,
      ownerId: 1,
    );

    final body = DataActivityBody(
      title: 'Makanan',
      description: 'Makanan ini berasal dari jawa',
      category: 'Hiburan',
    );

    test('should return Activity Entity', () async {
      // arrange
      when(() => mockActivityRepository.addActivity(body))
          .thenAnswer((invocation) async => Right(response));
      // act
      final result = await addActivityUseCase.call(body);
      // assert
      expect(result, Right(response));
    });

    test('should return failure when fail', () async {
      const failure = ServerFailure('Failed to get activity');
      // arrange
      when(() => mockActivityRepository.addActivity(body))
          .thenAnswer((invocation) async => const Left(failure));
      // act
      final result = await addActivityUseCase.call(body);
      // assert
      expect(result, equals(const Left(failure)));
    });
  });
}
