`include "../sve/Environment.sv"

AHB_Slave_Environment Env;

program test(AHB_Interface Slave_intf);

  initial begin
    Env=new(Slave_intf);
    Env.run();
  end

endprogram
    
