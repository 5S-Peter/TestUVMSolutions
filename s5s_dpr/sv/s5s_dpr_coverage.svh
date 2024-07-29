`ifndef __S5S_DPR_COVERAGE__SVH
`define __S5S_DPR_COVERAGE__SVH

class s5s_dpr_coverage extends uvm_component;
  `uvm_component_utils(s5s_dpr_coverage)

  uvm_tlm_analysis_fifo#(uvm_sequence_item) m_trans_fifo;

  s5s_dpr_sequence_item m_sequence_item;

  covergroup cov_sequence_item;
    req_delay : coverpoint m_sequence_item.m_req_delay;
    cmd       : coverpoint m_sequence_item.m_cmd;
    rdy_delay : coverpoint m_sequence_item.m_rdy_delay;
  endgroup : cov_sequence_item

  function new(string name = "s5s_dpr_coverage", uvm_component parent = null);
    super.new(name, parent);
    cov_sequence_item = new();
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_trans_fifo = new("m_trans_fifo", this);
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    uvm_sequence_item _seq_item;
    forever begin
      m_trans_fifo.get(_seq_item);
      if ($cast(m_sequence_item, _seq_item)) begin
        cov_sequence_item.sample();
      end
    end
  endtask : run_phase

endclass : s5s_dpr_coverage

`endif //__S5S_DPR_COVERAGE__SVH
