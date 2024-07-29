`ifndef __S5S_DPR_SLAVE_SEQUENCER__SVH
`define __S5S_DPR_SLAVE_SEQUENCER__SVH

class s5s_dpr_slave_sequencer extends uvm_sequencer#(s5s_dpr_sequence_item);
  `uvm_component_utils(s5s_dpr_slave_sequencer)

  s5s_dpr_cfg p_cfg;

  uvm_tlm_analysis_fifo#(uvm_sequence_item) m_req_fifo;

  function new(string name = "s5s_dpr_slave_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_req_fifo = new("m_req_fifo", this);
  endfunction : build_phase

endclass : s5s_dpr_slave_sequencer

`endif //__S5S_DPR_SLAVE_SEQUENCER__SVH
