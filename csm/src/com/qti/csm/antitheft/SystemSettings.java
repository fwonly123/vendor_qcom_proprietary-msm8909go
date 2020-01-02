/*
 * Copyright (c) 2016 Qualcomm Technologies, Inc.
 * All Rights Reserved.
 * Confidential and Proprietary - Qualcomm Technologies, Inc.
 */
package com.qti.csm.antitheft;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.KeyEvent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;

import com.qti.csm.R;

public class SystemSettings extends Activity implements CompoundButton.OnCheckedChangeListener, TextView.OnEditorActionListener {///

    private static DevicePolicyManager devicePolicyManager;
    private static ComponentName deviceAdmin;
    private ToggleButton toggleButton;

    static final int ACTIVATION_REQUEST = 47;

    @Override
    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
        if (actionId == EditorInfo.IME_ACTION_DONE) {
            hideKeyboard((EditText) v);
            String value = v.getText().toString();
            switch (v.getId()) {
                case R.id.confirmationCode:
                    if (Common.LOG) Log.d(Common.TAG, "code clicked.");
                    if (checkPasswordStrength(value) == false) {
                        Toast.makeText(this, R.string.text_wrong_confirmationCode, Toast.LENGTH_SHORT).show();
                        value = Configuration.getConfirmationCode(this);
                        v.setText(value);
                    } else {
                        Configuration.setConfirmationCode(this, value);
                    }
                    break;
                case R.id.friendNumber:
                    if (Common.LOG) Log.d(Common.TAG, "Number clicked.");
                    Configuration.setFriendNumber(this, value);
                    TelephonyManager telephonyMgr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                    String newSubscriberId = telephonyMgr.getSubscriberId();
                    Configuration.setSubscriberId(this, newSubscriberId);
                    break;
                default:
                    Log.e(Common.TAG, "Unknown button");
            }

            return true;
        }
        return false;
    }

    @Override
    public void onCheckedChanged(CompoundButton button, boolean isChecked) {
        if (button.getId() == R.id.toggle_device_admin) {
            if (isChecked) {
                activateDeviceManager();
            } else {
                if(isDeviceAdminActive()) {
                    devicePolicyManager.removeActiveAdmin(deviceAdmin);
                }
            }
            if (Common.LOG) Log.d(Common.TAG, "click: " + isChecked);
        } else if (button.getId() == R.id.switch_permission) {
            if (Common.LOG) Log.d(Common.TAG, "Perm: " + isChecked);
            if (!isChecked) {
                Configuration.setPermission(this, false);
                startMainActivity();
            }
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.settings);
        updateConfig();
        devicePolicyManager = (DevicePolicyManager) getSystemService(Context.DEVICE_POLICY_SERVICE);
        deviceAdmin = new ComponentName(this, SystemManager.class);
        toggleButton = (ToggleButton) super
                .findViewById(R.id.toggle_device_admin);
        toggleButton.setOnCheckedChangeListener(this);
        setToggleButton();
        Switch permissionSwitch = (Switch) findViewById(R.id.switch_permission);
        switchConfig(permissionSwitch);
    }

    @Override
    protected void onResume() {
        super.onResume();
        setToggleButton();
    }

    private void hideKeyboard(EditText editText) {
        InputMethodManager imm= (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
        imm.hideSoftInputFromWindow(editText.getWindowToken(), 0);
    }

    private void activateDeviceManager() {
        Intent intent = new Intent(
                DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
        intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN,
                deviceAdmin);
        intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION,
                "Enable Anti Theft Demo.");
        startActivityForResult(intent, ACTIVATION_REQUEST);
    }

    private void updateConfig() {
        EditText confrimationCodeEditText = (EditText) this.findViewById(R.id.confirmationCode);
        String confirmationCode = Configuration.getConfirmationCode(this);
        confrimationCodeEditText.setOnEditorActionListener(this);
        if (confirmationCode != null) {
            confrimationCodeEditText.setText(confirmationCode);
        }

        EditText friendNumberEditText = (EditText) this.findViewById(R.id.friendNumber);
        String friendNumber = Configuration.getFriendNumber(this);
        friendNumberEditText.setOnEditorActionListener(this);
        if (friendNumber != null) {
            friendNumberEditText.setText(friendNumber);
        }
    }

    private void setToggleButton() {
        toggleButton.setChecked(isDeviceAdminActive());
    }

    private void switchConfig(Switch s) {
        if (s != null) {
            s.setChecked(Configuration.getPermission(this));
            s.setOnCheckedChangeListener(this);
        }
    }

    private boolean isDeviceAdminActive() {
        if (devicePolicyManager != null && devicePolicyManager.isAdminActive(deviceAdmin)) {
            return true;
        }
        return false;
    }

    private boolean checkPasswordStrength(String password) {
        int length = password.length();
        if (length >= 6 && length <= 12) {
            return true;
        }
        return false;
    }

    private void startMainActivity() {
        Intent i = new Intent(this, InitCheck.class);
        startActivity(i);
        finish();
    }
}
