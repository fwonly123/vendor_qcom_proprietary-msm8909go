/***************************************************************************
* Copyright (c) 2013-2014 Qualcomm Technologies, Inc. All Rights Reserved. *
* Qualcomm Technologies Proprietary and Confidential.                      *
***************************************************************************/
/* Face detection enable */
.enable = 1,
.min_face_adj_type = FD_FACE_ADJ_FIXED,
.min_face_size = 300,
.min_face_size_ratio = 0.1,
.max_face_size = 1000,
.max_num_face_to_detect = 2,
.angle_front = FD_ANGLE_ALL,
.angle_front_bitmask = 0,
.angle_half_profile = FD_ANGLE_NONE,
.angle_half_profile_bitmask = 0,
.angle_full_profile = FD_ANGLE_NONE,
.angle_full_profile_bitmask = 0,
.detection_mode = FD_CHROMATIX_MODE_MOTION_PROGRESS,
.frame_skip = 5,
.enable_smile_detection = 0,
.enable_blink_detection = 0,
.enable_gaze_detection = 0,
.search_density_nontracking = 33,
.search_density_tracking = 33,
.direction = 0,
.refresh_count = 2,
.threshold = 520,
.face_retry_count = 3,
.head_retry_count = 3,
.hold_count = 2,
.lock_faces = 1,
.move_rate_threshold = 8,
.ct_detection_mode = FD_CONTOUR_MODE_EYE,
.stab_enable = 0,
