class AHB5_Slave_Driver;
  virtual AHB5_Slave_Interface Slave_intf;
  mailbox Gen_to_drive;
  AHB5_Slave_Transaction Trans;
  AHB5_Slave_configure configr;
  bit [31:0]TempHaddr;
  logic TempHwrite;
  bit [31:0]TempHwdata;
  bit [31:0]TempHrdata;

  function new(virtual AHB5_Slave_Interface Slave_intf,mailbox Gen_to_drive); 
    this.Slave_intf=Slave_intf;
    this.Gen_to_drive=Gen_to_drive;
    configr=new();
  endfunction
  

  task Drives;
    forever begin
     Gen_to_drive.get(Trans);
    end
  endtask



  task response;
    forever @(posedge Slave_intf.Hclk)fork
      readycheck;
    join
  endtask
  

  task readycheck;
    if(Slave_intf.Hready==1)
      begin
        TempHaddr<=Slave_intf.Haddr;
        TempHwrite<=Slave_intf.Hwrite; 	
        TempHwdata<=Slave_intf.Hwdata;
        Slave_intf.Hrdata<=TempHrdata;
  $display("[%0t]inside of driver  Hready=%0d Hwdata=%0d Hwrite=%0d  Temphaddr=%0d  Temphwrite=%0d Temphwdata=%0d",$time,Slave_intf.Hready,Slave_intf.Hwdata,Slave_intf.Hwrite,TempHaddr,TempHwrite,TempHwdata);
                      
        if(TempHwrite==1)
          begin
             configr.mem[TempHaddr]=TempHwdata;
             $display("%0p ",configr.mem);
          end
        else if(TempHwrite==0)
          begin
             configr.configdata<=TempHwdata;
             configr.configaddr<=TempHaddr;
            TempHrdata=configr.mem[TempHaddr];
    if(Slave_intf.Hready==1)
            $display("[%0t] hrdata=%0d",$time,TempHrdata);
          end
      end
      
  endtask 
endclass
 
