module Datapath(miso,mosi,scl,ss1,ss2);
output [0:0]miso;
output [0:0]mosi;
output ss1,ss2,scl;
wire [0:0]miso1,miso2;
wire [1:0]sel;
Master Mas(scl,mosi,miso,ss1,ss2,sel);
Mux mul(miso1,miso2,miso,sel);
Slave1 slv1(scl,miso1,mosi,ss1);
Slave2 slv2(scl,miso2,mosi,ss2);
