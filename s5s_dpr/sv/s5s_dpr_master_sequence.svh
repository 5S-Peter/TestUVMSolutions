`ifndef __S5S_DPR_MASTER_SEQUENCE__SVH
`define __S5S_DPR_MASTER_SEQUENCE__SVH

class s5s_dpr_master_sequence extends uvm_sequence#(s5s_dpr_sequence_item);
  `uvm_object_utils(s5s_dpr_master_sequence)
  `uvm_declare_p_sequencer(s5s_dpr_master_sequencer)

  function new(string name = "s5s_dpr_master_sequence");
    super.new(name);
  endfunction : new

endclass : s5s_dpr_master_sequence

`endif //__S5S_DPR_MASTER_SEQUENCE__SVH
