/* ===================================================================
** Copyright (c) 2015 Qualcomm Technologies, Inc.
** All Rights Reserved.
** Confidential and Proprietary - Qualcomm Technologies, Inc.
**
** FILE: rotv_service.c
** DESC: sensor language - slang - sam rotation vector service support
** Revision History
** 11-09-2015       df      Fix static analysis errors
** ================================================================ */
#include "sam_common.h"

#include "sensor1.h"
#include "sns_smgr_common_v01.h"
#include "sns_sam_rotation_vector_v01.h"

#include <stdio.h>      // sprintf

void RotvSetReq( request *req_msg, const token *t_keyvalue)
{
    void *body = req_msg->payload;
    int32_t msg_id = req_msg->header.msg_id;

    char *fieldname = t_keyvalue->pSymbol;
    if ( fieldname == NULL) {
        RTErrorMsg( "RotvSetReq: pSymbol == NULL\n");
        return;
    }

    if ( msg_id == SNS_SAM_ROTATION_VECTOR_ENABLE_REQ_V01) {
        sns_sam_rotation_vector_enable_req_msg_v01 *payload = body;
        if ( strcasecmp( fieldname, get_literal( REPORT_PERIOD)) == 0) {
            if ( t_keyvalue->datatype == INTEGER) {
                uint32_t value = (int)( t_keyvalue->data.i * 65536);                     // convert to Q16
                payload->report_period = value;
            }
            else if ( t_keyvalue->datatype == FLOAT) {
                uint32_t value = (int)( t_keyvalue->data.d * 65536);                     // convert to Q16
                payload->report_period = value;
            }
            else {
                ErrReasonForField( BAD_VALUE, fieldname);
            }
        }
        else if ( strcasecmp( fieldname, get_literal( SAMPLERATE)) == 0) {
            if ( t_keyvalue->datatype == INTEGER) {
                payload->sample_rate_valid = 1;
                uint32_t value = (int)( t_keyvalue->data.i * 65536);                     // convert to Q16
                payload->sample_rate = value;
            }
            else if ( t_keyvalue->datatype == FLOAT) {
                payload->sample_rate_valid = 1;
                uint32_t value = (int)( t_keyvalue->data.d * 65536);                     // convert to Q16
                payload->sample_rate = value;
            }
            else {
                ErrReasonForField( BAD_VALUE, fieldname);
            }
        }
        else if ( strcasecmp( fieldname, get_literal( COORDSYS)) == 0) {
            if ( t_keyvalue->datatype == INTEGER) {
                payload->coordinate_sys_valid = 1;
                uint8_t value = t_keyvalue->data.i;
                payload->coordinate_sys = value;
            }
            else {
                ErrReasonForField( BAD_VALUE, fieldname);
            }
        }
        else if ( strcmp( fieldname, get_literal( NOTIFY_SUSPEND)) == 0) {
            payload->notify_suspend_valid = 1;
            payload->notify_suspend.proc_type = 0;
            payload->notify_suspend.send_indications_during_suspend = t_keyvalue->data.i;
        }
        else {
            InvalidFieldName( fieldname);
        }
    }
    else if ( msg_id == SNS_SAM_ROTATION_VECTOR_DISABLE_REQ_V01) {
        CommonSetManT1InstanceId( body, t_keyvalue);
    }
    else if ( msg_id == SNS_SAM_ROTATION_VECTOR_GET_REPORT_REQ_V01) {
        CommonSetManT1InstanceId( body, t_keyvalue);
    }
    else  if ( msg_id == SNS_SAM_ROTATION_VECTOR_BATCH_REQ_V01) {      // stub note sameas grav
        sns_sam_rotation_vector_batch_req_msg_v01 *payload = body;
        if ( strcmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
            payload->instance_id = (uint8_t)t_keyvalue->data.i;
        }
        else if ( strcasecmp( fieldname, get_literal( BATCH_PERIOD)) == 0) {
            if ( t_keyvalue->datatype == INTEGER) {
                uint32_t value = (int)( t_keyvalue->data.i * 65536);        // convert to Q16
                payload->batch_period = value;
            }
            else if ( t_keyvalue->datatype == FLOAT) {
                uint32_t value = (int)( t_keyvalue->data.d * 65536);        // convert to Q16
                payload->batch_period = value;
            }
            else {
                ErrReasonForField( BAD_VALUE, fieldname);
            }
        }
        else {
            InvalidFieldName( fieldname);
        }
    }
    else  if ( msg_id == SNS_SAM_ROT_VEC_UPDATE_BATCH_PERIOD_REQ_V01) {     // stub note sameas grav
        sns_sam_rot_vec_update_batch_period_req_msg_v01 *payload = body;
        if ( strcmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
            payload->instance_id = (uint8_t)t_keyvalue->data.i;
        }
        else if ( strcasecmp( fieldname, get_literal( BATCH_PERIOD)) == 0) {
            if ( t_keyvalue->datatype == INTEGER) {
                uint32_t value = (int)( t_keyvalue->data.i * 65536);                     // convert to Q16
                payload->active_batch_period = value;
            }
            else if ( t_keyvalue->datatype == FLOAT) {
                uint32_t value = (int)( t_keyvalue->data.d * 65536);                     // convert to Q16
                payload->active_batch_period = value;
            }
            else {
                ErrReasonForField( BAD_VALUE, fieldname);
            }
        }
        else {
            InvalidFieldName( fieldname);
        }
    }
    else {
        // TODO ErrReasonForField( BAD_MESSAGE, fieldname);
    }
}

