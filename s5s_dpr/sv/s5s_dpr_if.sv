`ifndef __S5S_DPR_IF__SV
`define __S5S_DPR_IF__SV

interface s5s_dpr_if (
  input clk,
  input rstn
);

  wire       req;
  wire [1:0] cmd;
  wire       rdy;

  clocking drv_cb @(posedge clk);
    output req, cmd, rdy;
  endclocking : drv_cb

  clocking mon_cb @(posedge clk);
    input req, cmd, rdy;
  endclocking : mon_cb

  // SVA section
  typedef enum logic[1:0] {IDLE, REQ} t_state;
  t_state state;
  always @(posedge clk or negedge rstn) begin
    if (! rstn) begin
      state <= IDLE;
    end else begin
      state <= mon_cb.req ? REQ : (mon_cb.rdy ? IDLE : state);
    end
  end

  property req_vs_state;
    @(mon_cb) disable iff (! rstn)
    state == REQ -> !mon_cb.req;
  endproperty : req_vs_state

  property rdy_vs_state;
    @(mon_cb) disable iff (! rstn)
    state == IDLE -> !mon_cb.rdy;
  endproperty : rdy_vs_state

  property stable_cmd_req;
    @(mon_cb) disable iff (! rstn)
    state == REQ -> $stable(mon_cb.cmd);
  endproperty : stable_cmd_req

  a_req_vs_state   : assert property (req_vs_state);
  a_rdy_vs_state   : assert property (rdy_vs_state);
  a_stable_cmd_req : assert property (stable_cmd_req);

endinterface : s5s_dpr_if


`endif //__S5S_DPR_IF__SV
