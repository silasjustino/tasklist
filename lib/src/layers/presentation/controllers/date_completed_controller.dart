import 'package:tasklist/src/layers/domain/entities/date_completed_entity.dart';
import 'package:tasklist/src/layers/domain/usecases/get_entities_usecase.dart';
import 'package:tasklist/src/layers/domain/usecases/set_entities_usecase.dart';

class DateCompletedController {
  final GetEntitiesUseCase _getEntities;
  final SetEntitiesUseCase _setEntities;

  DateCompletedController(this._getEntities, this._setEntities);

  Future<DateCompletedEntity?> getDateCompleted(id) async {
    return await _getEntities.fetchDateCompleted(id);
  }

  Future<DateCompletedEntity> setDateCompleted(
      DateCompletedEntity dateCompleted) async {
    return await _setEntities.saveDateCompleted(dateCompleted);
  }
}
