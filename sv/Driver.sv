class AHB5_Slave_Driver;
  virtual AHB_Interface Slave_intf;
  mailbox Gen_to_drive;
  AHB5_Slave_Transaction Trans;
  bit Hclk;  

  function new(virtual AHB_Interface Slave_intf,mailbox Gen_to_drive); 
    this.Slave_intf=Slave_intf;
    this.Gen_to_drive=Gen_to_drive;
  endfunction
  

  task Without_Master;
   
    forever begin
     Gen_to_drive.get(Trans);
     
     Slave_intf.Hselx <= Trans.Hselx;  
     Slave_intf.Hwdata <= Trans.Hwdata;  
     Slave_intf.Haddr<=Trans.Haddr;  
     Slave_intf.Hwrite<=Trans.Hwrite;  
     Slave_intf.Hsize<=Trans.Hsize;  
     Slave_intf.Hburst<=Trans.Hburst;  
     Slave_intf.Hprot<=Trans.Hprot;  
     Slave_intf.Htrans<=Trans.Htrans;  
     Slave_intf.Hmastlock<=Trans.Hmastlock;  
     Slave_intf.Hready<=Trans.Hready;
    $display("[%0t] Hselx=%0d Haddr=%0d Hwdata=%0d Hwrite=%0d Hsize=%0d Hburst=%0d Hprot=%0d Htrans=%0d Hmastlock=%0d Hready=%0d  in Driver",$time,Trans.Hselx,Trans.Haddr,Trans.Hwdata,Trans.Hwrite,Trans.Hsize,Trans.Hburst,Trans.Hprot,Trans.Htrans,Trans.Hmastlock,Trans.Hready);
    end
  endtask
  
endclass
