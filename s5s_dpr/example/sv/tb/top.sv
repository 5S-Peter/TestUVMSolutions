`ifndef __TOP__SV
`define __TOP__SV

module top ();
  import uvm_pkg::*;
  import example_dpr_pkg::*;

  logic clk, rstn;

  initial begin
    clk <= 1'b0;
    forever begin
      #3;
      clk <= ~clk;
    end
  end

  initial begin
    rstn <= 1'b0;
    repeat(3) begin
      @(posedge clk);
    end
    rstn <= 1'b1;
  end

  s5s_dpr_if i0_master_s5s_dpr_if  ( .clk(clk), .rstn(rstn) );
  s5s_dpr_if i1_slave_s5s_dpr_if   ( .clk(clk), .rstn(rstn) );
  s5s_dpr_if i2_passive_s5s_dpr_if ( .clk(clk), .rstn(rstn) );

  assign i0_master_s5s_dpr_if .rdy = i1_slave_s5s_dpr_if .rdy;
  assign i1_slave_s5s_dpr_if  .req = i0_master_s5s_dpr_if.req;
  assign i1_slave_s5s_dpr_if  .cmd = i0_master_s5s_dpr_if.cmd;
  assign i2_passive_s5s_dpr_if.rdy = i1_slave_s5s_dpr_if .rdy;
  assign i2_passive_s5s_dpr_if.req = i0_master_s5s_dpr_if.req;
  assign i2_passive_s5s_dpr_if.cmd = i0_master_s5s_dpr_if.cmd;

  initial begin
    uvm_config_db#(virtual interface s5s_dpr_if)::set(null, "*m_master*" , "m_vif", i0_master_s5s_dpr_if );
    uvm_config_db#(virtual interface s5s_dpr_if)::set(null, "*m_slave*"  , "m_vif", i1_slave_s5s_dpr_if  );
    uvm_config_db#(virtual interface s5s_dpr_if)::set(null, "*m_passive*", "m_vif", i2_passive_s5s_dpr_if);
  end

  initial begin
    run_test();
  end

endmodule : top

`endif //__TOP__SV
