class AHB5_Slave_Driver;
  virtual AHB5_Slave_Interface Slave_intf;
  mailbox Gen_to_drive;
  AHB5_Slave_Transaction Trans;
  AHB5_Slave_configure configr;
  bit [31:0]TempHaddr;
  logic TempHwrite;
  bit [31:0]TempHwdata;
  bit [31:0]TempHrdata;

  function new(virtual AHB5_Slave_Interface Slave_intf,mailbox Gen_to_drive,AHB5_Slave_configure configr); 
    this.Slave_intf=Slave_intf;
    this.configr=configr;
    this.Gen_to_drive=Gen_to_drive;
  endfunction
  

  task Drives;
    forever begin
     Gen_to_drive.get(Trans);
    end
  endtask



  task response;
    forever @(posedge Slave_intf.Hclk)fork
        //$display("[%0t] response task  hready=%0d",$time,Slave_intf.Hready);
      readycheck;
    join
  endtask
  

  task readycheck;
        TempHaddr<=Slave_intf.Haddr;
        TempHwrite<=Slave_intf.Hwrite; 	
        TempHwdata=Slave_intf.Hwdata;
    if(Slave_intf.Hready==1)
      begin
                      
        if(TempHwrite==1)
          begin
             configr.mem[TempHaddr]=TempHwdata;
             $display("%0t hwrite1 in driver %0p",$time,configr.mem);
          end
        else if(TempHwrite==0)
          begin
            Slave_intf.Hrdata=configr.mem[TempHaddr];
            $display("[%0t] hrdata=%0d",$time,configr.mem[TempHaddr]);
          end
      end
      
  endtask 
endclass


