
module testbed;
    reg [3:0] A, B;
    wire Bo;
    wire [3:0] Sub;
    reg Bi;

    fullsub4 fs4(Bo, Sub, A, B, Bi);

    initial
    begin
 
        $monitor($time, " A = %b , B = %b, Bi = %b, Sub = %b, Borrow - %b", A, B, Bi, Sub, Bo);
        
        A = 0000 ; B = 0001 ; Bi = 1 ;
        #10
        A = 1111 ; B = 0100 ; Bi = 0 ;
        #10
        $finish;
    end
endmodule

module fullsub4(Bo, Sub, A, B, Bi);
    input [3:0] A, B;
    input Bi;
    output [3:0] Sub;
    output Bo;
     
    //reg [3:0] Sub;

    assign {Bo, Sub} = A - B - Bi;
endmodule