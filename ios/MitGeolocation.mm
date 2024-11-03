#import "MitGeolocation.h"
#import "libmit_geolocation.h" // Adjust the import to match the actual library name

@implementation MitGeolocation

RCT_EXPORT_MODULE();

// Expose searchAddressByCoord to React Native
RCT_EXPORT_METHOD(searchAddressByCoord:(NSString *)lat
                              lon:(NSString *)lon
                            token:(NSString *)token
                          resolver:(RCTPromiseResolveBlock)resolve
                          rejecter:(RCTPromiseRejectBlock)reject) {
    @try {
        NSString *appId = [[NSBundle mainBundle] bundleIdentifier];
        NSString *result = [self searchAddressByCoord:lat lon:lon appId:appId token:token];
        resolve(result);
    } @catch (NSException *exception) {
        reject(@"search_error", @"Could not perform search", nil);
    }
}

// Expose searchAddressByName to React Native
RCT_EXPORT_METHOD(searchAddressByName:(NSString *)search
                             token:(NSString *)token
                           resolver:(RCTPromiseResolveBlock)resolve
                           rejecter:(RCTPromiseRejectBlock)reject) {
    @try {
        NSString *appId = [[NSBundle mainBundle] bundleIdentifier];
        NSString *result = [self searchAddressByName:search lat:@"" lon:@"" appId:appId token:token];
        resolve(result);
    } @catch (NSException *exception) {
        reject(@"search_error", @"Could not perform search", nil);
    }
}

// Expose searchMapRoute to React Native
RCT_EXPORT_METHOD(searchMapRoute:(NSString *)start
                        startLat:(NSString *)startLat
                        startLon:(NSString *)startLon
                            dest:(NSString *)dest
                         destLat:(NSString *)destLat
                         destLon:(NSString *)destLon
                           token:(NSString *)token
                         resolver:(RCTPromiseResolveBlock)resolve
                         rejecter:(RCTPromiseRejectBlock)reject) {
    @try {
        NSString *appId = [[NSBundle mainBundle] bundleIdentifier];
        NSString *result = [self searchMapRoute:start startLat:startLat startLon:startLon dest:dest destLat:destLat destLon:destLon appId:appId token:token];
        resolve(result);
    } @catch (NSException *exception) {
        reject(@"route_error", @"Could not calculate route", nil);
    }
}

// Internal methods that call Rust functions from the .a library
- (NSString *)searchAddressByCoord:(NSString *)lat lon:(NSString *)lon appId:(NSString *)appId token:(NSString *)token {
    const char *result = search_address_by_coord([lat UTF8String], [lon UTF8String], [appId UTF8String], [token UTF8String]);
    return [NSString stringWithUTF8String:result];
}

- (NSString *)searchAddressByName:(NSString *)search lat:(NSString *)lat lon:(NSString *)lon appId:(NSString *)appId token:(NSString *)token {
    const char *result = search_address_by_name([search UTF8String], [lat UTF8String], [lon UTF8String], [appId UTF8String], [token UTF8String]);
    return [NSString stringWithUTF8String:result];
}

- (NSString *)searchMapRoute:(NSString *)start startLat:(NSString *)startLat startLon:(NSString *)startLon dest:(NSString *)dest destLat:(NSString *)destLat destLon:(NSString *)destLon appId:(NSString *)appId token:(NSString *)token {
    const char *result = search_map_route([start UTF8String], [startLat UTF8String], [startLon UTF8String], [dest UTF8String], [destLat UTF8String], [destLon UTF8String], [appId UTF8String], [token UTF8String]);
    return [NSString stringWithUTF8String:result];
}

@end
