#ifndef LIBMIT_GEOLOCATION_H
#define LIBMIT_GEOLOCATION_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>  // For standard integer types
#include <stddef.h>  // For size_t

// Function to search address by coordinates
const char* search_address_by_coord(const char* lat, const char* lon, const char* appid, const char* token);

// Function to search address by name
const char* search_address_by_name(const char* search, const char* lat, const char* lon, const char* appid, const char* token);

// Function to search map route between two points
const char* search_map_route(const char* start, const char* startLat, const char* startLon, const char* dest, const char* destLat, const char* destLon, const char* appid, const char* token);

#ifdef __cplusplus
}
#endif

#endif // LIBMIT_GEOLOCATION_H
