import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'mit-geolocation' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const MitGeolocation = NativeModules.MitGeolocation
  ? NativeModules.MitGeolocation
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

// Export the actual functions as promises
export function searchAddressByCoord(lat: string, lon: string, token: string): Promise<string> {
  return MitGeolocation.searchAddressByCoord(lat, lon, token);
}

export function searchAddressByName(search: string, token: string): Promise<string> {
  return MitGeolocation.searchAddressByName(search, token);
}

export function searchMapRoute(
  start: string,
  startLat: string,
  startLon: string,
  dest: string,
  destLat: string,
  destLon: string,
  token: string
): Promise<string> {
  return MitGeolocation.searchMapRoute(start, startLat, startLon, dest, destLat, destLon, token);
}
