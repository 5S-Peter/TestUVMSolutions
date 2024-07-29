`ifndef __NICE_FARMER_TEST__SVH
`define __NICE_FARMER_TEST__SVH

class nice_farmer_test extends tlm_test;
  `uvm_component_utils(nice_farmer_test)

  function new(string name = "nice_farmer_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    factory.set_inst_override_by_type(
      farmer::get_type(),
      nice_farmer::get_type(),
      "uvm_test_top.m_side[RIGHT].m_farmer[RIGHT]"
    );
  endfunction : build_phase

endclass : nice_farmer_test

`endif //__NICE_FARMER_TEST__SVH


