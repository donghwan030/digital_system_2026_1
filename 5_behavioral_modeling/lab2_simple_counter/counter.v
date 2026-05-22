`timescale 1ns / 1ps

module counter (
	// port list
	clk, 
	rst_n, 
	cnt
);

// port delcaration
input wire clk;
input wire rst_n;
output [6:0] cnt; // 0 ~ 128


// behaviral modeling

reg [6:0] cnt; 
always @(posedge clk, negedge rst_n) // reset=active low=negative edge triggered
begin
	if (rst_n == 0) // system off
	begin
		cnt <= 7'b0;
	end
	else if ( cnt < 100) // rst_n == 1, reset release
	begin
		cnt <= cnt + 1;
	end // counts to 100
end
	
endmodule