// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_wizard_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleWizardState {

 int get currentStep; bool get isLoadingBrands; bool get isLoadingModels; bool get isLoadingLookup; bool get isSubmitting; List<BrandModel> get brands; List<VehicleModelOption> get models;// Step 1: Technical specs
 int? get selectedBrandId; int? get selectedModelId; String get registrationNumber; String get registrationState; String get vinNumber; String get year; String get engineSize; String get engineNumber; String get transmission; String get bodyType; String get variant; String get built; String get odometer;// Step 2: Seller & Pickup
 String get firstName; String get lastName; String get phoneNumber; String get abnNumber; String get businessName; String get licenseNumber; String get pickupDate; String get dateOfBirth; String get pickupAddress; String get residentialAddress; bool get samePickupAddress;// Step 3: Condition & Signatures
 bool get isDrivable; bool get isAccidental; bool get isWovi; bool get isUnderFinance; String get price; String get paymentMethod; String get note; String? get ownerSignaturePath; String? get buyerSignaturePath; bool get termsAgreed; String? get errorMessage; String? get successMessage;
/// Create a copy of VehicleWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleWizardStateCopyWith<VehicleWizardState> get copyWith => _$VehicleWizardStateCopyWithImpl<VehicleWizardState>(this as VehicleWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleWizardState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isLoadingBrands, isLoadingBrands) || other.isLoadingBrands == isLoadingBrands)&&(identical(other.isLoadingModels, isLoadingModels) || other.isLoadingModels == isLoadingModels)&&(identical(other.isLoadingLookup, isLoadingLookup) || other.isLoadingLookup == isLoadingLookup)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.brands, brands)&&const DeepCollectionEquality().equals(other.models, models)&&(identical(other.selectedBrandId, selectedBrandId) || other.selectedBrandId == selectedBrandId)&&(identical(other.selectedModelId, selectedModelId) || other.selectedModelId == selectedModelId)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.registrationState, registrationState) || other.registrationState == registrationState)&&(identical(other.vinNumber, vinNumber) || other.vinNumber == vinNumber)&&(identical(other.year, year) || other.year == year)&&(identical(other.engineSize, engineSize) || other.engineSize == engineSize)&&(identical(other.engineNumber, engineNumber) || other.engineNumber == engineNumber)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.built, built) || other.built == built)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.abnNumber, abnNumber) || other.abnNumber == abnNumber)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.residentialAddress, residentialAddress) || other.residentialAddress == residentialAddress)&&(identical(other.samePickupAddress, samePickupAddress) || other.samePickupAddress == samePickupAddress)&&(identical(other.isDrivable, isDrivable) || other.isDrivable == isDrivable)&&(identical(other.isAccidental, isAccidental) || other.isAccidental == isAccidental)&&(identical(other.isWovi, isWovi) || other.isWovi == isWovi)&&(identical(other.isUnderFinance, isUnderFinance) || other.isUnderFinance == isUnderFinance)&&(identical(other.price, price) || other.price == price)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.note, note) || other.note == note)&&(identical(other.ownerSignaturePath, ownerSignaturePath) || other.ownerSignaturePath == ownerSignaturePath)&&(identical(other.buyerSignaturePath, buyerSignaturePath) || other.buyerSignaturePath == buyerSignaturePath)&&(identical(other.termsAgreed, termsAgreed) || other.termsAgreed == termsAgreed)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,isLoadingBrands,isLoadingModels,isLoadingLookup,isSubmitting,const DeepCollectionEquality().hash(brands),const DeepCollectionEquality().hash(models),selectedBrandId,selectedModelId,registrationNumber,registrationState,vinNumber,year,engineSize,engineNumber,transmission,bodyType,variant,built,odometer,firstName,lastName,phoneNumber,abnNumber,businessName,licenseNumber,pickupDate,dateOfBirth,pickupAddress,residentialAddress,samePickupAddress,isDrivable,isAccidental,isWovi,isUnderFinance,price,paymentMethod,note,ownerSignaturePath,buyerSignaturePath,termsAgreed,errorMessage,successMessage]);

