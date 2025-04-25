interface AHB5_Slave_Interface(input HRESETn,Hclk); 
 // logic Hselx;
  logic [31:0]Haddr;
  logic Hwrite;
 // logic [2:0]Hburst;
  //logic [3:0]Hprot;
 // logic [1:0]Htrans;
 // logic Hmastlock;
 // logic Hsize;
  logic Hready;
  logic [31:0]Hwdata;
  //logic Hreadyout;
  //logic Hresp;
  logic [31:0]Hrdata;


 /* clocking Slave_clocking @(posedge Hclk);    
    input HRESETn,Hselx, Haddr, Hwrite, Hburst, Hprot, Htrans, Hmastlock, Hready;
    output Hrdata,Hreadyout,Hresp;
  endclocking
*/
endinterface
