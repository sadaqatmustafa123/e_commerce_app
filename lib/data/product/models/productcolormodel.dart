
import 'package:json_annotation/json_annotation.dart';
part 'productcolormodel.g.dart';

@JsonSerializable()
class ProductColorModel {
ProductColorModel();

factory ProductColorModel.fromJson(Map<String, dynamic> json) => _$ProductColorModelFromJson(json);
Map<String, dynamic> toJson() => _$ProductColorModelToJson(this);
}
    