@override
String toString() {
  return 'VehicleWizardState(currentStep: $currentStep, isLoadingBrands: $isLoadingBrands, isLoadingModels: $isLoadingModels, isLoadingLookup: $isLoadingLookup, isSubmitting: $isSubmitting, brands: $brands, models: $models, selectedBrandId: $selectedBrandId, selectedModelId: $selectedModelId, registrationNumber: $registrationNumber, registrationState: $registrationState, vinNumber: $vinNumber, year: $year, engineSize: $engineSize, engineNumber: $engineNumber, transmission: $transmission, bodyType: $bodyType, variant: $variant, built: $built, odometer: $odometer, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, abnNumber: $abnNumber, businessName: $businessName, licenseNumber: $licenseNumber, pickupDate: $pickupDate, dateOfBirth: $dateOfBirth, pickupAddress: $pickupAddress, residentialAddress: $residentialAddress, samePickupAddress: $samePickupAddress, isDrivable: $isDrivable, isAccidental: $isAccidental, isWovi: $isWovi, isUnderFinance: $isUnderFinance, price: $price, paymentMethod: $paymentMethod, note: $note, ownerSignaturePath: $ownerSignaturePath, buyerSignaturePath: $buyerSignaturePath, termsAgreed: $termsAgreed, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $VehicleWizardStateCopyWith<$Res>  {
  factory $VehicleWizardStateCopyWith(VehicleWizardState value, $Res Function(VehicleWizardState) _then) = _$VehicleWizardStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, bool isLoadingBrands, bool isLoadingModels, bool isLoadingLookup, bool isSubmitting, List<BrandModel> brands, List<VehicleModelOption> models, int? selectedBrandId, int? selectedModelId, String registrationNumber, String registrationState, String vinNumber, String year, String engineSize, String engineNumber, String transmission, String bodyType, String variant, String built, String odometer, String firstName, String lastName, String phoneNumber, String abnNumber, String businessName, String licenseNumber, String pickupDate, String dateOfBirth, String pickupAddress, String residentialAddress, bool samePickupAddress, bool isDrivable, bool isAccidental, bool isWovi, bool isUnderFinance, String price, String paymentMethod, String note, String? ownerSignaturePath, String? buyerSignaturePath, bool termsAgreed, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$VehicleWizardStateCopyWithImpl<$Res>
    implements $VehicleWizardStateCopyWith<$Res> {
  _$VehicleWizardStateCopyWithImpl(this._self, this._then);

  final VehicleWizardState _self;
  final $Res Function(VehicleWizardState) _then;

/// Create a copy of VehicleWizardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? isLoadingBrands = null,Object? isLoadingModels = null,Object? isLoadingLookup = null,Object? isSubmitting = null,Object? brands = null,Object? models = null,Object? selectedBrandId = freezed,Object? selectedModelId = freezed,Object? registrationNumber = null,Object? registrationState = null,Object? vinNumber = null,Object? year = null,Object? engineSize = null,Object? engineNumber = null,Object? transmission = null,Object? bodyType = null,Object? variant = null,Object? built = null,Object? odometer = null,Object? firstName = null,Object? lastName = null,Object? phoneNumber = null,Object? abnNumber = null,Object? businessName = null,Object? licenseNumber = null,Object? pickupDate = null,Object? dateOfBirth = null,Object? pickupAddress = null,Object? residentialAddress = null,Object? samePickupAddress = null,Object? isDrivable = null,Object? isAccidental = null,Object? isWovi = null,Object? isUnderFinance = null,Object? price = null,Object? paymentMethod = null,Object? note = null,Object? ownerSignaturePath = freezed,Object? buyerSignaturePath = freezed,Object? termsAgreed = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,isLoadingBrands: null == isLoadingBrands ? _self.isLoadingBrands : isLoadingBrands // ignore: cast_nullable_to_non_nullable
as bool,isLoadingModels: null == isLoadingModels ? _self.isLoadingModels : isLoadingModels // ignore: cast_nullable_to_non_nullable
as bool,isLoadingLookup: null == isLoadingLookup ? _self.isLoadingLookup : isLoadingLookup // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<BrandModel>,models: null == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<VehicleModelOption>,selectedBrandId: freezed == selectedBrandId ? _self.selectedBrandId : selectedBrandId // ignore: cast_nullable_to_non_nullable
as int?,selectedModelId: freezed == selectedModelId ? _self.selectedModelId : selectedModelId // ignore: cast_nullable_to_non_nullable
as int?,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,registrationState: null == registrationState ? _self.registrationState : registrationState // ignore: cast_nullable_to_non_nullable
as String,vinNumber: null == vinNumber ? _self.vinNumber : vinNumber // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,engineSize: null == engineSize ? _self.engineSize : engineSize // ignore: cast_nullable_to_non_nullable
as String,engineNumber: null == engineNumber ? _self.engineNumber : engineNumber // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,bodyType: null == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,built: null == built ? _self.built : built // ignore: cast_nullable_to_non_nullable
as String,odometer: null == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,abnNumber: null == abnNumber ? _self.abnNumber : abnNumber // ignore: cast_nullable_to_non_nullable
as String,businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,pickupDate: null == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String,residentialAddress: null == residentialAddress ? _self.residentialAddress : residentialAddress // ignore: cast_nullable_to_non_nullable
as String,samePickupAddress: null == samePickupAddress ? _self.samePickupAddress : samePickupAddress // ignore: cast_nullable_to_non_nullable
as bool,isDrivable: null == isDrivable ? _self.isDrivable : isDrivable // ignore: cast_nullable_to_non_nullable
as bool,isAccidental: null == isAccidental ? _self.isAccidental : isAccidental // ignore: cast_nullable_to_non_nullable
as bool,isWovi: null == isWovi ? _self.isWovi : isWovi // ignore: cast_nullable_to_non_nullable
as bool,isUnderFinance: null == isUnderFinance ? _self.isUnderFinance : isUnderFinance // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,ownerSignaturePath: freezed == ownerSignaturePath ? _self.ownerSignaturePath : ownerSignaturePath // ignore: cast_nullable_to_non_nullable
as String?,buyerSignaturePath: freezed == buyerSignaturePath ? _self.buyerSignaturePath : buyerSignaturePath // ignore: cast_nullable_to_non_nullable
as String?,termsAgreed: null == termsAgreed ? _self.termsAgreed : termsAgreed // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleWizardState].
extension VehicleWizardStatePatterns on VehicleWizardState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleWizardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleWizardState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleWizardState value)  $default,){
final _that = this;
switch (_that) {
case _VehicleWizardState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleWizardState value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleWizardState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  bool isLoadingBrands,  bool isLoadingModels,  bool isLoadingLookup,  bool isSubmitting,  List<BrandModel> brands,  List<VehicleModelOption> models,  int? selectedBrandId,  int? selectedModelId,  String registrationNumber,  String registrationState,  String vinNumber,  String year,  String engineSize,  String engineNumber,  String transmission,  String bodyType,  String variant,  String built,  String odometer,  String firstName,  String lastName,  String phoneNumber,  String abnNumber,  String businessName,  String licenseNumber,  String pickupDate,  String dateOfBirth,  String pickupAddress,  String residentialAddress,  bool samePickupAddress,  bool isDrivable,  bool isAccidental,  bool isWovi,  bool isUnderFinance,  String price,  String paymentMethod,  String note,  String? ownerSignaturePath,  String? buyerSignaturePath,  bool termsAgreed,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleWizardState() when $default != null:
return $default(_that.currentStep,_that.isLoadingBrands,_that.isLoadingModels,_that.isLoadingLookup,_that.isSubmitting,_that.brands,_that.models,_that.selectedBrandId,_that.selectedModelId,_that.registrationNumber,_that.registrationState,_that.vinNumber,_that.year,_that.engineSize,_that.engineNumber,_that.transmission,_that.bodyType,_that.variant,_that.built,_that.odometer,_that.firstName,_that.lastName,_that.phoneNumber,_that.abnNumber,_that.businessName,_that.licenseNumber,_that.pickupDate,_that.dateOfBirth,_that.pickupAddress,_that.residentialAddress,_that.samePickupAddress,_that.isDrivable,_that.isAccidental,_that.isWovi,_that.isUnderFinance,_that.price,_that.paymentMethod,_that.note,_that.ownerSignaturePath,_that.buyerSignaturePath,_that.termsAgreed,_that.errorMessage,_that.successMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  bool isLoadingBrands,  bool isLoadingModels,  bool isLoadingLookup,  bool isSubmitting,  List<BrandModel> brands,  List<VehicleModelOption> models,  int? selectedBrandId,  int? selectedModelId,  String registrationNumber,  String registrationState,  String vinNumber,  String year,  String engineSize,  String engineNumber,  String transmission,  String bodyType,  String variant,  String built,  String odometer,  String firstName,  String lastName,  String phoneNumber,  String abnNumber,  String businessName,  String licenseNumber,  String pickupDate,  String dateOfBirth,  String pickupAddress,  String residentialAddress,  bool samePickupAddress,  bool isDrivable,  bool isAccidental,  bool isWovi,  bool isUnderFinance,  String price,  String paymentMethod,  String note,  String? ownerSignaturePath,  String? buyerSignaturePath,  bool termsAgreed,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _VehicleWizardState():
return $default(_that.currentStep,_that.isLoadingBrands,_that.isLoadingModels,_that.isLoadingLookup,_that.isSubmitting,_that.brands,_that.models,_that.selectedBrandId,_that.selectedModelId,_that.registrationNumber,_that.registrationState,_that.vinNumber,_that.year,_that.engineSize,_that.engineNumber,_that.transmission,_that.bodyType,_that.variant,_that.built,_that.odometer,_that.firstName,_that.lastName,_that.phoneNumber,_that.abnNumber,_that.businessName,_that.licenseNumber,_that.pickupDate,_that.dateOfBirth,_that.pickupAddress,_that.residentialAddress,_that.samePickupAddress,_that.isDrivable,_that.isAccidental,_that.isWovi,_that.isUnderFinance,_that.price,_that.paymentMethod,_that.note,_that.ownerSignaturePath,_that.buyerSignaturePath,_that.termsAgreed,_that.errorMessage,_that.successMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  bool isLoadingBrands,  bool isLoadingModels,  bool isLoadingLookup,  bool isSubmitting,  List<BrandModel> brands,  List<VehicleModelOption> models,  int? selectedBrandId,  int? selectedModelId,  String registrationNumber,  String registrationState,  String vinNumber,  String year,  String engineSize,  String engineNumber,  String transmission,  String bodyType,  String variant,  String built,  String odometer,  String firstName,  String lastName,  String phoneNumber,  String abnNumber,  String businessName,  String licenseNumber,  String pickupDate,  String dateOfBirth,  String pickupAddress,  String residentialAddress,  bool samePickupAddress,  bool isDrivable,  bool isAccidental,  bool isWovi,  bool isUnderFinance,  String price,  String paymentMethod,  String note,  String? ownerSignaturePath,  String? buyerSignaturePath,  bool termsAgreed,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _VehicleWizardState() when $default != null:
return $default(_that.currentStep,_that.isLoadingBrands,_that.isLoadingModels,_that.isLoadingLookup,_that.isSubmitting,_that.brands,_that.models,_that.selectedBrandId,_that.selectedModelId,_that.registrationNumber,_that.registrationState,_that.vinNumber,_that.year,_that.engineSize,_that.engineNumber,_that.transmission,_that.bodyType,_that.variant,_that.built,_that.odometer,_that.firstName,_that.lastName,_that.phoneNumber,_that.abnNumber,_that.businessName,_that.licenseNumber,_that.pickupDate,_that.dateOfBirth,_that.pickupAddress,_that.residentialAddress,_that.samePickupAddress,_that.isDrivable,_that.isAccidental,_that.isWovi,_that.isUnderFinance,_that.price,_that.paymentMethod,_that.note,_that.ownerSignaturePath,_that.buyerSignaturePath,_that.termsAgreed,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleWizardState implements VehicleWizardState {
  const _VehicleWizardState({this.currentStep = 0, this.isLoadingBrands = false, this.isLoadingModels = false, this.isLoadingLookup = false, this.isSubmitting = false, this.brands = const <BrandModel>[], this.models = const <VehicleModelOption>[], this.selectedBrandId, this.selectedModelId, this.registrationNumber = '', this.registrationState = 'NSW', this.vinNumber = '', this.year = '', this.engineSize = '', this.engineNumber = '', this.transmission = 'Auto', this.bodyType = 'SEDAN', this.variant = '', this.built = '', this.odometer = '', this.firstName = '', this.lastName = '', this.phoneNumber = '', this.abnNumber = '', this.businessName = '', this.licenseNumber = '', this.pickupDate = '', this.dateOfBirth = '', this.pickupAddress = '', this.residentialAddress = '', this.samePickupAddress = true, this.isDrivable = true, this.isAccidental = false, this.isWovi = false, this.isUnderFinance = false, this.price = '', this.paymentMethod = 'Cash', this.note = '', this.ownerSignaturePath, this.buyerSignaturePath, this.termsAgreed = true, this.errorMessage, this.successMessage});
  

@override@JsonKey() final  int currentStep;
@override@JsonKey() final  bool isLoadingBrands;
@override@JsonKey() final  bool isLoadingModels;
@override@JsonKey() final  bool isLoadingLookup;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  List<BrandModel> brands;
@override@JsonKey() final  List<VehicleModelOption> models;
// Step 1: Technical specs
@override final  int? selectedBrandId;
@override final  int? selectedModelId;
@override@JsonKey() final  String registrationNumber;
@override@JsonKey() final  String registrationState;
@override@JsonKey() final  String vinNumber;
@override@JsonKey() final  String year;
@override@JsonKey() final  String engineSize;
@override@JsonKey() final  String engineNumber;
@override@JsonKey() final  String transmission;
@override@JsonKey() final  String bodyType;
@override@JsonKey() final  String variant;
@override@JsonKey() final  String built;
@override@JsonKey() final  String odometer;
// Step 2: Seller & Pickup
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String abnNumber;
@override@JsonKey() final  String businessName;
@override@JsonKey() final  String licenseNumber;
@override@JsonKey() final  String pickupDate;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  String pickupAddress;
@override@JsonKey() final  String residentialAddress;
@override@JsonKey() final  bool samePickupAddress;
// Step 3: Condition & Signatures
@override@JsonKey() final  bool isDrivable;
@override@JsonKey() final  bool isAccidental;
@override@JsonKey() final  bool isWovi;
@override@JsonKey() final  bool isUnderFinance;
@override@JsonKey() final  String price;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  String note;
@override final  String? ownerSignaturePath;
@override final  String? buyerSignaturePath;
@override@JsonKey() final  bool termsAgreed;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of VehicleWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleWizardStateCopyWith<_VehicleWizardState> get copyWith => __$VehicleWizardStateCopyWithImpl<_VehicleWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleWizardState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isLoadingBrands, isLoadingBrands) || other.isLoadingBrands == isLoadingBrands)&&(identical(other.isLoadingModels, isLoadingModels) || other.isLoadingModels == isLoadingModels)&&(identical(other.isLoadingLookup, isLoadingLookup) || other.isLoadingLookup == isLoadingLookup)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.brands, brands)&&const DeepCollectionEquality().equals(other.models, models)&&(identical(other.selectedBrandId, selectedBrandId) || other.selectedBrandId == selectedBrandId)&&(identical(other.selectedModelId, selectedModelId) || other.selectedModelId == selectedModelId)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.registrationState, registrationState) || other.registrationState == registrationState)&&(identical(other.vinNumber, vinNumber) || other.vinNumber == vinNumber)&&(identical(other.year, year) || other.year == year)&&(identical(other.engineSize, engineSize) || other.engineSize == engineSize)&&(identical(other.engineNumber, engineNumber) || other.engineNumber == engineNumber)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.built, built) || other.built == built)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.abnNumber, abnNumber) || other.abnNumber == abnNumber)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.residentialAddress, residentialAddress) || other.residentialAddress == residentialAddress)&&(identical(other.samePickupAddress, samePickupAddress) || other.samePickupAddress == samePickupAddress)&&(identical(other.isDrivable, isDrivable) || other.isDrivable == isDrivable)&&(identical(other.isAccidental, isAccidental) || other.isAccidental == isAccidental)&&(identical(other.isWovi, isWovi) || other.isWovi == isWovi)&&(identical(other.isUnderFinance, isUnderFinance) || other.isUnderFinance == isUnderFinance)&&(identical(other.price, price) || other.price == price)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.note, note) || other.note == note)&&(identical(other.ownerSignaturePath, ownerSignaturePath) || other.ownerSignaturePath == ownerSignaturePath)&&(identical(other.buyerSignaturePath, buyerSignaturePath) || other.buyerSignaturePath == buyerSignaturePath)&&(identical(other.termsAgreed, termsAgreed) || other.termsAgreed == termsAgreed)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,isLoadingBrands,isLoadingModels,isLoadingLookup,isSubmitting,const DeepCollectionEquality().hash(brands),const DeepCollectionEquality().hash(models),selectedBrandId,selectedModelId,registrationNumber,registrationState,vinNumber,year,engineSize,engineNumber,transmission,bodyType,variant,built,odometer,firstName,lastName,phoneNumber,abnNumber,businessName,licenseNumber,pickupDate,dateOfBirth,pickupAddress,residentialAddress,samePickupAddress,isDrivable,isAccidental,isWovi,isUnderFinance,price,paymentMethod,note,ownerSignaturePath,buyerSignaturePath,termsAgreed,errorMessage,successMessage]);

