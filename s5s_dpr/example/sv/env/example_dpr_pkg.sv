`ifndef __EXAMPLE_DPR_PKG__SV
`define __EXAMPLE_DPR_PKG__SV

package example_dpr_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import s5s_dpr_pkg::*;


  `include "example_dpr_cfg.svh"
  `include "example_dpr_virtual_sequencer.svh"
  `include "example_dpr_virtual_sequence.svh"
  `include "example_dpr_env.svh"
  `include "example_dpr_test.svh"

  `include "example_dpr_virtual_sequence_lib.svh"
  `include "example_dpr_10_trans_test.svh"

endpackage : example_dpr_pkg

`endif //__EXAMPLE_DPR_PKG__SV
