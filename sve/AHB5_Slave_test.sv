`include "../sv/AHB5_Slave_Environment.sv"

//import AHB5_Slave_package :: *;
AHB5_Slave_Environment Env;

program test(AHB5_Slave_Interface Slave_intf);

  initial begin
    Env=new(Slave_intf);
    Env.run();
  end

endprogram
    