// ServiceNewReq really GENERIC...
void RotvNewReq( request *req_msg, const array *fieldlist)
{
    if ( fieldlist) {
        int i;
        for ( i = 0; i <= fieldlist->high_water; ) {
            token *t_keyvalue  = ( token *)get_array_element( fieldlist, i++);
            if ( t_keyvalue == NULL) {
                break;
            }
            if ( t_keyvalue->subtype != KEYVALUE) {
                RTErrorMsg( "invalid key => value argument");
                break;
            }
            RotvSetReq( req_msg, t_keyvalue);
        }
    }
}

void RotvGetEnableResp( const respind *p_respind, const token *t_field, token *t_value)
{
    CommonGetOptT3InstanceId( p_respind, t_field, t_value);
}

void RotvGetDisableResp( const respind *p_respind, const token *t_field, token *t_value)
{
    CommonGetOptT3InstanceId( p_respind, t_field, t_value);
}

/**
 * @name  RotvGetResult
 * @brief   get value of fieldname from the
 *          sns_sam_rotation_vector_result_s_v01 structure
 * @param[i] p_result
 * @param[i] fieldname
 * @param[io] t_value   - gets field value
 * @returns 0 == successful, <> 0 == invalid field name
 */
int RotvGetResult( const sns_sam_rotation_vector_result_s_v01 *p_result, const char *fieldname, token *t_value)
{
    int rc = 0;     // successful

    if ( strcasecmp( fieldname, get_literal( ROTV0)) == 0) {
        t_value->data.d = p_result->rotation_vector[0];
        t_value->datatype = FLOAT;
    }
    else if ( strcasecmp( fieldname, get_literal( ROTV1)) == 0) {
        t_value->data.d = p_result->rotation_vector[1];
        t_value->datatype = FLOAT;
    }
    else if ( strcasecmp( fieldname, get_literal( ROTV2)) == 0) {
        t_value->data.d = p_result->rotation_vector[2];
        t_value->datatype = FLOAT;
    }
    else if ( strcasecmp( fieldname, get_literal( ROTV3)) == 0) {
        t_value->data.d = p_result->rotation_vector[3];
        t_value->datatype = FLOAT;
    }
    else if ( strcasecmp( fieldname, get_literal( ACCURACY)) == 0) {
        t_value->data.i = p_result->accuracy;
        t_value->datatype = INTEGER;
    }
    else if ( strcasecmp( fieldname, get_literal( COORDSYS)) == 0) {
        t_value->data.i = p_result->coordinate_sys;
        t_value->datatype = INTEGER;
    }
    else {
        rc = 1;       // invalid field name
    }

    return rc;
}

/**
 * @name  RotvGetReportResp
 * @brief   get value of fieldname from the p_respind message
 * @param[i] p_respind
 * @param[i] t_field - KEYVALUE or fieldname SYMBOL
 * @param[io] t_value   - gets field value
 */
