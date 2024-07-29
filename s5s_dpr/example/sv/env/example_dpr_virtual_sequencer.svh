`ifndef __EXAMPLE_DPR_VIRTUAL_SEQUENCER__SVH
`define __EXAMPLE_DPR_VIRTUAL_SEQUENCER__SVH

class example_dpr_virtual_sequencer extends uvm_sequencer;
  `uvm_component_utils(example_dpr_virtual_sequencer)

  s5s_dpr_master_sequencer p_master_sequencer;
  s5s_dpr_slave_sequencer  p_slave_sequencer;

  function new(string name = "example_dpr_virtual_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

endclass : example_dpr_virtual_sequencer

`endif //__EXAMPLE_DPR_VIRTUAL_SEQUENCER__SVH
