module Master(scl,mosi,miso,ss1,ss2,ss3,ss4);
output reg scl;
input [0:0]miso;
output reg [0:0]mosi;
output reg ss1;
output reg ss2;
output reg ss3;
output reg ss4;
reg [16:0]xx;
initial begin
scl = 0;
ss1 = 1;
#10 ss1 = 0;
xx = 17'b010101011_00011001;
end
always @(negedge ss1)
slock ;
always @(posedge scl)begin
mosi = xx[16];
xx = xx<<1;
end
task slock;
repeat (38)
#2 scl = !scl;
endtask: slock;
Slave1 slv1(scl,miso,mosi,ss1);
endmodule
Verilog Code for Slave 
module Slave1(clk,miso,mosi,ss);
input clk;
input [0:0]mosi;
input ss;
output reg[0:0]miso;
reg [7:0] address,data;reg x1;
reg [7:0] arr [0:199];
reg k;
reg [6:0] ione=0;
initial begin
arr[171]=185;
end
always @(mosi)begin
if(ione==0 && ss==0)begin
$display(ione,ss,x1,mosi);
x1 <= mosi;
end
end
always @(posedge clk or mosi)begin
if(ss==0)begin

//******ADDRESS READ***//
if(ione>0 && ione<9)begin
address <= {address,mosi};
end

//******DATA READING****//
if(ione>8 && ione<17 && x1==1)begin
data <= {data,mosi};
end

//*********DATA SENDING TO MASTER MISO***//
else if(ione>8 && ione<17 && x1==0)begin
miso <= arr[address][7];
arr[address]<=arr[address]<<1;
if(ione==16)
miso<=1'bx1;
end

//******DATA RECEIVED WRITTEN IN TO THE ADDRESS***//
ione<=ione+1;
if(ione>16 && x1==1)
arr[address]<=data;
end

end
endmodule
