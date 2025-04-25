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
  endfunction
  

  task Drives;
   
    forever begin
    $display("[%0t]  Haddr=%0d Hwdata=%0d Hwrite=%0d in Driver",$time,Slave_intf.Haddr,Slave_intf.Hwdata,Slave_intf.Hwrite);
     Gen_to_drive.get(Trans);
    // Slave_intf.Hrdata<=Trans.Hrdata;  
    // Slave_intf.Hresp<=Trans.Hresp;  
     //Slave_intf.Hreadyout<=Trans.Hreadyout;
    //$display("[%0t]  Hreadyout=%0d Hrdata=%0d Hresp=%0d in Driver",$time,Trans.Hreadyout,Trans.Hrdata,Trans.Hresp);
    end
  endtask

  task response;
  configr=new();
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
             configr.configdata<=TempHwdata;
             configr.configaddr<=TempHaddr;
         //    configr.configHwrite<=TempHwrite;
          end
        else if(TempHwrite==0)
          begin
             configr.configdata<=TempHwdata;
             configr.configaddr<=TempHaddr;
            TempHrdata=configr.mem[TempHaddr];
            $display("[%0t] hrdata=%0d",$time,TempHrdata);
          end
      end
    //else
      
  endtask 
endclass
 
