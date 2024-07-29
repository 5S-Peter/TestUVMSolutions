`ifndef __EXAMPLE_DPR_VIRTUAL_SEQUENCE__SVH
`define __EXAMPLE_DPR_VIRTUAL_SEQUENCE__SVH

class example_dpr_virtual_sequence extends uvm_sequence;
  `uvm_object_utils(example_dpr_virtual_sequence)
  `uvm_declare_p_sequencer(example_dpr_virtual_sequencer)

  function new(string name = "example_dpr_virtual_sequence");
    super.new(name);
  endfunction : new

endclass : example_dpr_virtual_sequence

`endif //__EXAMPLE_DPR_VIRTUAL_SEQUENCE__SVH
