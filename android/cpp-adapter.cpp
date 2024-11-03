#include <jni.h>
#include "mit-geolocation.h"

extern "C"
JNIEXPORT jdouble JNICALL
Java_com_mitgeolocation_MitGeolocationModule_nativeMultiply(JNIEnv *env, jclass type, jdouble a, jdouble b) {
    return mitgeolocation::multiply(a, b);
}
