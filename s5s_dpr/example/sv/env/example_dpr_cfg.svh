`ifndef __EXAMPLE_DPR_CFG__SVH
`define __EXAMPLE_DPR_CFG__SVH

class example_dpr_cfg extends uvm_object;
  `uvm_object_utils(example_dpr_cfg)

  string      m_id;
  s5s_dpr_cfg m_dpr_cfg_master;
  s5s_dpr_cfg m_dpr_cfg_slave;
  s5s_dpr_cfg m_dpr_cfg_passive;

  function new(string name = "example_dpr_cfg");
    super.new(name);
  endfunction : new

endclass : example_dpr_cfg

`endif //__EXAMPLE_DPR_CFG__SVH