void RotvGetReportResp( const respind *p_respind, const token *t_field, token *t_value)
{
    sns_sam_rotation_vector_get_report_resp_msg_v01 *pMsg =
        ( sns_sam_rotation_vector_get_report_resp_msg_v01 *) p_respind->msg_ptr;


    char *fieldname = t_field->pSymbol;

    if ( strcasecmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
        if ( pMsg->instance_id_valid) {
            t_value->data.i = pMsg->instance_id;
            t_value->datatype = INTEGER;
        }
    }
    else if ( strcasecmp( fieldname, get_literal( SSCTS)) == 0) {
        if ( pMsg->timestamp_valid) {
            t_value->data.i = pMsg->timestamp;
            t_value->datatype = INTEGER;
        }
    }
    else {
        sns_sam_rotation_vector_result_s_v01 *p_result = &pMsg->result;
        if ( RotvGetResult( p_result, fieldname, t_value)) {
            BadFieldName( fieldname);
        }
    }
}

/**
 * @name  RotvGetBatchResp
 * @brief   get value of fieldname from the p_respind message
 * @param[i] p_respind
 * @param[i] t_field - KEYVALUE or fieldname SYMBOL
 * @param[io] t_value   - gets field value
 */
void RotvGetBatchResp( const respind *p_respind, const token *t_field, token *t_value)           // sameas GRAV
{
    sns_sam_rotation_vector_batch_resp_msg_v01 *pMsg =
        ( sns_sam_rotation_vector_batch_resp_msg_v01 *) p_respind->msg_ptr;

    char *fieldname = t_field->pSymbol;

    if ( strcasecmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
        if ( pMsg->instance_id_valid) {
            t_value->data.i = pMsg->instance_id;
            t_value->datatype = INTEGER;
        }
    }
    if ( strcasecmp( fieldname, get_literal( MAX_BATCH_SIZE)) == 0) {
        if ( pMsg->max_batch_size_valid) {
            t_value->data.i = pMsg->max_batch_size;
            t_value->datatype = INTEGER;
        }
    }
    else if ( strcasecmp( fieldname, get_literal( SSCTS)) == 0) {
        if ( pMsg->timestamp_valid) {
            t_value->data.i = pMsg->timestamp;
            t_value->datatype = INTEGER;
        }
    }
    else {
        BadFieldName( fieldname);
    }
}

/**
 * @name  RotvGetUpdateBatchPeriodResp
 * @brief   get value of fieldname from the p_respind message
 * @param[i] p_respind
 * @param[i] t_field - KEYVALUE or fieldname SYMBOL
 * @param[io] t_value   - gets field value
 */
void RotvGetUpdateBatchPeriodResp( const respind *p_respind, const token *t_field, token *t_value)   // sameas GRAV
{
    sns_sam_rot_vec_update_batch_period_resp_msg_v01 *pMsg =
        ( sns_sam_rot_vec_update_batch_period_resp_msg_v01 *) p_respind->msg_ptr;

    char *fieldname = t_field->pSymbol;

    if ( strcasecmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
        if ( pMsg->instance_id_valid) {
            t_value->data.i = pMsg->instance_id;
            t_value->datatype = INTEGER;
        }
    }
    else if ( strcasecmp( fieldname, get_literal( SSCTS)) == 0) {
        if ( pMsg->timestamp_valid) {
            t_value->data.i = pMsg->timestamp;
            t_value->datatype = INTEGER;
        }
    }
    else {
        BadFieldName( fieldname);
    }
}

/**
 * @name  RotvGetReportInd
 * @brief   get value of fieldname from the p_respind message
 * @param[i] p_respind
 * @param[i] t_field - KEYVALUE or fieldname SYMBOL
 * @param[io] t_value   - gets field value
 */
void RotvGetReportInd( const respind *p_respind, const token *t_field, token *t_value)
{
    sns_sam_rotation_vector_report_ind_msg_v01 *pMsg =
        ( sns_sam_rotation_vector_report_ind_msg_v01 *) p_respind->msg_ptr;

    char *fieldname = t_field->pSymbol;

    if ( strcasecmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
        t_value->data.i = pMsg->instance_id;
        t_value->datatype = INTEGER;
    }
    else if ( strcasecmp( fieldname, get_literal( SSCTS)) == 0) {
        t_value->data.i = pMsg->timestamp;
        t_value->datatype = INTEGER;
    }
    else {
        sns_sam_rotation_vector_result_s_v01 *p_result = &pMsg->result;
        if ( RotvGetResult( p_result, fieldname, t_value)) {
            BadFieldName( fieldname);
        }
    }
}

