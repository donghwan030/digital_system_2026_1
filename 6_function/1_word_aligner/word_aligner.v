`timescale 1ns / 1ps

module word_aligner (
	// port list
	word_in, 
	word_out
);

// port declaration
input 	[7:0] word_in		;
output 	[7:0] word_out		;


/* name : word align
 * param : 8-bit binary
 * return type : 1-byte word
 * return : aligned word starting 1
*/
function [7:0] word_align; // function's return type
	input [7:0] word; // parameter
	reg [7:0] temp; // save the incoming parameter
	integer i; // 회로로 합성되는 부분이 아님.

	// fuction logic
	begin
		temp = word;
		if ( temp == 8'b0 || temp[7] == 1'b1 ) // 정렬이 필요하지 않은 상황일 때 : 0000_0000, 1xxx_xxxx
			word_align = temp; // 저장된 register를 그대로 반환
		else // 정렬이 필요한 상황일 때
			for (i=7; i>0; i=i-1 ) begin // 총 7 번 반복
				if ( temp[7] == 0 ) temp = temp << 1; // temp[7]이 0인 상황(맨 앞의 비트가 0인 상황) : 정렬이 필요한 상황 -> temp를 왼쪽으로 1비트씩 이동
				else word_align = temp; // temp[7] == 1(정렬이 완료된 상황)일 때, 저장된 register를 반환
			end
	end
endfunction
	
assign word_out = word_align (word_in);

endmodule
                                                                                      