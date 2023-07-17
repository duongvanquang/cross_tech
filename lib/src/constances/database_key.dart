class JSConstants {
  static const String channelName = 'superAppHandler';
  static const String executeCommandMethod = 'executeCommand';
  static const String databaseSeparator = '/';
}

class JSKey {
  static const String commandId = 'command_id';
  static const String dataKey = 'data';
  static const String resultKey = 'result';
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String base64 = 'base64';
  static const String env = 'environment';
  static const String clientId = 'client_id';
  static const String producerCode = 'producer_code';
  static const String username = 'username';
  static const String channel = 'channel_code';
  static const String phoneState = 'phone_state';
  static const String phoneCallDuration = 'phone_call_duration';
  static const String xFunctionKey = 'x_function_app_party';
}

class JSCommand {
  static const int defaultReceivedTimeOut = 5000;
  static const String pdfViewerCommand = 'show_pdf_viewer_command';
  static const String pickImageCommand = 'request_pick_image_command';
  static const String cameraCommand = 'request_camera_command';
  static const String galleryCommand = 'request_gallery_command';
  static const String cameraDocumentCommand = 'request_camera_document_command';
  static const String cameraFaceDetectCommand =
      'request_camera_face_detect_command';
  static const String requestTokenCommand = 'request_token_data_command';
  static const String changeTitleCommand = 'change_title_command';
  static const String locationCommand = 'request_location_command';
  static const String requestConfigurationCommand =
      'request_get_configuration_command';
  static const String callerCommand = 'request_caller_command';
  static const String contactsCommand = 'request_contacts_command';
  static const String userPreference = 'user_preference_command';
  static const String dismissLoading = 'dismiss_loading_command';
  static const String insuranceProfile = 'make_insurance_profile_command';
  static const String showControlCommand = 'show_control_command';
  static const String reloadWebCommand = 'reload_web_command';
}

class UserPreferenceFuncKey {
  static const String get = 'user_preference_get';
  static const String set = 'user_preference_set';
}

class DBCommand {
  static const String querySqlDatabase = 'request_query_sql_database';
  static const String queryNoSqlDatabase = 'request_query_nosql_database';
  static const String insertCommand = 'insert_command';
  static const String updateCommand = 'update_command';
  static const String deleteCommand = 'delete_command';
  static const String batchInsertCommand = 'batch_insert_command';
  static const String batchDeleteCommand = 'batch_delete_command';
  static const String batchInsertOrUpdateCommand =
      'batch_insert_or_update_command';
  static const String listCommand = 'list_command';
  static const String openDbCommand = 'open_database_command';
  static const String closeDbCommand = 'close_database_command';
  static const String setVersionDbCommand = 'set_version_database_command';
  static const String getVersionDbCommand = 'get_version_database_command';
  static const String execSqlCommand = 'execSql_command';
  static const String execScalarCommand = 'execScalar_command';
}

class SharePreferenceKeys {
  static const String themeMode = 'theme_mode';
}

class ThemeModeData {
  static const String dark = 'Dark';
  static const String light = 'Light';
  static const String system = 'System';
}

class RegexCommon {
  RegexCommon._();
  static const emailRegex =
      r'^([A-Za-z0-9]+[\-\_\.])*[A-Za-z0-9]+@([A-Za-z0-9]+\-)*[A-Za-z0-9]+\.[a-zA-Z]{2,4}$';
  static const phoneRegex = r'^(0)(2)(\d{9})$';
  static const mobileRegex = r'^(0)(3|5|7|8|9)(\d{8})$';
  static const fullNameRegex =
      r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ\s]{0,30}$';
}

class DateTimePattern {
  DateTimePattern._();
  static const dateTimePattern = 'dd/MM/yyyy HH:mm';
  static const datePattern = 'dd/MM/yyyy';
  static const timePattern = 'HH:mm:ss';
}

class ControlErrorCode {
  const ControlErrorCode._();
  static const invalid = 'INVALID';
  static const nullOrEmpty = 'NULL-OR-EMPTY';
}

enum InsuranceProfileMode { offline, online, covid }

extension InsuranceProfileModeExtension on InsuranceProfileMode {
  String get value => ['OFFLINE', 'ONLINE', 'COVID'][index];
}
