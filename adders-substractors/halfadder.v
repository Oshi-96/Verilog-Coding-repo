
module testbed;
    reg A, B;
    wire sum, carry;
    integer i;

    halfadder HA1(sum, carry, A, B);

    initial
    begin
        A <= 0;
        B <= 0;
        $monitor($time, " A = %b , B = %b, Sum = %b, Carry - %b", A, B, sum, carry);
        for (i = 0 ; i < 4 ; i = i + 1)
            begin
                {A, B} = i ;
                #10;
            end
    end
endmodule


module halfadder(Sum, Carry, A, B);
    input A, B;
    output  Sum, Carry;

    assign {Carry, Sum} = A + B ;
    

endmodule