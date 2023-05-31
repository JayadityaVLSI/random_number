module tb_rand_num;
	integer even;
	integer odd;
	reg [3:0] one_hot;


	initial begin
		#100 $finish;
	end

	initial begin
		repeat(4) begin
			even = even_func();
                        $display("\tEven number is %0d", even);
			odd = odd_func();
                        $display("\tOdd number is %0d", odd);
			one_hot = one_hot_ran();
                        $display("\tOne hot number is %4b", one_hot);

		end
	end	
	
	function [3:0] one_hot_ran;
		reg [3:0] one_hot;
		one_hot = $random();
		if(((one_hot & (one_hot-1)) == 4'd0) && one_hot != 4'd0)
			return one_hot;
		else
			return	one_hot_ran();
	endfunction
	
	function integer even_func;
		integer even_num;
		even_num = $urandom()%100;
		if(even_num % 2 == 0)
			return even_num;
		else
			return	even_func();
	endfunction

	function integer odd_func;
		integer odd_num;
		odd_num = $urandom()%100;
		if(odd_num % 2 != 0)
			return odd_num;
		else
			return	odd_func();
	endfunction

endmodule


