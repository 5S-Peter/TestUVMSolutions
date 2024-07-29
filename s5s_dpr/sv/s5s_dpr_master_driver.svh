`ifndef __S5S_DPR_MASTER_DRIVER__SVH
`define __S5S_DPR_MASTER_DRIVER__SVH

class s5s_dpr_master_driver extends uvm_driver#(s5s_dpr_sequence_item);
  `uvm_component_utils(s5s_dpr_master_driver)

  virtual s5s_dpr_if m_vif;
  s5s_dpr_cfg        p_cfg;

  uvm_tlm_analysis_fifo#(uvm_sequence_item) m_trans_fifo;

  function new(string name = "s5s_dpr_master_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (! uvm_config_db#(virtual interface s5s_dpr_if)::get(this, "", "m_vif", m_vif) ) begin
      `uvm_fatal("NOVIF", $sformatf("%s - could not connect to virtual interface", get_full_name()))
    end
    m_trans_fifo = new("m_trans_fifo", this);
  endfunction : build_phase

  virtual task run_phase (uvm_phase phase);
    process _normal_op;
    forever begin
      m_vif.drv_cb.req <= 1'b0;
      m_vif.drv_cb.cmd <= 2'b00;
      @(m_vif.mon_cb iff (m_vif.rstn === 1'b1 ));
      fork
        begin
          _normal_op = process::self();
          drive();
        end
        @(negedge m_vif.rstn);
      join_any
      _normal_op.kill();
    end
  endtask : run_phase

  virtual task drive();
    forever begin
      seq_item_port.get_next_item(req);

      void'(begin_tr(
        .tr         (req),
        .stream_name($sformatf("%s - MDR", p_cfg.m_id)),
        .begin_time ($time)
      ));

      repeat (req.m_req_delay) begin
        @(m_vif.mon_cb);
      end
      m_vif.drv_cb.req <= 1'b1;
      m_vif.drv_cb.cmd <= req.m_cmd;
      @(m_vif.mon_cb);
      m_vif.drv_cb.req <= 1'b0;
      wait_for_response(req);

      end_tr(
        .tr      (req),
        .end_time($time)
      );
      seq_item_port.item_done();
    end
  endtask : drive

  virtual task wait_for_response( s5s_dpr_sequence_item request );
    uvm_sequence_item     _seq_item;
    s5s_dpr_sequence_item _dpr_seq_item;
    m_trans_fifo.get(_seq_item);
    void'($cast(_dpr_seq_item, _seq_item));
    request.m_rdy_delay = _dpr_seq_item.m_rdy_delay;
  endtask : wait_for_response

endclass : s5s_dpr_master_driver

`endif //__S5S_DPR_MASTER_DRIVER__SVH
