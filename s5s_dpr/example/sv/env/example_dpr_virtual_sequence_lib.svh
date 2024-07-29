`ifndef __EXAMPLE_DPR_VIRTUAL_SEQUENCE_LIB__SVH
`define __EXAMPLE_DPR_VIRTUAL_SEQUENCE_LIB__SVH

class example_dpr_10_trans_virtual_sequence extends example_dpr_virtual_sequence;
  `uvm_object_utils(example_dpr_10_trans_virtual_sequence)

  s5s_dpr_slave_default_resp_sequence m_slave_sequence;
  s5s_dpr_master_10_trans_sequence    m_master_sequence;

  function new(string name = "example_dpr_10_trans_virtual_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
    m_slave_sequence  = s5s_dpr_slave_default_resp_sequence::type_id::create("m_slave_sequence");
    m_master_sequence = s5s_dpr_master_10_trans_sequence   ::type_id::create("m_master_sequence");

    fork 
      m_slave_sequence.start( p_sequencer.p_slave_sequencer );
    join_none

    m_master_sequence.start ( p_sequencer.p_master_sequencer );
  endtask : body

endclass : example_dpr_10_trans_virtual_sequence


`endif //__EXAMPLE_DPR_VIRTUAL_SEQUENCE_LIB__SVH
