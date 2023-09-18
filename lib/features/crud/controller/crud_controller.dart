import 'package:get/get.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_request.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/local_add_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/local_delete_activity.dart';
import 'package:to_do_list_app/features/crud/domain/usecases/local/local_get_activity.dart';
import 'package:to_do_list_app/infrastructure/usecase/usecase.dart';

class CrudController extends GetxController
    with StateMixin<Iterable<DataModel>> {
  CrudController(
    this.localGetActivityUseCase,
    this.localAddActivityUseCase,
    this.localDeleteActivityUseCase,
  );

  final LocalGetActivityUseCase localGetActivityUseCase;
  final LocalAddActivityUseCase localAddActivityUseCase;
  final LocalDeleteActivityUseCase localDeleteActivityUseCase;

  // state
  RxList<List<DataModel>> result = <List<DataModel>>[].obs;

  // loading
  RxBool valuesLoading = false.obs;

  Future<void> getActivity() async {
    change(null, status: RxStatus.loading());
    final response = await localGetActivityUseCase.call(NoParams());
    result.assign(response);
  }

  Future<void> addActivity(DataModel body) async {
    await localAddActivityUseCase.call(body);
  }

  Future<void> deleteActivity(int index) async {
    await localDeleteActivityUseCase.call(index);
  }
}
