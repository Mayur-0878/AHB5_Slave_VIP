class write_and_read2;
AHB5_Slave_Dummy_master Dummy;
virtual AHB5_Slave_Interface Slave_intf;

  function new(virtual AHB5_Slave_Interface Slave_intf);
  this.Slave_intf=Slave_intf;
  endfunction

 
  task directed;

     @(posedge Slave_intf.Hclk);
     for(int i=0;i<=5;i++)
       begin
         Slave_intf.Hready=1;
         Slave_intf.Hwrite=1;
         Slave_intf.Haddr=10+i; 
         #10;
         Slave_intf.Hwdata=1000+i; 
       end

     @(posedge Slave_intf.Hclk);
     for(int i=0;i<=5;i++)
       begin
         Slave_intf.Hready=1;
         Slave_intf.Hwrite=0;
         Slave_intf.Haddr=10+i; 
         #10;
       end
  endtask
 
endclass 
