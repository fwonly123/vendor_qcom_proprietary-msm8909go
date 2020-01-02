
/*============================================================================
   Copyright (c) 2012 Qualcomm Technologies, Inc.  All Rights Reserved.
   Qualcomm Technologies Proprietary and Confidential.
============================================================================*/
#include <unistd.h>
#include <math.h>
#include "camera_dbg.h"
#include "vfe.h"

/*===========================================================================
 * FUNCTION    - vfe_sce_ops_init -
 *
 * DESCRIPTION:
 *==========================================================================*/
vfe_status_t vfe_sce_ops_init(void *mod)
{
  sce_mod_t *pmod = (sce_mod_t *)mod;
  memset(pmod, 0 , sizeof(sce_mod_t));
  pmod->ops.init = vfe_sce_init;
  pmod->ops.update = vfe_sce_update;
  pmod->ops.trigger_update = vfe_sce_trigger_update;
  pmod->ops.config = vfe_sce_config;
  pmod->ops.enable = vfe_sce_enable;
  pmod->ops.reload_params = vfe_sce_reload_params;
  pmod->ops.trigger_enable = vfe_sce_trigger_enable;
  pmod->ops.test_vector_validate = vfe_sce_tv_validate;
  pmod->ops.test_vector_validate = NULL;
  pmod->ops.set_effect = NULL;
  pmod->ops.set_spl_effect = vfe_sce_set_spl_effect;
  pmod->ops.set_manual_wb = NULL;
  pmod->ops.set_bestshot = vfe_sce_set_bestshot;
  pmod->ops.deinit = vfe_sce_deinit;
  return VFE_SUCCESS;
}

/*===========================================================================
 * FUNCTION    - vfe_sce_ops_deinit -
 *
 * DESCRIPTION:
 *==========================================================================*/
vfe_status_t vfe_sce_ops_deinit(void *mod)
{
  sce_mod_t *pmod = (sce_mod_t *)mod;

  memset(&(pmod->ops), 0, sizeof(vfe_module_ops_t));
  return VFE_SUCCESS;
}
