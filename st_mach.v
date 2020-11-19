module st_mach(output reg  out, 
input clk,
input rst,
input in);
parameter S0 = 2'd0;
parameter S1 = 2'd1;
parameter S2 = 2'd2;
parameter S3 = 2'd3;
reg [1:0] state;
reg [1:0] next_state;
always @(posedge clk)
	if(rst)
	begin
		state <= S0;
	end
	else
       	begin
		state <=next_state;
	end
always @(state or in)
begin
    case (state)
    
	   S0: if(in)
	    begin
		    next_state = S1;
		    out = 1'b0;
	    end
	    else
	    begin
	            next_state = state;
		    out = 1'b0;
	    end
	    S1: if (~in)
            begin
                   next_state = S2;
		   out = 1'b0;
            end
	    else
	    begin
		    next_state = state;
		    out = 1'b0;
	    end
	    S2: if(~in)
            begin
		    next_state = S3;
		    out = 1'b0;

	    end
	    else
	    begin
		    next_state = S1;
		    out = 1'b0;
	    end
	    S3: 
		    if(in)
            begin
		    next_state = S0;
		    out = 1'b1;
	    end
		    else
	    begin
		    next_state = S0;
		    out = 1'b0;
	    end
    
   
    endcase
end



endmodule
