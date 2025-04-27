`include "../sv/AHB5_Slave_Environment.sv"
//`include "write_and_read.sv"
//import AHB5_Slave_package :: *;
AHB5_Slave_Environment Env;
//write_and_read wr;
program test(AHB5_Slave_Interface Slave_intf);

  initial begin
    Env=new(Slave_intf);
     //$display("[%0t]--------o;phyu8k9re  read run successfully",$time);
    Env.run();
     //$display("[%0t]-------------------6ttrszrqsbinside  read run successfully",$time);
  //  wr=new(Slave_intf); 
    // $display("[%0t]-------------------inside  read run successfully",$time);
   // wr.start_test;
   
  end

endprogram
    
