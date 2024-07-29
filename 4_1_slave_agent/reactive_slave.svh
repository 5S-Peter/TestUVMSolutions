
`ifndef __REACTIVE_SLAVE__SVH
`define __REACTIVE_SLAVE__SVH

class reactive_slave extends uvm_component;
  `uvm_component_utils(reactive_slave)

  sequencer m_sequencer;
  driver    m_driver;
  monitor   m_monitor;

  function new(string name = "reactive_slave", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_sequencer = sequencer::type_id::create("m_sequencer", this);
    m_driver    = driver   ::type_id::create("m_driver"   , this);
    m_monitor   = monitor  ::type_id::create("m_monitor"  , this);
  endfunction : build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_driver .seq_item_port.connect(m_sequencer.seq_item_export);
    m_monitor.m_req_port   .connect(m_sequencer.m_req_fifo.analysis_export);
  endfunction : connect_phase

endclass : reactive_slave

`endif //__REACTIVE_SLAVE__SVH


