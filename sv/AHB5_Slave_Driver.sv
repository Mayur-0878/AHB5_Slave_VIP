class AHB5_Slave_Driver;
  virtual AHB5_Slave_Interface Slave_intf;
  mailbox Gen_to_drive;
  AHB5_Slave_Transaction Trans;
  bit Hclk;  
  reg [31:0]mem[logic];

  function new(virtual AHB5_Slave_Interface Slave_intf,mailbox Gen_to_drive); 
    this.Slave_intf=Slave_intf;
    this.Gen_to_drive=Gen_to_drive;
  endfunction
  

  task Drives;
   
    forever begin
     Gen_to_drive.get(Trans);
     Slave_intf.Hrdata<=Trans.Hrdata;  
     Slave_intf.Hresp<=Trans.Hresp;  
     Slave_intf.Hreadyout<=Trans.Hreadyout;
    $display("[%0t]  Hreadyout=%0d Hrdata=%0d Hresp=%0d in Driver",$time,Trans.Hreadyout,Trans.Hrdata,Trans.Hresp);
    end
  endtask
  
endclass
