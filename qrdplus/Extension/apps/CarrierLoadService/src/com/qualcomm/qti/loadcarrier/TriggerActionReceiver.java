/**
 * Copyright (c) 2014-2015 Qualcomm Technologies, Inc.
 * All Rights Reserved.
 * Confidential and Proprietary - Qualcomm Technologies, Inc.
 */

package com.qualcomm.qti.loadcarrier;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;
import android.os.Bundle;


import com.android.internal.os.RegionalizationEnvironment;
import com.android.internal.telephony.TelephonyIntents;

public class TriggerActionReceiver extends BroadcastReceiver {
    private static final String TAG = "TriggerActionReceiver";

    private static final String ACTION_TRIGGER = "com.qualcomm.qti.loadcarrier.trigger";
    private static final String ACTION_PHONE_READY = "com.android.phone.ACTION_PHONE_READY";

    public static final String ACTION_CARRIER_PREFERRED_SIM_SWAPPED =
            "com.qualcomm.qti.loadcarrier.preferred_sim_swapped";
    public static final String ACTION_SET_TRIGGER_PROPERTY =
            "com.qualcomm.qti.carrierconfigure.set.trigger.property";

    public static final String HOST_TRIGGER_Y     = "87444379";
    public static final String HOST_TRIGGER_N     = "87444376";
    public static final String HOST_TRIGGER_VALUE = "874443782583";
    public static final String HOST_TRIGGER_START = "874443778278";
    public static final String HOST_FILE_BASED_Y  = "3453227339";
    public static final String HOST_FILE_BASED_N  = "3453227336";
    public static final String HOST_BLOCK_BASED_Y = "25625227339";
    public static final String HOST_BLOCK_BASED_N = "25625227336";

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        Log.i(TAG, "Receive the action: " + action);

        if (ACTION_TRIGGER.equals(action)) {
            // If the trigger function has been enabled, we will start the service.
            boolean defaultValue = context.getResources().getBoolean(R.bool.trigger_enabled);
            String currentCarrierName = Utils.getCurrentCarriersName(Utils.getCurrentCarriers());
            if (Utils.getValue(Utils.PROP_KEY_TRIGGER, defaultValue)
                    && (Utils.getValue(Utils.PROP_KEY_TRIGGER_FIRST_INSERT, false) == false
                            || (Utils.getValue(Utils.PROP_KEY_TRIGGER_FIRST_INSERT, false)
                                    && currentCarrierName.equals("Default")))
                    && Settings.Global.getInt(context.getContentResolver(),
                            Settings.Global.AIRPLANE_MODE_ON, 0) == 0) {
                if (Utils.DEBUG) Log.i(TAG, "Start the trigger service.");
                context.startService(new Intent(context, TriggerService.class));
            }
        } else if (ACTION_CARRIER_PREFERRED_SIM_SWAPPED.equals(action)) {
            boolean defaultValue = context.getResources().getBoolean(R.bool.trigger_enabled);
            if (Utils.getValue(Utils.PROP_KEY_TRIGGER, defaultValue)
                    && Settings.Global.getInt(context.getContentResolver(),
                            Settings.Global.AIRPLANE_MODE_ON, 0) == 0) {
                int targetSlot = intent.getIntExtra(Utils.INTENT_CARRIER_TARGET_SLOT,
                        Utils.INVALID_SLOT_ID);
                Intent i = new Intent(context, TriggerService.class);
                if (targetSlot != Utils.INVALID_SLOT_ID) {
                    i.putExtra(Utils.INTENT_CARRIER_TARGET_SLOT, targetSlot);
                }
                if (Utils.DEBUG) Log.i(TAG, "Start the trigger service. targetSlot=" + targetSlot);
                context.startService(i);
            }
        } else if(ACTION_SET_TRIGGER_PROPERTY.equals(action)){
            Bundle bundle = intent.getExtras();
            String value = bundle.getString(Utils.ENABLE_TRIGGER_NAME);
            if (Utils.DEBUG) Log.i(TAG,".....get intent......to set prop ="+value);
            Utils.setValue(Utils.PROP_KEY_TRIGGER, value);
        }else if (TelephonyIntents.SECRET_CODE_ACTION.equals(action)) {
            Uri uri = intent.getData();
            String host = uri != null ? uri.getHost() : null;
            if (HOST_TRIGGER_Y.equals(host)) {
                // Enable the trigger function.
                Utils.setValue(Utils.PROP_KEY_TRIGGER, String.valueOf(true));
                Toast.makeText(context, R.string.toast_trigger_enabled, Toast.LENGTH_LONG).show();
            } else if (HOST_TRIGGER_N.equals(host)) {
                // Disable the trigger function.
                Utils.setValue(Utils.PROP_KEY_TRIGGER, String.valueOf(false));
                Toast.makeText(context, R.string.toast_trigger_disabled, Toast.LENGTH_LONG).show();
            } else if (HOST_TRIGGER_VALUE.equals(host)) {
                // Start the activity to edit the values used for trigger.
                Intent i = new Intent(Intent.ACTION_EDIT);
                i.setClass(context, EditTriggerValuesActivity.class);
                i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(i);
            } else if (HOST_TRIGGER_START.equals(host)) {
                // As used the secret code to start trigger, do not check the prop value.
                context.startService(new Intent(context, TriggerService.class));
                Toast.makeText(context, R.string.toast_trigger_start, Toast.LENGTH_LONG).show();
            } else if (!Utils.isPresetMode() && HOST_FILE_BASED_Y.equals(host)) {
                // Enable the file-based carrier switch.
                Utils.setValue(Utils.PROP_KEY_FILE_BASED_ENABLED, String.valueOf(true));
                Toast.makeText(context, R.string.toast_filebased_switch_enabled,
                        Toast.LENGTH_LONG).show();
            } else if (!Utils.isPresetMode() && HOST_FILE_BASED_N.equals(host)) {
                // Disable the file-based carrier switch, then block-based switch is enabled.
                Utils.setValue(Utils.PROP_KEY_FILE_BASED_ENABLED, String.valueOf(false));
                Toast.makeText(context, R.string.toast_filebased_switch_disabled,
                        Toast.LENGTH_LONG).show();
            } else if (HOST_BLOCK_BASED_Y.equals(host)) {
                Utils.setValue(Utils.PROP_KEY_BLOCK_BASED_ENABLED, String.valueOf(true));
                Toast.makeText(context, R.string.toast_blockbased_switch_enabled,
                        Toast.LENGTH_LONG).show();
            } else if (HOST_BLOCK_BASED_N.equals(host)) {
                Utils.setValue(Utils.PROP_KEY_BLOCK_BASED_ENABLED, String.valueOf(false));
                Toast.makeText(context, R.string.toast_blockbased_switch_disabled,
                        Toast.LENGTH_LONG).show();
            }
        }
    }

}
