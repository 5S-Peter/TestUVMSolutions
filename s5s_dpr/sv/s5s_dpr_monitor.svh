`ifndef __S5S_DPR_MONITOR__SVH
`define __S5S_DPR_MONITOR__SVH

class s5s_dpr_monitor extends uvm_component;
  `uvm_component_utils(s5s_dpr_monitor)

  virtual s5s_dpr_if m_vif;
  s5s_dpr_cfg        p_cfg;

  uvm_analysis_port#(uvm_sequence_item) m_req_port;
  uvm_analysis_port#(uvm_sequence_item) m_trans_port;

  function new(string name = "s5s_dpr_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (! uvm_config_db#(virtual interface s5s_dpr_if)::get(this, "", "m_vif", m_vif) ) begin
      `uvm_fatal("NOVIF", $sformatf("%s - could not connect to virtual interface", get_full_name()))
    end
    m_req_port   = new("m_req_port"  , this);
    m_trans_port = new("m_trans_port", this);
  endfunction : build_phase

  virtual task run_phase (uvm_phase phase);
    process _normal_op;
    forever begin
      @(m_vif.mon_cb iff (m_vif.rstn === 1'b1 ));
      fork
        begin
          _normal_op = process::self();
          monitor();
        end
        @(negedge m_vif.rstn);
      join_any
      _normal_op.kill();
    end
  endtask : run_phase

  virtual task monitor();
    s5s_dpr_sequence_item _seq_item;
    forever begin
      _seq_item = s5s_dpr_sequence_item::type_id::create("_seq_item");

      void'(begin_tr(
        .tr         (_seq_item),
        .stream_name($sformatf("%s - MON", p_cfg.m_id)),
        .begin_time ($time)
      ));

      while (m_vif.mon_cb.req == 1'b0) begin
        _seq_item.m_req_delay ++;
        @(m_vif.mon_cb);
      end
      _seq_item.m_cmd = m_vif.mon_cb.cmd;
      m_req_port.write(_seq_item.clone());
      @(m_vif.mon_cb);
      while (m_vif.mon_cb.rdy == 1'b0) begin
        _seq_item.m_rdy_delay ++;
        @(m_vif.mon_cb);
      end
      m_trans_port.write(_seq_item.clone());

      end_tr(
        .tr      (_seq_item),
        .end_time($time)
      );
      @(m_vif.mon_cb);
    end
  endtask : monitor

endclass : s5s_dpr_monitor

`endif //__S5S_DPR_MONITOR__SVH
