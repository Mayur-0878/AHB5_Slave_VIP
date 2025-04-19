class AHB5_Slave_Transaction;

  mailbox Gen_to_Driv;
  logic Hreadyout;
  logic Hresp;
  logic[31:0]Hrdata;
  rand logic Hselx;
  rand logic [31:0]Haddr;
  rand logic[31:0]Hwdata;
  rand logic Hwrite;
  rand logic [2:0]Hsize;
  rand logic [2:0]Hburst;
  rand logic [3:0]Hprot;
  rand logic [1:0]Htrans;
  rand logic Hmastlock;
  rand logic Hready;
  

  task display();
    $display("[%0t] Hselx=%0d Haddr=%0d Hwdata=%0d Hwrite=%0d Hsize=%0d Hburst=%0d Hprot=%0d Htrans=%0d Hmastlock=%0d Hready=%0d",$time,Hselx,Haddr,Hwdata,Hwrite,Hsize,Hburst,Hprot,Htrans,Hmastlock,Hready);
  endtask


endclass
