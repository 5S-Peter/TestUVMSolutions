`ifndef __S5S_DPR_ENV__SVH
`define __S5S_DPR_ENV__SVH

class s5s_dpr_env extends uvm_component;
  `uvm_component_utils(s5s_dpr_env)

  s5s_dpr_cfg          m_cfg;
  s5s_dpr_monitor      m_monitor;
  s5s_dpr_coverage     m_coverage;
  s5s_dpr_master_agent m_master;
  s5s_dpr_slave_agent  m_slave;

  function new(string name = "s5s_dpr_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (! uvm_config_db#(s5s_dpr_cfg)::get(this, "", "m_cfg", m_cfg)) begin
      `uvm_fatal("NOCONF", $sformatf("%s - could not get config object", get_name() ))
    end
    m_monitor = s5s_dpr_monitor::type_id::create("m_monitor", this);
    if (m_cfg.m_has_coverage) begin
      m_coverage = s5s_dpr_coverage::type_id::create("m_coverage", this);
    end
    if (m_cfg.m_has_master) begin
      m_master = s5s_dpr_master_agent::type_id::create("m_master", this);
    end
    if (m_cfg.m_has_slave) begin
      m_slave = s5s_dpr_slave_agent::type_id::create("m_slave", this);
    end
  endfunction : build_phase

  virtual function void connect_phase ( uvm_phase phase );
    super.connect_phase(phase);
    m_monitor.p_cfg = m_cfg;
    if (m_cfg.m_has_coverage) begin
      m_monitor.m_trans_port.connect(m_coverage.m_trans_fifo.analysis_export);
    end
    if (m_cfg.m_has_master) begin
      m_master.connect_cfg(m_cfg);
      m_monitor.m_trans_port.connect(m_master.m_driver.m_trans_fifo.analysis_export);
    end
    if (m_cfg.m_has_slave) begin
      m_slave.connect_cfg(m_cfg);
      m_monitor.m_req_port.connect(m_slave.m_sequencer.m_req_fifo.analysis_export);
    end
  endfunction : connect_phase

endclass : s5s_dpr_env

`endif //__S5S_DPR_ENV__SVH
