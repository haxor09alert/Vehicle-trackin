import 'package:thingsboard_client/thingsboard_client.dart';

// ThingsBoard REST API URL
const thingsBoardApiEndpoint = 'http://localhost:8080';

void main() async {
  try {

    // Create instance of ThingsBoard API Client
    var tbClient = ThingsboardClient(thingsBoardApiEndpoint);

    // Perform login with default Tenant Administrator credentials
    await tbClient.login(LoginRequest('tenant@thingsboard.org', 'tenant'));

    var pageLink = PageLink(10);
    PageData<DeviceInfo> devices;
    do {
        // Fetch tenant devices using current page link
        devices = await tbClient.getDeviceService().getTenantDeviceInfos(pageLink);
        print('devices: $devices');
        pageLink = pageLink.nextPageLink();
    } while (devices.hasNext);

    // Finally perform logout to clear credentials
    await tbClient.logout();
  } catch (e, s) {
    print('Error: $e');
    print('Stack: $s');
  }
}