@override
String toString() {
  return 'VehicleWizardState(currentStep: $currentStep, isLoadingBrands: $isLoadingBrands, isLoadingModels: $isLoadingModels, isLoadingLookup: $isLoadingLookup, isSubmitting: $isSubmitting, brands: $brands, models: $models, selectedBrandId: $selectedBrandId, selectedModelId: $selectedModelId, registrationNumber: $registrationNumber, registrationState: $registrationState, vinNumber: $vinNumber, year: $year, engineSize: $engineSize, engineNumber: $engineNumber, transmission: $transmission, bodyType: $bodyType, variant: $variant, built: $built, odometer: $odometer, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, abnNumber: $abnNumber, businessName: $businessName, licenseNumber: $licenseNumber, pickupDate: $pickupDate, dateOfBirth: $dateOfBirth, pickupAddress: $pickupAddress, residentialAddress: $residentialAddress, samePickupAddress: $samePickupAddress, isDrivable: $isDrivable, isAccidental: $isAccidental, isWovi: $isWovi, isUnderFinance: $isUnderFinance, price: $price, paymentMethod: $paymentMethod, note: $note, ownerSignaturePath: $ownerSignaturePath, buyerSignaturePath: $buyerSignaturePath, termsAgreed: $termsAgreed, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$VehicleWizardStateCopyWith<$Res> implements $VehicleWizardStateCopyWith<$Res> {
  factory _$VehicleWizardStateCopyWith(_VehicleWizardState value, $Res Function(_VehicleWizardState) _then) = __$VehicleWizardStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, bool isLoadingBrands, bool isLoadingModels, bool isLoadingLookup, bool isSubmitting, List<BrandModel> brands, List<VehicleModelOption> models, int? selectedBrandId, int? selectedModelId, String registrationNumber, String registrationState, String vinNumber, String year, String engineSize, String engineNumber, String transmission, String bodyType, String variant, String built, String odometer, String firstName, String lastName, String phoneNumber, String abnNumber, String businessName, String licenseNumber, String pickupDate, String dateOfBirth, String pickupAddress, String residentialAddress, bool samePickupAddress, bool isDrivable, bool isAccidental, bool isWovi, bool isUnderFinance, String price, String paymentMethod, String note, String? ownerSignaturePath, String? buyerSignaturePath, bool termsAgreed, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$VehicleWizardStateCopyWithImpl<$Res>
    implements _$VehicleWizardStateCopyWith<$Res> {
  __$VehicleWizardStateCopyWithImpl(this._self, this._then);

  final _VehicleWizardState _self;
  final $Res Function(_VehicleWizardState) _then;

/// Create a copy of VehicleWizardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? isLoadingBrands = null,Object? isLoadingModels = null,Object? isLoadingLookup = null,Object? isSubmitting = null,Object? brands = null,Object? models = null,Object? selectedBrandId = freezed,Object? selectedModelId = freezed,Object? registrationNumber = null,Object? registrationState = null,Object? vinNumber = null,Object? year = null,Object? engineSize = null,Object? engineNumber = null,Object? transmission = null,Object? bodyType = null,Object? variant = null,Object? built = null,Object? odometer = null,Object? firstName = null,Object? lastName = null,Object? phoneNumber = null,Object? abnNumber = null,Object? businessName = null,Object? licenseNumber = null,Object? pickupDate = null,Object? dateOfBirth = null,Object? pickupAddress = null,Object? residentialAddress = null,Object? samePickupAddress = null,Object? isDrivable = null,Object? isAccidental = null,Object? isWovi = null,Object? isUnderFinance = null,Object? price = null,Object? paymentMethod = null,Object? note = null,Object? ownerSignaturePath = freezed,Object? buyerSignaturePath = freezed,Object? termsAgreed = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_VehicleWizardState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,isLoadingBrands: null == isLoadingBrands ? _self.isLoadingBrands : isLoadingBrands // ignore: cast_nullable_to_non_nullable
as bool,isLoadingModels: null == isLoadingModels ? _self.isLoadingModels : isLoadingModels // ignore: cast_nullable_to_non_nullable
as bool,isLoadingLookup: null == isLoadingLookup ? _self.isLoadingLookup : isLoadingLookup // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<BrandModel>,models: null == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<VehicleModelOption>,selectedBrandId: freezed == selectedBrandId ? _self.selectedBrandId : selectedBrandId // ignore: cast_nullable_to_non_nullable
as int?,selectedModelId: freezed == selectedModelId ? _self.selectedModelId : selectedModelId // ignore: cast_nullable_to_non_nullable
as int?,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,registrationState: null == registrationState ? _self.registrationState : registrationState // ignore: cast_nullable_to_non_nullable
as String,vinNumber: null == vinNumber ? _self.vinNumber : vinNumber // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,engineSize: null == engineSize ? _self.engineSize : engineSize // ignore: cast_nullable_to_non_nullable
as String,engineNumber: null == engineNumber ? _self.engineNumber : engineNumber // ignore: cast_nullable_to_non_nullable
as String,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,bodyType: null == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,built: null == built ? _self.built : built // ignore: cast_nullable_to_non_nullable
as String,odometer: null == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,abnNumber: null == abnNumber ? _self.abnNumber : abnNumber // ignore: cast_nullable_to_non_nullable
as String,businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,licenseNumber: null == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String,pickupDate: null == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String,residentialAddress: null == residentialAddress ? _self.residentialAddress : residentialAddress // ignore: cast_nullable_to_non_nullable
as String,samePickupAddress: null == samePickupAddress ? _self.samePickupAddress : samePickupAddress // ignore: cast_nullable_to_non_nullable
as bool,isDrivable: null == isDrivable ? _self.isDrivable : isDrivable // ignore: cast_nullable_to_non_nullable
as bool,isAccidental: null == isAccidental ? _self.isAccidental : isAccidental // ignore: cast_nullable_to_non_nullable
as bool,isWovi: null == isWovi ? _self.isWovi : isWovi // ignore: cast_nullable_to_non_nullable
as bool,isUnderFinance: null == isUnderFinance ? _self.isUnderFinance : isUnderFinance // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,ownerSignaturePath: freezed == ownerSignaturePath ? _self.ownerSignaturePath : ownerSignaturePath // ignore: cast_nullable_to_non_nullable
as String?,buyerSignaturePath: freezed == buyerSignaturePath ? _self.buyerSignaturePath : buyerSignaturePath // ignore: cast_nullable_to_non_nullable
as String?,termsAgreed: null == termsAgreed ? _self.termsAgreed : termsAgreed // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
