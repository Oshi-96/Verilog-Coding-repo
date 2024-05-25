
module testbed;
    reg [3:0] A, B;
    wire Co;
    wire [3:0] Add;
    reg Ci;

    fulladd4 fa4(Co, Add, A, B, Ci);

    initial
    begin
 
        $monitor($time, " A = %b , B = %b, Ci = %b, Add = %b, Carry - %b", A, B, Ci, Add, Co);
        
        A = 0000 ; B = 0001 ; Ci = 1 ;
        #10
        A = 1111 ; B = 0100 ; Ci = 0 ;
        #10
        $finish;
    end
endmodule

module  fulladd4 (Co, Add, A, B, Ci);

    input [3:0] A, B;
    input Ci;
    output [3:0] Add;
    output Co;
     
    //reg [3:0] Sub;

    assign {Co, Add} = A + B + Ci;
endmodule