`ifndef __S5S_DPR_SEQUENCE_ITEM__SVH
`define __S5S_DPR_SEQUENCE_ITEM__SVH

class s5s_dpr_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(s5s_dpr_sequence_item)

  rand bit[31:0] m_req_delay;
  rand bit[ 1:0] m_cmd;
  rand bit[ 7:0] m_rdy_delay;

  function new(string name = "s5s_dpr_sequence_item");
    super.new(name);
  endfunction : new

  virtual function s5s_dpr_sequence_item clone ();
    clone = s5s_dpr_sequence_item::type_id::create("s5s_dpr_sequence_item");
    clone.copy(this);
  endfunction : clone


  virtual function void do_copy(uvm_object rhs);
    s5s_dpr_sequence_item _b;
    super.do_copy(rhs);
    if ($cast(_b, rhs)) begin
      m_req_delay  = _b.m_req_delay;
      m_cmd        = _b.m_cmd;
      m_rdy_delay  = _b.m_rdy_delay;
    end
  endfunction : do_copy


  virtual function void do_print (uvm_printer printer);
    super.do_print(printer);
    printer.print_int     ("m_req_delay" , m_req_delay, $bits(m_req_delay), UVM_UNSIGNED);
    printer.print_int     ("m_cmd"       , m_cmd      , $bits(m_cmd)      , UVM_UNSIGNED);
    printer.print_int     ("m_rdy_delay" , m_rdy_delay, $bits(m_rdy_delay), UVM_UNSIGNED);
  endfunction : do_print


  virtual function void do_record (uvm_recorder recorder);
    recorder.record_field   ("m_req_delay",  m_req_delay,        $bits(m_req_delay), UVM_UNSIGNED);
    recorder.record_field   ("m_cmd"      ,  m_cmd      ,        $bits(m_cmd)      , UVM_UNSIGNED);
    recorder.record_field   ("m_rdy_delay",  m_rdy_delay,        $bits(m_rdy_delay), UVM_UNSIGNED);
  endfunction : do_record


  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    s5s_dpr_sequence_item _b;
    do_compare = super.do_compare(rhs, comparer);
    if ($cast(_b, rhs)) begin
      do_compare &= comparer.compare_field_int ("m_req_delay",  m_req_delay,   _b.m_req_delay,  $bits(m_req_delay));
      do_compare &= comparer.compare_field_int ("m_cmd",        m_cmd,         _b.m_cmd,        $bits(m_cmd));
      do_compare &= comparer.compare_field_int ("m_rdy_delay",  m_rdy_delay,   _b.m_rdy_delay,  $bits(m_rdy_delay));
    end
  endfunction : do_compare


  virtual function void do_pack (uvm_packer packer);
    super.do_pack(packer);
    packer.pack_field_int (m_req_delay,  $bits(m_req_delay));
    packer.pack_field_int (m_cmd,        $bits(m_cmd));
    packer.pack_field_int (m_rdy_delay,  $bits(m_rdy_delay));
  endfunction : do_pack


  virtual function void do_unpack (uvm_packer packer);
    super.do_unpack(packer);
    m_req_delay = packer.unpack_field_int ($bits(m_req_delay));
    m_cmd       = packer.unpack_field_int ($bits(m_cmd));
    m_rdy_delay = packer.unpack_field_int ($bits(m_rdy_delay));
  endfunction : do_unpack

endclass : s5s_dpr_sequence_item

`endif //__S5S_DPR_SEQUENCE_ITEM__SVH