/**
 * @name  RotvGetBatchInd
 * @brief   get value of fieldname from the p_respind message
 * @param[i] p_respind
 * @param[i] t_field - KEYVALUE or fieldname SYMBOL
 * @param[io] t_value   - gets field value
 */
void RotvGetBatchInd( const respind *p_respind, const token *t_field, token *t_value)
{
    static uint32_t report_index = 0;

    sns_sam_rotation_vector_batch_ind_msg_v01 *pMsg =
        ( sns_sam_rotation_vector_batch_ind_msg_v01 *) p_respind->msg_ptr;

    char *fieldname = t_field->pSymbol;

    if ( t_field->subtype == KEYVALUE) {
        if ( strcasecmp( fieldname, get_literal( REPORT)) == 0) {
            if ( t_field->data.i >= pMsg->reports_len) {
                RTErrorMsg( get_literal( BAD_INDEX));
            }
            else {
                report_index = t_field->data.i;
            }
//          printf( "RotvGetBatchInd set index %d, ask %ld\n", report_index, t_field->data.i); // debugging
        }
        else {
            BadFieldName( fieldname);
        }
        return;
    }

    if ( strcasecmp( fieldname, get_literal( INSTANCE_ID)) == 0) {
        t_value->data.i = pMsg->instance_id;
        t_value->datatype = INTEGER;
    }
    else if ( strcasecmp( fieldname, get_literal( IND_TYPE)) == 0) {
        if ( pMsg->ind_type_valid) {
            t_value->data.i = pMsg->ind_type;
            t_value->datatype = INTEGER;
        }
    }
    else if ( strcasecmp( fieldname, get_literal( REPORT)) == 0) {
        if ( pMsg->timestamp_offsets_len == pMsg->reports_len) {
            t_value->data.i = pMsg->reports_len;            // return number of reports
            t_value->datatype = INTEGER;
        }
        else {
            RTErrorMsg( get_literal( MALFORMED_PACKET));
        }
    }
    else if ( pMsg->timestamp_offsets_len && pMsg->reports_len ) {
        if ( strcasecmp( fieldname, get_literal( SSCTS)) == 0) {
            uint32_t ssc_ts = pMsg->first_report_timestamp;
            uint32_t i;
            for ( i = 0; i <= report_index; i++) {
                ssc_ts += pMsg->timestamp_offsets[ i];  //  compute ssc_ts for this report
            }
            t_value->data.i = ssc_ts;
            t_value->datatype = INTEGER;
        }
        else {
            sns_sam_rotation_vector_result_s_v01 *p_result = &pMsg->reports[ report_index];
//          printf( "RotvGetBatchInd get index %d, %p, %s\n", report_index, p_result, fieldname);   // debugging
            if ( RotvGetResult( p_result, fieldname, t_value)) {
                BadFieldName( fieldname);
            }
        }
    }
}

/*
 * @name RotvGetter
 * @brief       get field values from the p_respind message
 *
 * @param[i] p_respind
 * @param[i] t_field - KEYVALUE or fieldname SYMBOL
 * @param[io] element
 */
