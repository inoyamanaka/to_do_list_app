// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_app/features/crud/domain/entities/activity_entity.dart';
import 'package:to_do_list_app/features/crud/domain/repositories/activity_repository.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/get_activity_usecase.dart';
import 'package:to_do_list_app/infrastructure/error/failures.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class MockActivityRepository extends Mock implements ActivityRepository {}

void main() {
  late GetActivityUseCase getActivityUseCase;
  late MockActivityRepository mockActivityRepository;

  setUp(() {
    mockActivityRepository = MockActivityRepository();
    getActivityUseCase = GetActivityUseCase(mockActivityRepository);
  });

  group('Get activity use case', () {
    test('should return Activity Entity', () async {
      final response = DataActivityEntity(
      title: 'Makan siang',
      description: 'Makan di restoran',
      category: 'Makanan',
      id: 1,
      ownerId: 1,
    );
      // arrange
      when(() => mockActivityRepository.getActivity())
          .thenAnswer((invocation) async => Right(response));
      // act
      final result = await getActivityUseCase.call(NoParams());
      // assert
      expect(result, Right(response));
    });

    test('should return failure when fail', () async {
      const failure = ServerFailure('Failed to get activity');
      // arrange
      when(() => mockActivityRepository.getActivity())
          .thenAnswer((invocation) async => const Left(failure));
      // act
      final result = await getActivityUseCase.call(NoParams());
      // assert
      expect(result, equals(const Left(failure)));
    });
  });
}
