/*============================================================================
  Copyright (c) 2017 Qualcomm Technologies, Inc.
  All Rights Reserved.
  Confidential and Proprietary - Qualcomm Technologies, Inc.
  ===========================================================================*/

/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class com_qualcomm_qti_sensors_core_sensortest_SensorLowLat */

#ifndef _Included_com_qualcomm_qti_sensors_core_sensortest_SensorLowLat
#define _Included_com_qualcomm_qti_sensors_core_sensortest_SensorLowLat
#ifdef __cplusplus
extern "C" {
#endif
#undef com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_defaultCircBufferSize
#define com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_defaultCircBufferSize 4096L
#undef com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_defaultSamplePeriodUs
#define com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_defaultSamplePeriodUs 1250L
#undef com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_defaultFlags
#define com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_defaultFlags 0L
/*
 * Class:     com_qualcomm_qti_sensors_core_sensortest_SensorLowLat
 * Method:    init
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_init
  (JNIEnv *, jobject, jint);

/*
 * Class:     com_qualcomm_qti_sensors_core_sensortest_SensorLowLat
 * Method:    start
 * Signature: ([JII)V
 */
JNIEXPORT void JNICALL Java_com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_start
  (JNIEnv *, jobject, jlongArray, jint, jint);

/*
 * Class:     com_qualcomm_qti_sensors_core_sensortest_SensorLowLat
 * Method:    stop
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_stop
  (JNIEnv *, jobject);

/*
 * Class:     com_qualcomm_qti_sensors_core_sensortest_SensorLowLat
 * Method:    deinit
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_qualcomm_qti_sensors_core_sensortest_SensorLowLat_deinit
  (JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif
