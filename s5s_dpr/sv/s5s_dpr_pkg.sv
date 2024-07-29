`ifndef __S5S_DPR_PKG__SV
`define __S5S_DPR_PKG__SV

package s5s_dpr_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "s5s_dpr_cfg.svh"
  `include "s5s_dpr_sequence_item.svh"
  `include "s5s_dpr_monitor.svh"
  `include "s5s_dpr_coverage.svh"
  `include "s5s_dpr_master_driver.svh"
  `include "s5s_dpr_master_sequencer.svh"
  `include "s5s_dpr_master_agent.svh"
  `include "s5s_dpr_slave_driver.svh"
  `include "s5s_dpr_slave_sequencer.svh"
  `include "s5s_dpr_slave_agent.svh"
  `include "s5s_dpr_env.svh"

  `include "s5s_dpr_master_sequence.svh"
  `include "s5s_dpr_master_sequence_lib.svh"
  `include "s5s_dpr_slave_sequence.svh"
  `include "s5s_dpr_slave_sequence_lib.svh"

endpackage : s5s_dpr_pkg


`endif //__S5S_DPR_PKG__SV
