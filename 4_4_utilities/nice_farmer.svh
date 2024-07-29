`ifndef __NICE_FARMER__SVH
`define __NICE_FARMER__SVH

class nice_farmer extends farmer;
  `uvm_component_utils(nice_farmer)

  function new(string name = "nice_farmer", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_name(), "Hello", UVM_NONE)
  endfunction : start_of_simulation_phase

endclass : nice_farmer

`endif //__NICE_FARMER__SVH
