class AHB5_Slave_Monitor;
  virtual AHB5_Slave_Interface Slave_intf;
  mailbox Montr_to_Scorbd;
  AHB5_Slave_Transaction Tran1;
  logic [31:0] TempHaddr;
  logic [31:0] TempHwdata;
  logic TempHwrite;
  
  function new(virtual AHB5_Slave_Interface Slave_intf,mailbox Montr_to_Scorbd);
    this.Slave_intf=Slave_intf;
    this.Montr_to_Scorbd=Montr_to_Scorbd;
  endfunction
  
  task monitor;
    Tran1=new();
    forever @(posedge Slave_intf.Hclk)begin
     Tran1.Hwdata=Slave_intf.Hwdata ;  
     Tran1.Haddr=Slave_intf.Haddr;  
     Tran1.Hwrite=Slave_intf.Hwrite;  
     monitoring();
     Montr_to_Scorbd.put(Tran1);
    end
  endtask
    
   extern task monitoring();
endclass




  task AHB5_Slave_Monitor :: monitoring;
        TempHaddr=Slave_intf.Haddr;
        TempHwrite=Slave_intf.Hwrite; 	
        TempHwdata=Slave_intf.Hwdata;
    if(Slave_intf.Hready==1)
      begin
        TempHaddr=Slave_intf.Haddr;
        TempHwrite=Slave_intf.Hwrite; 	
        TempHwdata=Slave_intf.Hwdata;
      end
    else if(Slave_intf.Hready==0)
      begin
        if(TempHaddr==Slave_intf.Haddr && TempHwrite==Slave_intf.Hwrite && TempHwdata==Slave_intf.Hwdata)begin
end
         $display("pass inside monitor");
end
        else begin
        $display("[%0t]fail inside monitor",$time);
      end
      
  endtask 



