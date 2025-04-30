class write_and_read;
AHB5_Slave_Dummy_master Dummy;
virtual AHB5_Slave_Interface Slave_intf;

  function new(virtual AHB5_Slave_Interface Slave_intf);
  this.Slave_intf=Slave_intf;
  endfunction

 
  task Sanity;

     @(posedge Slave_intf.Hclk);
     Slave_intf.Hready=1;
     Slave_intf.Hwrite=1;
     Slave_intf.Haddr=2; 
   
     #5;
     @(posedge Slave_intf.Hclk);
    
     Slave_intf.Hready=1;
     Slave_intf.Hwrite=0;
     Slave_intf.Haddr=2; 
     Slave_intf.Hwdata=8;
  endtask
 
endclass 
