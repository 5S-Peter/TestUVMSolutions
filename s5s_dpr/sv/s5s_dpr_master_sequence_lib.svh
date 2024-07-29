`ifndef __S5S_DPR_MASTER_SEQUENCE_LIB__SVH
`define __S5S_DPR_MASTER_SEQUENCE_LIB__SVH

class s5s_dpr_master_10_trans_sequence extends s5s_dpr_master_sequence;
  `uvm_object_utils(s5s_dpr_master_10_trans_sequence)

  function new(string name = "s5s_dpr_master_10_trans_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
    repeat (10) begin
      req = s5s_dpr_sequence_item::type_id::create("req");
      start_item(req);
      void'(req.randomize() with {
        m_req_delay < 100;
      });
      finish_item(req);
      // No response provided by driver -> No get_response();
    end
  endtask : body

endclass : s5s_dpr_master_10_trans_sequence


`endif //__S5S_DPR_MASTER_SEQUENCE_LIB__SVH
