module cdd;

 // Outputs
 wire [0:0] mosi;
 wire scl;
 wire ss1; 
 wire ss2;
 wire [0:0]miso;
 // Instantiate the Unit Under Test (UUT) 
 Datapath uut ( 
 .miso(miso),   .mosi(mosi),   .scl(scl),   .ss1(ss1),   .ss2(ss2) );
      endmodule
