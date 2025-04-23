/*`include "../sv/AHB5_Slave_Transaction.sv"
`include "../sv/AHB5_Slave_generator.sv"
`include "../sv/AHB5_Slave_Driver.sv"
`include "../sv/AHB5_Slave_Monitor.sv"
`include "../sv/AHB5_Slave_Scoreboard.sv"
`include "../sv/AHB5_Slave_Dummy_master.sv"
*/

import AHB5_Slave_package :: *;
class AHB5_Slave_Environment;

  AHB5_Slave_Generator Gen;
  AHB5_Slave_Dummy_master Dummy;
  AHB5_Slave_Transaction Trans,Tran1;
  AHB5_Slave_Driver Drive;
  AHB5_Slave_Monitor Montr;
  AHB5_Slave_Scoreboard Scrbd;
  mailbox Gen_to_drive=new(4);
  mailbox Montr_to_Scorbd=new(4);
  virtual AHB5_Slave_Interface Slave_intf;
  
  function new(virtual AHB5_Slave_Interface Slave_intf);
    //Gen=new(Gen_to_drive,100);
    Dummy=new(Slave_intf,10);
    Drive=new(Slave_intf,Gen_to_drive);
    Montr=new(Slave_intf,Montr_to_Scorbd);
    Scrbd=new(Montr_to_Scorbd);
  endfunction
  
  task run;
    fork
      //Gen.Generate();
      //Drive.Without_Master();
      Dummy_M.Generate;
      Montr.monitor();
      Scrbd.check();
    join_any
  endtask
  
endclass 
