module Verilog1
#(
			parameter N = 16
)
(
  input wire [N-1:0] data,
  input             clk,
  input             ena,
  input             rst,
  input              start,
  output reg [N-1:0]  res,
  output reg        rdy
);
	

  wire signed [N-1:0] layer1_weights [N-1:0];
  wire signed [N-1:0] layer1_bias;
  

localparam SF = 2.0**-11.0;
  
  assign layer1_weights[15] = 16'b00010_00010101110;
  assign layer1_weights[14] = 16'b11111_10001011100;
  assign layer1_weights[13] = 16'b11111_10001010001;
  assign layer1_weights[12] = 16'b00010_00010101100;
  assign layer1_weights[11] = 16'b11111_10000110001;
  assign layer1_weights[10] = 16'b00010_00010111000;
  assign layer1_weights[9] = 16'b00010_00010101011;
  assign layer1_weights[8] = 16'b11111_10001100000;
  assign layer1_weights[7] = 16'b11111_10001010000;
  assign layer1_weights[6] = 16'b00010_00010110101;
  assign layer1_weights[5] = 16'b00010_00010101010;
  assign layer1_weights[4] = 16'b11111_10001000001;
  assign layer1_weights[3] = 16'b00010_00010101101;
  assign layer1_weights[2] = 16'b11111_10001011011;
  assign layer1_weights[1] = 16'b11111_10000111100;
  assign layer1_weights[0] = 16'b00010_00010101101;
  assign layer1_bias = 16'b00001_01100110010;
  

  
	localparam SIZE = 3;
	localparam [SIZE-1:0]      idle = 3'h0,
										init = 3'h1,
										check1 = 3'h2,
										check2 = 3'h3,
										dec1 = 3'h4,
										dec2 = 3'h5,
										store1 = 3'h6,
										store2 = 3'h7,
										store3 = 3'h8;
	
	reg [SIZE-1:0] state_reg, state_next;
	reg 				rdy_next;
	
	
	reg  [N-1:0] inp,inp_next;
	reg  [N-1:0] i, i_next;
	reg  [N-1:0] res_next;
	reg  [N-1:0] cnt,cnt_next;
	reg  [N-1:0] acc,acc_next;	
	reg  [N-1:0] w_next;
	reg  [N-1:0] bias_next;
	

  
  // State register
  always@(posedge clk, posedge rst) begin
  		if (rst) begin
			state_reg <= idle;
			rdy		 <= 1'b0;
			
		end
		else if (ena) begin
			state_reg <= state_next;
			rdy		 <= rdy_next;
		end
	end
	
	// Registers
	always@(posedge clk, posedge rst) begin
		if (rst) begin
			inp <= {(N){1'b0}};
			res	<= {(N){1'b0}};
			cnt  <= {(N){1'b0}};
			acc  <= {(N){1'b0}};
			i  <= {(N){1'b0}};
			
		end
		else if (ena) begin
			inp	<= inp_next;
			res 	<= res_next;
			cnt  <= cnt_next;
			acc  <= acc_next;
			i  <= i_next;
		end		
	end
	
	// Next state logic
	always@(*) 
		case(state_reg)
			idle 	 : if (start) state_next = init;
					   else		  state_next = idle;
			init 	 : state_next = check1;
			check1  : if (inp[N-1] == 1)
						state_next = dec1;
						else
						state_next = dec2;
			dec1 	 : state_next = dec2;
			dec2 	 : state_next = check2;
			check2 : if (cnt == 0)
						state_next = store1;
						else
						state_next = check1;
			store1 : state_next = store2;
			store2 : state_next = store3;
			store3 : state_next = idle;
			default: state_next = idle;
		endcase	
		
	// Microoperation logic
	always@(*) begin
		inp_next   = inp;
		w_next   = layer1_weights[i];
		res_next	= res;
		rdy_next	= 1'b0;
		cnt_next = cnt;
		acc_next = acc;
		i_next = i;
		bias_next = layer1_bias;
	
		case(state_reg)
			init		:	begin
								inp_next 	= data;
								w_next 	= layer1_weights[i];
								bias_next = layer1_bias;
								cnt_next = 16'b0000000000010000;
								acc_next = {(N){1'b0}};
								i_next = {(N){1'b0}};
							end
			dec1		:  acc_next = acc + layer1_weights[15-i];
			dec2		:	begin
							inp_next = inp << 1;
							cnt_next = cnt - 1'b1;
							i_next = i + 1'b1;
							end
			store1 	:	begin
								res_next = acc;
							end
			store2   :  begin
								res_next = res + layer1_bias;
							end
			store3   :  begin
								if (res >= 0)
									res_next = res;
								else 
								res_next = 16'b0000000000000000;
								rdy_next = 1'b1;
							end
			default	: 	;//rdy_next	 = 1'b0;						
		endcase
	end

endmodule 