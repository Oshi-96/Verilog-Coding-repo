
module testbed;
    reg A, B;
    wire Bo, S;
    integer i;

    halfsub hs1(Bo, S, A, B);

    initial
    begin
        A <= 0;
        B <= 0;
        $monitor($time, " A = %b , B = %b, Sub = %b, Borrow - %b", A, B, S, Bo);
        for (i = 0 ; i < 4 ; i = i + 1)
            begin
                {A, B} = i ;
                #10;
            end
    end
endmodule

module halfsub(Bo, S, A, B);
    input A, B;
    output Bo, S;
    
    assign {Bo, S} = A - B ;
endmodule