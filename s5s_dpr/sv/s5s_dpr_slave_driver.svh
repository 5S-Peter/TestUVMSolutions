`ifndef __S5S_DPR_SLAVE_DRIVER__SVH
`define __S5S_DPR_SLAVE_DRIVER__SVH

class s5s_dpr_slave_driver extends uvm_driver#(s5s_dpr_sequence_item);
  `uvm_component_utils(s5s_dpr_slave_driver)

  virtual s5s_dpr_if m_vif;
  s5s_dpr_cfg        p_cfg;

  function new(string name = "s5s_dpr_slave_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (! uvm_config_db#(virtual interface s5s_dpr_if)::get(this, "", "m_vif", m_vif) ) begin
      `uvm_fatal("NOVIF", $sformatf("%s - could not connect to virtual interface", get_full_name()))
    end
  endfunction : build_phase

  virtual task run_phase (uvm_phase phase);
    process _normal_op;
    forever begin
      m_vif.drv_cb.rdy <= 1'b0;
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
        .stream_name($sformatf("%s - SDR", p_cfg.m_id)),
        .begin_time ($time)
      ));

      repeat (req.m_rdy_delay) begin
        @(m_vif.mon_cb);
      end
      m_vif.drv_cb.rdy <= 1'b1;
      @(m_vif.mon_cb);
      m_vif.drv_cb.rdy <= 1'b0;

      end_tr(
        .tr      (req),
        .end_time($time)
      );
      seq_item_port.item_done();
    end
  endtask : drive

endclass : s5s_dpr_slave_driver

`endif //__S5S_DPR_SLAVE_DRIVER__SVH
