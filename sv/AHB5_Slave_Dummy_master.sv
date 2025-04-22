class  AHB5_Slave_Dummy_master;
  int count;
  virtual AHB5_Slave_Interface Slave_intf;
  rand logic [31:0]Haddr;
  rand logic[31:0]Hwdata;
  rand logic Hwrite;
  rand logic [2:0]Hsize;
  rand logic [2:0]Hburst;
  rand logic [3:0]Hprot;
  rand logic [1:0]Htrans;
  rand logic Hmastlock;
  rand logic Hselx;

  function new(virtual AHB5_Slave_Interface Slave_intf,int count);
    this.count=count;
    this.Slave_intf=Slave_intf;
  endfunction

  task Generate;
    
  forever @(posedge Slave_intf.Hclk) begin    
    repeat(count)begin
      void'(this.randomize());
      Slave_intf.Haddr<=Haddr;  
      Slave_intf.Hwdata <=Hwdata;  
      Slave_intf.Hwrite<=Hwrite;  
      Slave_intf.Hsize<=Hsize;  
      Slave_intf.Hburst<=Hburst;  
      Slave_intf.Hprot<=Hprot;  
      Slave_intf.Htrans<=Htrans;  
      Slave_intf.Hmastlock<=Hmastlock;  
      Slave_intf.Hselx <=Hselx;
    end
  end
  endtask
endclass
