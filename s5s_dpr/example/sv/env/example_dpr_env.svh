`ifndef __EXAMPLE_DPR_ENV__SVH
`define __EXAMPLE_DPR_ENV__SVH

class example_dpr_env extends uvm_component;
  `uvm_component_utils(example_dpr_env)

  example_dpr_cfg               m_cfg;
  s5s_dpr_env                   m_master;
  s5s_dpr_env                   m_slave;
  s5s_dpr_env                   m_passive;
  example_dpr_virtual_sequencer m_virtual_sequencer;

  function new(string name = "example_dpr_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (! uvm_config_db#(example_dpr_cfg)::get(this, "", "m_cfg", m_cfg)) begin
      `uvm_fatal("NOCONF", $sformatf("%s - could not get configuration", get_name()))
    end
    uvm_config_db#(s5s_dpr_cfg)::set(this, "m_master",  "m_cfg", m_cfg.m_dpr_cfg_master);
    uvm_config_db#(s5s_dpr_cfg)::set(this, "m_slave",   "m_cfg", m_cfg.m_dpr_cfg_slave);
    uvm_config_db#(s5s_dpr_cfg)::set(this, "m_passive", "m_cfg", m_cfg.m_dpr_cfg_passive);

    m_master            = s5s_dpr_env                  ::type_id::create("m_master",            this);
    m_slave             = s5s_dpr_env                  ::type_id::create("m_slave",             this);
    m_passive           = s5s_dpr_env                  ::type_id::create("m_passive",           this);
    m_virtual_sequencer = example_dpr_virtual_sequencer::type_id::create("m_virtual_sequencer", this);
  endfunction : build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_virtual_sequencer.p_master_sequencer = m_master.m_master.m_sequencer;
    m_virtual_sequencer.p_slave_sequencer  = m_slave.m_slave.m_sequencer;
  endfunction : connect_phase

endclass : example_dpr_env

`endif //__EXAMPLE_DPR_ENV__SVH