void RotvGetter( const respind *p_respind, const token *t_field, token *t_value)
{

    SetTypes( t_value, VALUE, SCALAR, UNDEFINED);

    uint32_t service_number = p_respind->header.service_number;
    if ( !( service_number == SNS_SAM_ROTATION_VECTOR_SVC_ID_V01)) {
        FatalError( get_literal( BAD_SRVC_NUM));
    }

    uint32_t msg_id = p_respind->header.msg_id;
    uint16_t msg_size = p_respind->header.msg_size;
    sensor1_msg_type_e msg_type = p_respind->msg_type;

    if ( msg_type == SENSOR1_MSG_TYPE_RESP) {
        if ( msg_id == SNS_SAM_ROTATION_VECTOR_ENABLE_RESP_V01) {
            RotvGetEnableResp( p_respind, t_field, t_value);
        }
        else if ( msg_id == SNS_SAM_ROTATION_VECTOR_DISABLE_RESP_V01) {
            RotvGetDisableResp( p_respind, t_field, t_value);
        }
        else if ( msg_id == SNS_SAM_ROTATION_VECTOR_GET_REPORT_RESP_V01) {
            RotvGetReportResp( p_respind, t_field, t_value);
        }
        else if ( msg_id == SNS_SAM_ROTATION_VECTOR_BATCH_RESP_V01) {
            RotvGetBatchResp( p_respind, t_field, t_value);
        }
        else if ( msg_id == SNS_SAM_ROT_VEC_UPDATE_BATCH_PERIOD_RESP_V01) {
            RotvGetUpdateBatchPeriodResp( p_respind, t_field, t_value);
        }
        else if ( msg_id == SNS_SAM_ROT_VEC_GET_ATTRIBUTES_RESP_V01) {     // GENERIC
            CommonGetAttributesResp( p_respind, t_field, t_value);
        }
        else {
            RTErrorMsg( get_literal( BAD_MSG_ID));
        }
    }
    else if ( msg_type == SENSOR1_MSG_TYPE_IND) {
        if ( msg_id == SNS_SAM_ROTATION_VECTOR_REPORT_IND_V01) {
            RotvGetReportInd( p_respind, t_field, t_value);
        }
        else if ( msg_id == SNS_SAM_ROTATION_VECTOR_BATCH_IND_V01) {
            RotvGetBatchInd( p_respind, t_field, t_value);
        }
        else {
            RTErrorMsg( get_literal( BAD_MSG_ID));
        }
    }
}

/**
 * @name RotvInit
 */

void RotvInit( void)
{
    int svc_id = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].name = "rotv";
    service_toc[ svc_id].new_req_func = (new_req)&RotvNewReq;
    service_toc[ svc_id].set_req_func = (set_req)&RotvSetReq;
    service_toc[ svc_id].getter_func  = (get_func)&RotvGetter;

    service_toc[ svc_id].req_msg[ SAM_CANCEL].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_CANCEL].header.msg_id = SNS_SAM_ROTATION_VECTOR_CANCEL_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_CANCEL].header.msg_size = 0;

    service_toc[ svc_id].req_msg[ SAM_VERSION].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_VERSION].header.msg_id = SNS_SAM_ROTATION_VECTOR_VERSION_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_VERSION].header.msg_size = 0;

    service_toc[ svc_id].req_msg[ SAM_ENABLE].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_ENABLE].header.msg_id = SNS_SAM_ROTATION_VECTOR_ENABLE_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_ENABLE].header.msg_size = sizeof(sns_sam_rotation_vector_enable_req_msg_v01);

    service_toc[ svc_id].req_msg[ SAM_DISABLE].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_DISABLE].header.msg_id = SNS_SAM_ROTATION_VECTOR_DISABLE_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_DISABLE].header.msg_size = sizeof(sns_sam_rotation_vector_disable_req_msg_v01);

    service_toc[ svc_id].req_msg[ SAM_GET_REPORT].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_GET_REPORT].header.msg_id = SNS_SAM_ROTATION_VECTOR_GET_REPORT_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_GET_REPORT].header.msg_size = sizeof(sns_sam_rotation_vector_get_report_req_msg_v01);

    service_toc[ svc_id].req_msg[ SAM_BATCH].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_BATCH].header.msg_id = SNS_SAM_ROTATION_VECTOR_BATCH_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_BATCH].header.msg_size = sizeof(sns_sam_rotation_vector_batch_req_msg_v01);

    service_toc[ svc_id].req_msg[ SAM_FLUSH].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_FLUSH].header.msg_id = SNS_SAM_ROT_VEC_UPDATE_BATCH_PERIOD_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_FLUSH].header.msg_size = sizeof(sns_sam_rot_vec_update_batch_period_req_msg_v01);

    service_toc[ svc_id].req_msg[ SAM_ALGO_ATTRIB].header.service_number = SNS_SAM_ROTATION_VECTOR_SVC_ID_V01;
    service_toc[ svc_id].req_msg[ SAM_ALGO_ATTRIB].header.msg_id = SNS_SAM_ROT_VEC_GET_ATTRIBUTES_REQ_V01;
    service_toc[ svc_id].req_msg[ SAM_ALGO_ATTRIB].header.msg_size = 0;
}


