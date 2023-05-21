import 'package:hackathon_front/global/index.dart';
import 'package:url_launcher/url_launcher.dart';

final _log = GlobalObjects.logger;

Future<void> launchInBrowser(String url) async {
  _log.d('启动浏览器打开页面：$url');
  final uri = Uri.tryParse(url);
  if (uri == null) {
    throw UnsupportedError('Cannot load $url');
  }
  launchUrl(uri, mode: LaunchMode.externalApplication);
}
