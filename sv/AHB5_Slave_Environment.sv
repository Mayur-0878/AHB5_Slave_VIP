`include "AHB5_Slave_package.sv"

import AHB5_Slave_package :: *;
class AHB5_Slave_Environment;

  AHB5_Slave_Generator Gen;
  AHB5_Slave_Dummy_master Dummy;
  AHB5_Slave_Transaction Trans,Tran1;
  AHB5_Slave_Driver Drive;
  AHB5_Slave_Driver response;
  AHB5_Slave_Monitor Montr;
  AHB5_Slave_configure configr=new;
  AHB5_Slave_Scoreboard Scrbd;
  mailbox Gen_to_drive=new(4);
  mailbox Montr_to_Scorbd=new(4);
  virtual AHB5_Slave_Interface Slave_intf;
  
  
  function new(virtual AHB5_Slave_Interface Slave_intf);
    Gen=new(Gen_to_drive,100);
    Dummy=new(Slave_intf,80);
    Drive=new(Slave_intf,Gen_to_drive,configr);
    Montr=new(Slave_intf,Montr_to_Scorbd,configr);
    Scrbd=new(Montr_to_Scorbd);
  endfunction
  
  task run;
    fork
     // Gen.Generate();
      Drive.response();
//      Dummy.Generate;
      Montr.monitor();
      Scrbd.check();
    join_any
  endtask
  
endclass 
