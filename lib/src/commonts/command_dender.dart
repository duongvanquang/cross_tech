import '../constances/database_key.dart';
import 'g.dart';
import 'mini_app_mem_cache.dart';

class CommandSender {
  static int receivedTimeout = JSCommand.defaultReceivedTimeOut;

  /// A func request pick image.
  ///
  /// [source] The source of pick image:
  /// [camera] is show camera and take picture from camera.
  /// [face] is show camera face detection
  /// [document] show camera document
  /// [gallery] show gallery
  ///
  /// Return a base64 image. if base64 is empty, there is an error during image pick.
  static Future<String?> pickImage(
      {ImageSource source = ImageSource.camera}) async {
    final String src;
    switch (source) {
      case ImageSource.cameraDocument:
        src = JSCommand.cameraDocumentCommand;
        break;
      case ImageSource.faceDetection:
        src = JSCommand.cameraFaceDetectCommand;
        break;
      case ImageSource.gallery:
        src = JSCommand.galleryCommand;
        break;
      default:
        src = JSCommand.cameraCommand;
        break;
    }
    final result =
        await JSBridge.instance.sendRequest([JSCommand.pickImageCommand, src])
            as Map<String, dynamic>?;
    if (result != null) {
      return result[JSKey.base64];
    }
    return null;
  }

  /// A func request token data
  ///
  ///[isNewestToken] 'true' for case need get new token. This value default is false
  /// Return a optional Map<String, String> token data
  static Future<Map<String, dynamic>?> getToken(
      {bool isNewestToken = false}) async {
    final result = await JSBridge.instance.sendRequest(
        [JSCommand.requestTokenCommand, isNewestToken],
        receivedTimeOut: receivedTimeout) as Map<String, dynamic>?;
    if (result != null) {
      MiniAppMemCache.jwtToken = result[JSKey.accessToken] as String? ?? '';
      MiniAppMemCache.jwtRefreshToken =
          result[JSKey.refreshToken] as String? ?? '';
      return result;
    }
    MiniAppMemCache.jwtToken = '';
    MiniAppMemCache.jwtRefreshToken = '';
    return null;
  }

  /// A func request configuration data
  ///
  /// Return a optional Map<String, String> data from host app
  static Future<Map<String, dynamic>?> getConfig() async {
    final result = await JSBridge.instance.sendRequest(
        [JSCommand.requestConfigurationCommand],
        receivedTimeOut: receivedTimeout) as Map<String, dynamic>?;
    if (result != null) {
      MiniAppMemCache.env = result[JSKey.env] as String? ?? '';
      MiniAppMemCache.clientId = result[JSKey.clientId] as String? ?? '';
      MiniAppMemCache.username = result[JSKey.username] as String? ?? '';
      MiniAppMemCache.producerCode =
          result[JSKey.producerCode] as String? ?? '';
      MiniAppMemCache.channel = result[JSKey.channel] as String? ?? '';
      MiniAppMemCache.xFunctionKey =
          result[JSKey.xFunctionKey] as String? ?? '';
      return result;
    }
    return null;
  }

  /// A func request local contacts data
  ///
  /// Return a optional Map<String, String> data contacts from host app
  // static Future<List<ContactItemModel>?> getContacts() async {
  //   final result = await JSBridge.instance
  //       .sendRequest([JSCommand.contactsCommand]) as List<dynamic>?;

  //   if (result != null) {
  //     var contacts = result.map((e) => ContactItemModel.fromJson(e)).toList();
  //     return contacts;
  //   }
  //   return null;
  // }

  /// A func request show PDF viewer
  ///
  /// [base64] base64 data of file pdf
  static Future<void> showPdf(String base64) async {
    await JSBridge.instance.sendRequest([JSCommand.pdfViewerCommand, base64],
        receivedTimeOut: receivedTimeout);
  }

  /// A func request call phone
  ///
  /// [phoneNumber] phone number
  /// Return a Map<String, dynamic> data phone call. With the key [JSKey.phoneState] and [JSKey.phoneCallDuration]
  /// [JSKey.phoneState] a String value phone state. Include values like: CALL_ENDED, PERMISSION_NOT_GRANTED, PHONE_CALL_ERROR
  /// [JSKey.phoneCallDuration] a int value phone call duration.
  static Future<Map<String, dynamic>> call(String phoneNumber) async {
    return await JSBridge.instance
            .sendRequest([JSCommand.callerCommand, phoneNumber])
        as Map<String, dynamic>;
  }

  /// A func request dismiss loading
  ///
  static Future<void> dismissLoading() async {
    await JSBridge.instance
        .sendRequest([JSCommand.dismissLoading], receivedTimeOut: 200);
  }

  /// A func make an insurance profile
  ///
  ///[data] A contact data json encoded
  ///[mode] Insurance profile mode
  static Future<void> makeInsuranceProfile(
      String data, InsuranceProfileMode mode) async {
    await JSBridge.instance.sendRequest(
        [JSCommand.insuranceProfile, data, mode.value],
        receivedTimeOut: 200);
  }

  /// A func show native input control
  /// type = 0 => free text
  /// type = 1 => email
  /// type = 2 => phone number
  ///
  static Future<String?> showNativeControl(
      int type,
      String title,
      String value,
      String defaultValue,
      String placeholder,
      int maxLine,
      int maxLength,
      // List<RegexItemModel> expressions,
      bool isShowCounter,
      String unitText,
      String errorInvalid) async {
    final result = await JSBridge.instance.sendRequest([
      '${JSCommand.showControlCommand}${JSConstants.databaseSeparator}$type',
      type,
      title,
      value,
      defaultValue,
      placeholder,
      maxLine,
      maxLength,
      // jsonEncode(expressions),
      isShowCounter,
      unitText,
      errorInvalid
    ]) as String?;

    return result;
  }

  /// A func request reload web
  ///
  static Future<void> reloadWeb() async {
    await JSBridge.instance
        .sendRequest([JSCommand.reloadWebCommand], receivedTimeOut: 200);
  }
}
