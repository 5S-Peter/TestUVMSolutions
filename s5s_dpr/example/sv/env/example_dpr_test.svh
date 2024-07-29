`ifndef __EXAMPLE_DPR_TEST__SVH
`define __EXAMPLE_DPR_TEST__SVH

class example_dpr_test extends uvm_test;
  `uvm_component_utils(example_dpr_test)

  example_dpr_env m_dpr_env;

  function new(string name = "example_dpr_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_dpr_env = example_dpr_env::type_id::create("m_dpr_env", this);
    configure();
    uvm_config_db#(int)::set(this, "*", "recording_detail", UVM_HIGH);
  endfunction : build_phase

  virtual function void configure();
    example_dpr_cfg _cfg;
    _cfg      = example_dpr_cfg::type_id::create("_cfg");
    _cfg.m_id = "Example";
    configure_master (_cfg);
    configure_slave  (_cfg);
    configure_passive(_cfg);
    uvm_config_db#(example_dpr_cfg)::set(this, "m_dpr_env", "m_cfg", _cfg);
  endfunction : configure

  virtual function void configure_master (example_dpr_cfg cfg);
    cfg.m_dpr_cfg_master = s5s_dpr_cfg::type_id::create("m_dpr_cfg_master");
    cfg.m_dpr_cfg_master.m_id           = "MASTER";
    cfg.m_dpr_cfg_master.m_has_master   = 1'b1;
    cfg.m_dpr_cfg_master.m_has_slave    = 1'b0;
    cfg.m_dpr_cfg_master.m_has_coverage = 1'b0;
  endfunction : configure_master

  virtual function void configure_slave (example_dpr_cfg cfg);
    cfg.m_dpr_cfg_slave = s5s_dpr_cfg::type_id::create("m_dpr_cfg_slave");
    cfg.m_dpr_cfg_slave.m_id           = "SLAVE";
    cfg.m_dpr_cfg_slave.m_has_master   = 1'b0;
    cfg.m_dpr_cfg_slave.m_has_slave    = 1'b1;
    cfg.m_dpr_cfg_slave.m_has_coverage = 1'b0;
  endfunction : configure_slave

  virtual function void configure_passive (example_dpr_cfg cfg);
    cfg.m_dpr_cfg_passive = s5s_dpr_cfg::type_id::create("m_dpr_cfg_passive");
    cfg.m_dpr_cfg_passive.m_id           = "PASSIVE";
    cfg.m_dpr_cfg_passive.m_has_master   = 1'b0;
    cfg.m_dpr_cfg_passive.m_has_slave    = 1'b0;
    cfg.m_dpr_cfg_passive.m_has_coverage = 1'b1;
  endfunction : configure_passive

  virtual task do_test (uvm_phase phase);
  endtask : do_test

  virtual task run_phase (uvm_phase phase);
    uvm_objection _obj;
    _obj = phase.get_objection();
    _obj.raise_objection(this);
    _obj.set_drain_time(this, 10ns);
    do_test(phase);
    _obj.drop_objection(this);
  endtask : run_phase

endclass : example_dpr_test

`endif //__EXAMPLE_DPR_TEST__SVH
