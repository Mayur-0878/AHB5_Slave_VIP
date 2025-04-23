class AHB5_Slave_Monitor;
  virtual AHB5_Slave_Interface Slave_intf;
  mailbox Montr_to_Scorbd;
  AHB5_Slave_Transaction Tran1;
  
  function new(virtual AHB5_Slave_Interface Slave_intf,mailbox Montr_to_Scorbd);
    this.Slave_intf=Slave_intf;
    this.Montr_to_Scorbd=Montr_to_Scorbd;
  endfunction
  
  task monitor;
    
    forever @(posedge Slave_intf.Hclk)begin
         Tran1=new();
     
     Montr_to_Scorbd.put(Tran1);
     Tran1.Hready=Slave_intf.Hready;
     Tran1.Hselx=Slave_intf.Hselx ;  
     Tran1.Hwdata=Slave_intf.Hwdata ;  
     Tran1.Haddr=Slave_intf.Haddr;  
     Tran1.Hwrite=Slave_intf.Hwrite;  
     Tran1.Hsize=Slave_intf.Hsize;  
     Tran1.Hburst=Slave_intf.Hburst;  
     Tran1.Hprot=Slave_intf.Hprot;  
     Tran1.Htrans=Slave_intf.Htrans;  
     Tran1.Hmastlock=Slave_intf.Hmastlock;
    $display("[%0t] Hselx=%0d Haddr=%0h Hwdata=%0h Hwrite=%0d Hsize=%0d Hburst=%0d Hprot=%0d Htrans=%0d Hmastlock=%0d Hready=%0d in Monitor",$time,Tran1.Hselx,Tran1.Haddr,Tran1.Hwdata,Tran1.Hwrite,Tran1.Hsize,Tran1.Hburst,Tran1.Hprot,Tran1.Htrans,Tran1.Hmastlock,Tran1.Hready);

    end
  endtask


endclass
