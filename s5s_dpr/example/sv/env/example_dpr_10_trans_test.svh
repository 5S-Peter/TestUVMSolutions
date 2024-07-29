`ifndef __EXAMPLE_DPR_10_TRANS_TEST__SVH
`define __EXAMPLE_DPR_10_TRANS_TEST__SVH

class example_dpr_10_trans_test extends example_dpr_test;
  `uvm_component_utils(example_dpr_10_trans_test)

  function new(string name = "example_dpr_10_trans_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual task do_test(uvm_phase phase);
    example_dpr_10_trans_virtual_sequence _virtual_sequence;
    _virtual_sequence = example_dpr_10_trans_virtual_sequence::type_id::create("_virtual_sequence");
    _virtual_sequence.start(m_dpr_env.m_virtual_sequencer);
  endtask : do_test

endclass : example_dpr_10_trans_test

`endif //__EXAMPLE_DPR_10_TRANS_TEST__SVH
