/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_auto_5 (
    input clk,
    input rst,
    input trigger,
    output reg [3:0] io_sel,
    output reg [7:0] io_seg
  );
  
  
  
  wire [16-1:0] M_boolean_out;
  reg [16-1:0] M_boolean_a;
  reg [16-1:0] M_boolean_b;
  reg [6-1:0] M_boolean_alufn;
  boolean_10 boolean (
    .a(M_boolean_a),
    .b(M_boolean_b),
    .alufn(M_boolean_alufn),
    .out(M_boolean_out)
  );
  
  localparam IDLE_state = 3'd0;
  localparam TEST1_state = 3'd1;
  localparam TEST2_state = 3'd2;
  localparam TEST3_state = 3'd3;
  localparam TEST4_state = 3'd4;
  localparam PASS_state = 3'd5;
  localparam FAIL_state = 3'd6;
  
  reg [2:0] M_state_d, M_state_q = IDLE_state;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [1-1:0] M_sc_inc_state;
  stateCounter_18 sc (
    .clk(clk),
    .rst(rst),
    .inc_state(M_sc_inc_state)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    M_boolean_a = 1'h0;
    M_boolean_b = 1'h0;
    M_boolean_alufn = 6'h00;
    io_seg = 8'hff;
    M_seg_values = 16'habc0;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    if (trigger == 1'h0) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        if (trigger == 1'h1) begin
          M_state_d = TEST1_state;
        end
      end
      TEST1_state: begin
        M_boolean_a = 16'he9d7;
        M_boolean_b = 16'h1d6e;
        M_boolean_alufn = 6'h18;
        M_seg_values = 16'haaa1;
        if (M_boolean_out == 16'h0946 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST2_state;
        end else begin
          if (M_sc_inc_state == 1'h1) begin
            M_state_d = FAIL_state;
          end
        end
      end
      TEST2_state: begin
        M_boolean_a = 16'he9d7;
        M_boolean_b = 16'h1d6e;
        M_boolean_alufn = 6'h1e;
        M_seg_values = 16'haaa2;
        if (M_boolean_out == 16'hfdff && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST3_state;
        end else begin
          if (M_sc_inc_state == 1'h1) begin
            M_state_d = FAIL_state;
          end
        end
      end
      TEST3_state: begin
        M_boolean_a = 16'he9d7;
        M_boolean_b = 16'h1d6e;
        M_boolean_alufn = 6'h16;
        M_seg_values = 16'haaa3;
        if (M_boolean_out == 16'hf4b9 && M_sc_inc_state == 1'h1) begin
          M_state_d = TEST4_state;
        end else begin
          if (M_sc_inc_state == 1'h1) begin
            M_state_d = FAIL_state;
          end
        end
      end
      TEST4_state: begin
        M_boolean_a = 16'he9d7;
        M_boolean_b = 16'h1d6e;
        M_boolean_alufn = 6'h1a;
        M_seg_values = 16'haaa4;
        if (M_boolean_out == 16'he9d7 && M_sc_inc_state == 1'h1) begin
          M_state_d = PASS_state;
        end else begin
          if (M_sc_inc_state == 1'h1) begin
            M_state_d = FAIL_state;
          end
        end
      end
      FAIL_state: begin
        M_seg_values = 16'hfedd;
      end
      PASS_state: begin
        M_seg_values = 16'hdedd;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
