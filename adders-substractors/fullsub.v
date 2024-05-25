
module testbed;
    reg A, B, Bi;
    wire Bo, S;
    integer i;

    halfsub hs1(Bo, S, A, B, Bi);

    initial
    begin
        A <= 0;
        B <= 0;
        $monitor($time, " A = %b , B = %b, Bi = %b, Sub = %b, Borrow - %b", A, B, Bi, S, Bo);
        for (i = 0 ; i < 8 ; i = i + 1)
            begin
                {A, B, Bi} = i ;
                #10;
            end
    end
endmodule

module halfsub(Bo, S, A, B, Bi);
    input A, B, Bi;
    output Bo, S;
    
    assign {Bo, S} = A - B - Bi;
endmodule