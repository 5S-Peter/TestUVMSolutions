`ifndef __SET_CONFIG__SVH
`define __SET_CONFIG__SVH

class set_config extends uvm_test;
  `uvm_component_utils(set_config)

  function new(string name = "set_config", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    configure_right_courier();
  endfunction : build_phase

  virtual function void configure_right_courier();
    cou_cfg _cfg;
    _cfg = cou_cfg::type_id::create("_cfg");
    /*set config properties here*/
    uvm_config_db#(cou_cfg)::set(this, "*m_courier[RIGHT]", "m_cfg", _cfg);
  endfunction : configure_right_courier

endclass : set_config

`endif //__SET_CONFIG__SVH


