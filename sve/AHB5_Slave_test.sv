`include "../sv/AHB5_Slave_Environment.sv"
`include "write_and_read.sv"
`include "write_and_read2.sv"
AHB5_Slave_Environment Env;
write_and_read wr;
write_and_read2 wr2;
program test(AHB5_Slave_Interface Slave_intf);

  initial fork
    begin

      if($test$plusargs("First"))begin
      wr=new(Slave_intf); 
      wr.Sanity;
      end

      else if($test$plusargs("Second"))begin
      wr2=new(Slave_intf); 
      wr2.directed;
      end
    end

    Env=new(Slave_intf);
    Env.run();
  
    join
endprogram
    
