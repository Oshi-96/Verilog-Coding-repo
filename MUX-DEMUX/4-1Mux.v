module testbed;
    reg S0, S1 ;
    reg [3:0] I;
    wire out;

    mux4 m1(.out(out), .I(I), .S0(S0), .S1(S1));

    initial 
    begin
        I = 4'b0101 ;
        $monitor($time, " S0 = %b , S1 = %b, Out = %b", S0, S1, out);
        S1 = 0; S0 = 0 ; #10
        S1 = 0; S0 = 1 ; #10
        S1 = 1; S0 = 0 ; #10
        S1 = 1; S0 = 1 ; #10
        $finish; 

    end
endmodule


module mux4(out, I, S0, S1);
    input [3:0]I;
    input S0, S1;
    output reg out;

    always @(*)

        case({S1, S0})
        0 : out = I[0];
        1 : out = I[1];
        2 : out = I[2];
        3 : out = I[3];
        default : out = 1'bx;
        endcase
endmodule