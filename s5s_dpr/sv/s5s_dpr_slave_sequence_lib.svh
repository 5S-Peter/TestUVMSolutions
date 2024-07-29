`ifndef __S5S_DPR_SLAVE_SEQUENCE_LIB__SVH
`define __S5S_DPR_SLAVE_SEQUENCE_LIB__SVH

class s5s_dpr_slave_default_resp_sequence extends s5s_dpr_slave_sequence;
  `uvm_object_utils(s5s_dpr_slave_default_resp_sequence)

  function new(string name = "s5s_dpr_slave_default_resp_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
    forever begin
      get_req(req);
      start_item(req);
      void'(req.randomize(m_rdy_delay) with {
        m_rdy_delay[1:0] == m_cmd;
      });
      finish_item(req);
      // No response provided by driver -> No get_response();
    end
  endtask : body

  virtual task get_req (ref s5s_dpr_sequence_item request);
    uvm_sequence_item _seq_item;
    do begin
      p_sequencer.m_req_fifo.get(_seq_item);
    end while (! $cast(request, _seq_item));
  endtask : get_req

endclass : s5s_dpr_slave_default_resp_sequence


`endif //__S5S_DPR_SLAVE_SEQUENCE_LIB__SVH
