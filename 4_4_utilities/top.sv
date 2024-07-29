`ifndef __TOP__SV
`define __TOP__SV

module top;

  ...

  logic clk, rstn;

  sp_if i0_sp_if ( .clk(clk), .rstn(rstn) );
  sp_if i1_sp_if ( .clk(clk), .rstn(rstn) );

  initial begin
    uvm_config_db#(virtual interface sp_if)::set(null, "*m_plate[LEFT]" , "m_sp_if", i0_sp_if);
    uvm_config_db#(virtual interface sp_if)::set(null, "*m_plate[RIGHT]", "m_sp_if", i1_sp_if);
  end

  ...

endmodule : top


`endif //__TOP__SV


