#import <React/RCTBridgeModule.h>

@interface MitGeolocation : NSObject <RCTBridgeModule>

// Declare methods that match your Rust library's functions
- (NSString *)searchAddressByCoord:(NSString *)lat
                               lon:(NSString *)lon
                             appId:(NSString *)appId
                             token:(NSString *)token;

- (NSString *)searchAddressByName:(NSString *)search
                              lat:(NSString *)lat
                              lon:(NSString *)lon
                            appId:(NSString *)appId
                            token:(NSString *)token;

- (NSString *)searchMapRoute:(NSString *)start
                    startLat:(NSString *)startLat
                    startLon:(NSString *)startLon
                        dest:(NSString *)dest
                     destLat:(NSString *)destLat
                     destLon:(NSString *)destLon
                       appId:(NSString *)appId
                       token:(NSString *)token;

@end
