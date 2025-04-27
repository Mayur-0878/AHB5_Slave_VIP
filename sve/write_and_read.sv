`include "AHB5_Slave_Dummy_master.sv"

class write_and_read;
AHB5_Slave_Dummy_master Dummy;
virtual AHB5_Slave_Interface Slave_intf;

  function new(virtual AHB5_Slave_Interface Slave_intf);
     $display("inside 1 testcase");
   Dummy=new(Slave_intf);
  endfunction

 
  task start_test;
     $display("inside testcase");
    Dummy.randomize()with{Hready==1; Hwrite==1; Haddr==2;  Hwdata==8;};
    Dummy.Generate;
     #1;
    
    Dummy.randomize()with{Hready==1; Hwrite==0; Haddr==2;  Hwdata==8;};
    Dummy.Generate;
  endtask
 
endclass 
