`ifndef __S5S_DPR_CFG__SVH
`define __S5S_DPR_CFG__SVH

class s5s_dpr_cfg extends uvm_object;
  `uvm_object_utils(s5s_dpr_cfg)

  string m_id;
  bit    m_has_master;
  bit    m_has_slave;
  bit    m_has_coverage;

  function new(string name = "s5s_dpr_cfg");
    super.new(name);
  endfunction : new

  virtual function string convert2string();
    convert2string = $sformatf("m_id: %s, m_has_master: %0d, m_has_slave: %0d, m_has_coverage: %0d", 
                                m_id,     m_has_master,      m_has_slave,      m_has_coverage);
  endfunction : convert2string

  virtual function s5s_dpr_cfg clone ();
    clone = s5s_dpr_cfg::type_id::create("s5s_dpr_cfg");
    clone.copy(this);
  endfunction : clone


  virtual function void do_copy(uvm_object rhs);
    s5s_dpr_cfg _b;
    super.do_copy(rhs);
    if ($cast(_b, rhs)) begin
      m_id            = _b.m_id;
      m_has_master    = _b.m_has_master;
      m_has_slave     = _b.m_has_slave;
      m_has_coverage  = _b.m_has_coverage;
    end
  endfunction : do_copy


  virtual function void do_print (uvm_printer printer);
    super.do_print(printer);
    printer.print_string  ("m_id"           , m_id);
    printer.print_int     ("m_has_master"   , m_has_master    , $bits(m_has_master)   , UVM_UNSIGNED);
    printer.print_int     ("m_has_slave"    , m_has_slave     , $bits(m_has_slave)    , UVM_UNSIGNED);
    printer.print_int     ("m_has_coverage" , m_has_coverage  , $bits(m_has_coverage) , UVM_UNSIGNED);
  endfunction : do_print


  virtual function void do_record (uvm_recorder recorder);
    recorder.record_string  ("m_id"           ,  m_id );
    recorder.record_field   ("m_has_master"   ,  m_has_master   ,        $bits(m_has_master)  , UVM_UNSIGNED);
    recorder.record_field   ("m_has_slave"    ,  m_has_slave    ,        $bits(m_has_slave)   , UVM_UNSIGNED);
    recorder.record_field   ("m_has_coverage" ,  m_has_coverage ,        $bits(m_has_coverage), UVM_UNSIGNED);
  endfunction : do_record


  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    s5s_dpr_cfg _b;
    do_compare = super.do_compare(rhs, comparer);
    if ($cast(_b, rhs)) begin
      do_compare &= comparer.compare_string    ("m_id",           m_id,            _b.m_id);
      do_compare &= comparer.compare_field_int ("m_has_master",   m_has_master,    _b.m_has_master,    $bits(m_has_master));
      do_compare &= comparer.compare_field_int ("m_has_slave",    m_has_slave,     _b.m_has_slave,     $bits(m_has_slave));
      do_compare &= comparer.compare_field_int ("m_has_coverage", m_has_coverage,  _b.m_has_coverage,  $bits(m_has_coverage));
    end
  endfunction : do_compare


  virtual function void do_pack (uvm_packer packer);
    super.do_pack(packer);
    packer.pack_string    (m_id);
    packer.pack_field_int (m_has_master,    $bits(m_has_master));
    packer.pack_field_int (m_has_slave,     $bits(m_has_slave));
    packer.pack_field_int (m_has_coverage,  $bits(m_has_coverage));
  endfunction : do_pack


  virtual function void do_unpack (uvm_packer packer);
    super.do_unpack(packer);
    m_id           = packer.unpack_string    ();
    m_has_master   = packer.unpack_field_int ($bits(m_has_master));
    m_has_slave    = packer.unpack_field_int ($bits(m_has_slave));
    m_has_coverage = packer.unpack_field_int ($bits(m_has_coverage));
  endfunction : do_unpack

endclass : s5s_dpr_cfg

`endif //__S5S_DPR_CFG__SVH
