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
  output reg [39:0]  res,
  output reg        rdy
);
	

  wire signed [N-1:0] layer1_weights [N-1:0][5:0];
  wire signed [N-1:0] layer1_bias[5:0];
  wire signed [N-1:0] layer2_weights [5:0][2:0];
  wire signed [N-1:0] layer2_bias[2:0];
  
  
  
  assign layer1_weights[15][0] = 16'b000010_0001010111;
  assign layer1_weights[14][0] = 16'b111111_1000101110;
  assign layer1_weights[13][0] = 16'b111111_1000101000;
  assign layer1_weights[12][0] = 16'b000010_0001010110;
  assign layer1_weights[11][0] = 16'b111111_1000011001;
  assign layer1_weights[10][0] = 16'b000010_0001011100;
  assign layer1_weights[9][0] = 16'b000010_0001010101;
  assign layer1_weights[8][0] = 16'b111111_1000101000;
  assign layer1_weights[7][0] = 16'b111111_1000101000;
  assign layer1_weights[6][0] = 16'b000010_0001011010;
  assign layer1_weights[5][0] = 16'b000010_0001010101;
  assign layer1_weights[4][0] = 16'b111111_1000100001;
  assign layer1_weights[3][0] = 16'b000010_0001010110;
  assign layer1_weights[2][0] = 16'b111111_1000101110;
  assign layer1_weights[1][0] = 16'b111111_1000011110;
  assign layer1_weights[0][0] = 16'b000010_0001010110;
 
  assign layer1_weights[15][1] = 16'b111111_0100100111;
  assign layer1_weights[14][1] = 16'b111111_0100000001;
  assign layer1_weights[13][1] = 16'b111111_0100000000;
  assign layer1_weights[12][1] = 16'b111111_0100101001;
  assign layer1_weights[11][1] = 16'b111111_0100000001;
  assign layer1_weights[10][1] = 16'b111111_0100100111;
  assign layer1_weights[9][1] = 16'b111111_0100100111;
  assign layer1_weights[8][1] = 16'b111111_0100000000;
  assign layer1_weights[7][1] = 16'b111111_0011111111;
  assign layer1_weights[6][1] = 16'b111111_0100101001;
  assign layer1_weights[5][1] = 16'b111111_0100101000;
  assign layer1_weights[4][1] = 16'b111111_0011111111;
  assign layer1_weights[3][1] = 16'b111111_0100100110;
  assign layer1_weights[2][1] = 16'b111111_0100000000;
  assign layer1_weights[1][1] = 16'b111111_0100000000;
  assign layer1_weights[0][1] = 16'b111111_0100100111;

  assign layer1_weights[15][2] = 16'b000000_0011000110;
  assign layer1_weights[14][2] = 16'b000010_1110110101;
  assign layer1_weights[13][2] = 16'b000010_1100000000;
  assign layer1_weights[12][2] = 16'b000000_0001011010;
  assign layer1_weights[11][2] = 16'b000010_1000101100;
  assign layer1_weights[10][2] = 16'b000000_0001101011;
  assign layer1_weights[9][2] = 16'b000000_0001000101;
  assign layer1_weights[8][2] = 16'b000010_1100000101;
  assign layer1_weights[7][2] = 16'b000010_1100000100;
  assign layer1_weights[6][2] = 16'b000000_0000100100;
  assign layer1_weights[5][2] = 16'b111111_1010001101;
  assign layer1_weights[4][2] = 16'b000010_1011101011;
  assign layer1_weights[3][2] = 16'b000000_0011001111;
  assign layer1_weights[2][2] = 16'b000010_1001101110;
  assign layer1_weights[1][2] = 16'b000010_1001011001;
  assign layer1_weights[0][2] = 16'b111111_1111011000;
  
  assign layer1_weights[15][3] = 16'b1111111100011101;
  assign layer1_weights[14][3] = 16'b1111110111100110;
  assign layer1_weights[13][3] = 16'b111111_0111100110;
  assign layer1_weights[12][3] = 16'b111111_1100011101;
  assign layer1_weights[11][3] = 16'b111111_0111100110;
  assign layer1_weights[10][3] = 16'b111111_1100011101;
   assign layer1_weights[9][3] = 16'b111111_1100011101;
   assign layer1_weights[8][3] = 16'b000001_0001010011;
   assign layer1_weights[7][3] = 16'b111111_0111100110;
   assign layer1_weights[6][3] = 16'b111111_1100011101;
   assign layer1_weights[5][3] = 16'b111111_1100011110;
   assign layer1_weights[4][3] = 16'b111111_0111100110;
   assign layer1_weights[3][3] = 16'b111111_1100011111;
   assign layer1_weights[2][3] = 16'b000001_0001010011;
   assign layer1_weights[1][3] = 16'b111111_0111100110;
   assign layer1_weights[0][3] = 16'b111111_1100011111;

  assign layer1_weights[15][4] = 16'b000000_1110001011;
  assign layer1_weights[14][4] = 16'b111101_1000111101;
  assign layer1_weights[13][4] = 16'b111101_0111001110;
  assign layer1_weights[12][4] = 16'b000000_1101001000;
  assign layer1_weights[11][4] = 16'b111101_0101010011;
  assign layer1_weights[10][4] = 16'b000000_1101010010;
   assign layer1_weights[9][4] = 16'b000000_1100111011;
   assign layer1_weights[8][4] = 16'b111101_0111011000;
   assign layer1_weights[7][4] = 16'b111101_0111010010;
   assign layer1_weights[6][4] = 16'b000000_1100100111;
   assign layer1_weights[5][4] = 16'b000000_1000101111;
   assign layer1_weights[4][4] = 16'b111101_0111000101;
   assign layer1_weights[3][4] = 16'b000000_1110010000;
   assign layer1_weights[2][4] = 16'b111101_0101111011;
   assign layer1_weights[1][4] = 16'b111101_0101101011;
   assign layer1_weights[0][4] = 16'b000000_1011111000;
  
  assign layer1_weights[15][5] = 16'b000001_0001111001;
  assign layer1_weights[14][5] = 16'b111111_1011001111;
  assign layer1_weights[13][5] = 16'b111111_1010111101;
  assign layer1_weights[12][5] = 16'b000001_0001101011;
  assign layer1_weights[11][5] = 16'b111111_1010110101;
  assign layer1_weights[10][5] = 16'b000001_0001100011;
   assign layer1_weights[9][5] = 16'b000001_0001100111;
   assign layer1_weights[8][5] = 16'b111111_1001101011;
   assign layer1_weights[7][5] = 16'b111111_1010111110;
   assign layer1_weights[6][5] = 16'b000001_0001011011;
   assign layer1_weights[5][5] = 16'b000001_0000100111;
   assign layer1_weights[4][5] = 16'b111111_1011000110;
   assign layer1_weights[3][5] = 16'b000001_0001111010;
   assign layer1_weights[2][5] = 16'b111111_1001010111;
   assign layer1_weights[1][5] = 16'b111111_1010110100;
   assign layer1_weights[0][5] = 16'b000001_0001010110;
  
  assign layer1_bias[0] = 16'b000001_0110011001;
  assign layer1_bias[1] = 16'b000101_1011101001;
  assign layer1_bias[2] = 16'b111111_0010110010;
  assign layer1_bias[3] = 16'b000000_0111011101;
  assign layer1_bias[4] = 16'b111111_0110110101;
  assign layer1_bias[5] = 16'b000010_0110001000;

  assign layer2_weights[5][0] = 16'b101110_1111100110;
  assign layer2_weights[4][0] = 16'b110100_0001110000;
  assign layer2_weights[3][0] = 16'b000010_1100110101;
  assign layer2_weights[2][0] = 16'b111001_1011001110;
  assign layer2_weights[1][0] = 16'b111111_1010011000;
  assign layer2_weights[0][0] = 16'b110101_1001101010;

  assign layer2_weights[5][1] = 16'b000001_0000010000;
  assign layer2_weights[4][1] = 16'b101101_0001111100;
  assign layer2_weights[3][1] = 16'b111100_0000011100;
  assign layer2_weights[2][1] = 16'b111101_1011000011;
  assign layer2_weights[1][1] = 16'b000100_1000110111;
  assign layer2_weights[0][1] = 16'b111111_1011101101;

  assign layer2_weights[5][2] = 16'b111111_1010111011;
  assign layer2_weights[4][2] = 16'b010100_0001100010;
  assign layer2_weights[3][2] = 16'b000001_0010111010;
  assign layer2_weights[2][2] = 16'b000111_0000011011;
  assign layer2_weights[1][2] = 16'b111011_1110011000;
  assign layer2_weights[0][2] = 16'b000000_0101110000;
  
  assign layer2_bias[0] = 16'b111111_1111110011;
  assign layer2_bias[1] = 16'b111111_0000010011;
  assign layer2_bias[2] = 16'b000000_1000001111;
  

  
	localparam SIZE = 5;
	localparam [SIZE-1:0]      idle = 4'h0,
										init = 4'h1,
										check1 = 4'h2,
										check2 = 4'h3,
										dec1 = 4'h4,
										dec2 = 4'h5,
										store2 = 4'h6,
										checkrel = 4'h7,
										dec3 = 4'h8,
										check3 = 4'h9,
										dec4 = 4'hA,
										store3 = 4'hB,
										dec5 = 4'hC,
										dec6 = 4'hD;
	
	reg [SIZE-1:0] state_reg, state_next;
	reg 				rdy_next;
	
	
	reg  [N-1:0] inp,inp_next;
	reg  [N-1:0] i, i_next;
	reg  [N-1:0] res_next;
	reg  [N-1:0] cnt,cnt_next;
	reg  [19:0] acc,acc_next;	
	reg  [N-1:0] j, j_next;
	reg  [19:0] layer1_out0, layer1_out0_next;
	reg  [19:0] layer1_out1, layer1_out1_next;	
	reg  [19:0] layer1_out2, layer1_out2_next;
	reg  [19:0] layer1_out3, layer1_out3_next;
	reg  [19:0] layer1_out4, layer1_out4_next;
	reg  [19:0] layer1_out5, layer1_out5_next;
	reg  [N-1:0] cnt2, cnt2_next;
	reg  [39:0] out0, out0_next;
	reg  [39:0] out1, out1_next;
	reg  [39:0] out2, out2_next;

  
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
			j  <= {(N){1'b0}};
			layer1_out0  <= {(20){1'b0}};
			layer1_out1  <= {(20){1'b0}};
			layer1_out2  <= {(20){1'b0}};
			layer1_out3  <= {(20){1'b0}};
			layer1_out4  <= {(20){1'b0}};
			layer1_out5  <= {(20){1'b0}};
			out0  <= {(40){1'b0}};
			out1  <= {(40){1'b0}};
			out2  <= {(40){1'b0}};
			cnt2  <= {(N){1'b0}};
			
		end
		else if (ena) begin
			inp	<= inp_next;
			res 	<= res_next;
			cnt  <= cnt_next;
			acc  <= acc_next;
			i  <= i_next;
			j  <= j_next;
			layer1_out0 <= layer1_out0_next;
			layer1_out1 <= layer1_out1_next;	
			layer1_out2 <= layer1_out2_next;
			layer1_out3 <= layer1_out3_next;
			layer1_out4 <= layer1_out4_next;
			layer1_out5 <= layer1_out5_next;
			cnt2  <= cnt2_next;
			out0  <= out0_next;
			out1  <= out1_next;
			out2  <= out2_next;
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
						state_next = store2;
						else
						state_next = check1;
			store2 : state_next = checkrel;
			checkrel : state_next = dec3;
			dec3   : state_next = check3;
			check3 : if (cnt2 == 0)                
						state_next = dec5;
						else
						state_next = dec4;
			dec4   : state_next = check1;
			dec5   : state_next = dec6;
			dec6   : state_next = store3;
			store3 : state_next = idle;
			default: state_next = idle;
		endcase
		
	// Microoperation logic
	always@(*) begin
		inp_next   = inp;
		res_next	= res;
		rdy_next	= 1'b0;
		cnt_next = cnt;
		acc_next = acc;
		i_next = i;
		j_next = j;
		layer1_out0_next = layer1_out0;
		layer1_out1_next = layer1_out1;	
		layer1_out2_next = layer1_out2;
		layer1_out3_next = layer1_out3;
		layer1_out4_next = layer1_out4;
		layer1_out5_next = layer1_out5;
		cnt2_next = cnt2;
		out0_next = out0;
		out1_next = out1;
		out2_next = out2;
		
		
	
		case(state_reg)
			init		:	begin
								inp_next 	= data;
								cnt_next = 16'b0000000000010000;
								acc_next = {(20){1'b0}};
								i_next = {(N){1'b0}};
								j_next = {(N){1'b0}};
								cnt2_next = 16'b0000000000000101;
							end
			dec1		:  acc_next = acc + layer1_weights[15-i][5-j];
			dec2		:	begin
							inp_next = inp << 1;
							cnt_next = cnt - 1'b1;
							i_next = i + 1'b1;
							end
			store2   :  begin
								acc_next = acc + layer1_bias[5-j];
							end
			checkrel :  begin
								if (acc >= 0)
									acc_next = acc;
								else 
									acc_next = 16'b0000000000000000;
							end
			dec3     :  begin 
								if (j == 0)
									layer1_out0_next = acc;
								else if (j == 1)
									layer1_out1_next = acc;
								else if (j == 2)
									layer1_out2_next = acc;
								else if (j == 3)
									layer1_out3_next = acc;
								else if (j == 4)
									layer1_out4_next = acc;
								else
									layer1_out5_next = acc;
							end
			dec4     :  begin
							i_next = {(N){1'b0}};
							cnt_next = 16'b0000000000010000;
							j_next = j + 1'b1;
							acc_next = {(20){1'b0}};
							inp_next = data;
							cnt2_next = cnt2 - 1'b1;      
							end
			dec5      : begin
							out0_next = layer1_out0 * layer2_weights[0][2] + layer1_out1 * layer2_weights[1][2] + layer1_out2 * layer2_weights[2][2] + layer1_out3 * layer2_weights[3][2] + layer1_out4 * layer2_weights[4][2] + layer1_out5 * layer2_weights[5][2] + layer2_bias[2];
							out1_next = layer1_out0 * layer2_weights[0][1] + layer1_out1 * layer2_weights[1][1] + layer1_out2 * layer2_weights[2][1] + layer1_out3 * layer2_weights[3][1] + layer1_out4 * layer2_weights[4][1] + layer1_out5 * layer2_weights[5][1] + layer2_bias[1];
							out2_next = layer1_out0 * layer2_weights[0][0] + layer1_out1 * layer2_weights[1][0] + layer1_out2 * layer2_weights[2][0] + layer1_out3 * layer2_weights[3][0] + layer1_out4 * layer2_weights[4][0] + layer1_out5 * layer2_weights[5][0] + layer2_bias[0];
							end
			dec6     :  begin 
								if (out1 >= out0 && out1 >= out2)
								res_next = 2'b01;    //x
								else if (out2 >= out0 && out2 >= out1 && out1 >= out0)
								res_next = 2'b0;    //o
								else 
								res_next = 2'b10;    // brak
							end
			store3   :  rdy_next = 1'b1;
			default	: 	;//rdy_next	 = 1'b0;						
		endcase
	end

endmodule 