class AHB5_Slave_Transaction;

  mailbox Gen_to_Driv;
  logic Hreadyout;
  logic Hresp;
  logic[31:0]Hrdata;
  logic Hselx;
  logic [31:0]Haddr;
  logic[31:0]Hwdata;
  logic Hwrite;
  logic [2:0]Hsize;
  logic [2:0]Hburst;
  logic [3:0]Hprot;
  logic [1:0]Htrans;
  logic Hmastlock;
  logic Hready;
  
   

endclass
