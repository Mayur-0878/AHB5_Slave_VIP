class  AHB5_Slave_Dummy_master;
  int count;
  virtual AHB5_Slave_Interface Slave_intf;
  rand bit [31:0]Haddr;
  rand bit Hready;
  rand logic[31:0]Hwdata;
  rand logic Hwrite;
  rand logic [2:0]Hsize;
  rand logic [2:0]Hburst;
  rand logic [3:0]Hprot;
  rand logic [1:0]Htrans;
  rand logic Hmastlock;
  rand logic Hselx;


  //`typedef enum(IDLE,BUSY,NONSEQ,SEQ)Htrans;

  //constraint c1{0<Haddr;Haddr<10;}
  //constraint c2{15<Hwdata;Hwdata<50;}
  
  //this signal for next clock
  logic [31:0]Dummy_TempHaddr;
  logic Dummy_TempHwrite;
  logic [31:0]Dummy_TempHwdata;
  logic [31:0]Dummy_TempHrdata;

  function new(virtual AHB5_Slave_Interface Slave_intf,int count);
   $display("inside driver");
    this.count=count;
$display(count);
    this.Slave_intf=Slave_intf;
  endfunction




  task Generate;
       repeat(count)begin
      @(posedge Slave_intf.Hclk)
      void'(this.randomize());
      Slave_intf.Hready <=Hready;
      transfer();
    
end
  endtask





  task transfer;
    if(Hready==1)
      begin
        Dummy_TempHaddr<=Haddr;
        Dummy_TempHwrite<=Hwrite; 	
        Dummy_TempHwdata<=Hwdata;
        if(Dummy_TempHwrite==1)
          begin
            $display("[%0t],Dummy previous address=%0d hwdata=%0d hwrite=%0d || current address=%0d hwdata=%0d hwrite=%0d",$time,Dummy_TempHaddr,Dummy_TempHwdata,Dummy_TempHwrite,Haddr,Hwdata,Hwrite);
             Slave_intf.Hwdata<=Dummy_TempHwdata;
             Slave_intf.Haddr<=Dummy_TempHaddr;
             Slave_intf.Hwrite<=Dummy_TempHwrite;
             
          end
        else if(Dummy_TempHwrite==0)
          begin
             Slave_intf.Haddr<=Dummy_TempHaddr;
             Slave_intf.Hwrite<=Dummy_TempHwrite;
             Dummy_TempHrdata<=Slave_intf.Hrdata;
             $display("[%0t],when write is zero Dummy previous address=%0d hwdata=%0d hwrite=%0d || current address=%0d hwdata=%0d hwrite=%0d",$time,Dummy_TempHaddr,Dummy_TempHwdata,Dummy_TempHwrite,Haddr,Hwdata,Hwrite);
          end
      end
    else if(Hready==0)
      begin
      end
  endtask


   
  
endclass
