import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_condition_model.freezed.dart';
part 'vehicle_condition_model.g.dart';

@freezed
abstract class VehicleConditionModel with _$VehicleConditionModel {
  const factory VehicleConditionModel({
    @Default('yes') String drivable,
    @Default('no') String accidental,
    @Default('no') String wovi,
    @JsonKey(name: 'under_finance') @Default('no') String underFinance,
  }) = _VehicleConditionModel;

  const VehicleConditionModel._();

  bool get isDrivable => drivable.toLowerCase() == 'yes';
  bool get isAccidental => accidental.toLowerCase() == 'yes';
  bool get isWovi => wovi.toLowerCase() == 'yes';
  bool get isUnderFinance => underFinance.toLowerCase() == 'yes';

  factory VehicleConditionModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleConditionModelFromJson(json);
}
