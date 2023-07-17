import 'package:cross_tech/src/commonts/rest_utils.dart';

abstract class BaseService {
  late RestUtils rest;
  BaseService(RestUtils restUtils) {
    rest = restUtils;
  }
}
