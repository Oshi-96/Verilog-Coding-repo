module testbed;
    reg A, B, Ci;
    wire C, S ;

    fulladd fa1(C, S, A, B, Ci);
    initial 
    begin
        $monitor($time, " A = %b, B = %b , Ci = %b, Sum = %b, Carry = %b", A, B, Ci, S, C);
        A = 0; B = 0; Ci = 0;
        #10
        A = 0; B = 0; Ci = 1;
        #10
        A = 0; B = 1; Ci = 0;
        #10
        A = 1; B = 0; Ci = 0;
        #10
        A = 0; B = 1; Ci = 0;
        #10
        A = 1; B = 1; Ci = 1;
        #10
        $finish;
    end
endmodule

module fulladd(
    output C, S,
    input A, B, Ci
    );
    
    assign {C, S} = A + B + Ci;
endmodule
