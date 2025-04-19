`include "../sv/Transaction.sv"
`include "../sv/generator.sv"
`include "../sv/Driver.sv"
`include "../sv/Monitor.sv"
`include "../sv/Scoreboard.sv"

class AHB_Slave_Environment;

  Generator Gen;
  AHB5_Slave_Transaction Trans,Tran1;
  AHB5_Slave_Driver Drive;
  AHB5_Slave_Monitor Montr;
  AHB5_Slave_Scoreboard Scrbd;
  mailbox Gen_to_drive=new(4);
  mailbox Montr_to_Scorbd=new(4);
  virtual AHB_Interface Slave_intf;
  
  function new(virtual AHB_Interface Slave_intf);
    Gen=new(Gen_to_drive,10);
    Drive=new(Slave_intf,Gen_to_drive);
    Montr=new(Slave_intf,Montr_to_Scorbd);
    Scrbd=new(Montr_to_Scorbd);
  endfunction
  
  task run;
    fork
      Gen.Generate();
      Drive.Without_Master();
      Montr.monitor();
      Scrbd.check();
    join_any
  endtask
  
endclass 
