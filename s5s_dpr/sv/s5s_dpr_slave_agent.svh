`ifndef __S5S_DPR_SLAVE_AGENT__SVH
`define __S5S_DPR_SLAVE_AGENT__SVH

class s5s_dpr_slave_agent extends uvm_component;
  `uvm_component_utils(s5s_dpr_slave_agent)

  s5s_dpr_cfg             p_cfg;
  s5s_dpr_slave_driver    m_driver;
  s5s_dpr_slave_sequencer m_sequencer;

  function new(string name = "s5s_dpr_slave_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_driver    = s5s_dpr_slave_driver   ::type_id::create("m_driver"    , this);
    m_sequencer = s5s_dpr_slave_sequencer::type_id::create("m_sequencer" , this);
  endfunction : build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
  endfunction : connect_phase

  virtual function void connect_cfg ( s5s_dpr_cfg cfg );
    p_cfg             = cfg;
    m_driver   .p_cfg = cfg;
    m_sequencer.p_cfg = cfg;
  endfunction : connect_cfg

endclass : s5s_dpr_slave_agent

`endif //__S5S_DPR_SLAVE_AGENT__SVH
