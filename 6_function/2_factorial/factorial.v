`timescale 1ns / 1ps

module factorial ();


/* name : factorial
 * param : 8-bit operand
 * return type : integer
 * return : integer result of factorial operation
 */
function automatic integer factorial;
	input [7:0] operand; // 8 bit의 피연산자 값을 받는다.
	if ( operand >= 2 ) factorial = factorial(operand - 1) * operand; // factorial이 2보다 크거나 같을 때, factorial 값에서 -1을 계속 실행
	else factorial = 1; // 그게 아니면 factorial의 값은 1이다. (1끼리만 곱하는 상황)
endfunction

integer result, n;
initial begin
	for ( n=0; n<=15; n=n+1 ) begin // recursive call
		result = factorial(n);
		$display("%0d factorial = %0d || %b", n, result, result);
	end
end
endmodule
