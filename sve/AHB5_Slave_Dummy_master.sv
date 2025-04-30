class  AHB5_Slave_Dummy_master;
  typedef enum{IDLE,READ,WRITE,WAIT} STATE;
 
   STATE my_state;
   //my_state current_state,next_state;


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

  //constraint c1{0<Haddr;Haddr<10;}
  //constraint c2{15<Hwdata;Hwdata<50;}
  
  //this signal for next clock
  logic [31:0]Dummy_TempHaddr;
  logic Dummy_TempHwrite;
  logic [31:0]Dummy_TempHwdata;
  logic [31:0]Dummy_TempHrdata;

  function new(virtual AHB5_Slave_Interface Slave_intf,int count);
    this.count=count;
    this.Slave_intf=Slave_intf;
  endfunction

  task Generate;
       repeat(count)begin
      @(posedge Slave_intf.Hclk)
      void'(this.randomize());
      //$display("[%0t]  Haddr=%0d Hready=%0d Hwrite=%0d Hwdata=%0d",$time,Haddr,Hready,Hwrite,Hwdata);
      Slave_intf.Hready <=Hready;
      transfer();
    
end
  endtask


  task transfer;
    if(Hready==1)
      begin
        Dummy_TempHaddr<=Haddr;
        Dummy_TempHwrite<=Hwrite; 	
        if(Dummy_TempHwrite==1)
          begin
             Slave_intf.Hwdata<=Hwdata;
             Slave_intf.Haddr<=Dummy_TempHaddr;
             Slave_intf.Hwrite<=Dummy_TempHwrite;
             
          end
        else if(Dummy_TempHwrite==0)
          begin
             Slave_intf.Haddr<=Dummy_TempHaddr;
             Slave_intf.Hwrite<=Dummy_TempHwrite;
             Dummy_TempHrdata<=Slave_intf.Hrdata;
          end
      end
    else if(Hready==0)
      begin
           Slave_intf.Haddr<=Dummy_TempHaddr;
           Slave_intf.Hwrite<=Dummy_TempHwrite;
      end
  endtask

//extern task state();

   
endclass

/*
task AHB5_Slave_Dummy_master :: state;
 current_state=IDLE;
  IDLE:
    begin
      if(Slave_intf.Htrans==0)
        begin
          crt_Hwrite<=0;
          crt_Hwdata<=0;
          crt_Hrdata<=0;
          crt_Haddr<=0;
      
        end
      else if(Slave_intf.Htrans==1)
        next_state<=WAIT;
      
    end

  WAIT:
    begin
      if(Slave_intf.Hwrite==1)
        begin
          crt_Hwrite<=Hwrite;
          crt_Hwdata<=Hwdata;
          crt_Hrdata<=Hrdata;
          crt_Haddr<=Haddr;
          next_state<=WRITE;
        end
      else
        begin
          crt_Hwrite<=Hwrite;
          crt_Hwdata<=Hwdata;
          crt_Hrdata<=Hrdata;
          crt_Haddr<=Haddr;
          next_state<=READ;
        end
    end

  READ:
      begin
      Slave_intf.Hwrite<=crt_Hwrite;
      Slave_intf.Hwaddr<=crt_Hwaddr;
      end
    end

  WRITE:
      begin
      Slave_intf.Hwrite<=crt_Hwrite;
      Slave_intf.Hwdata<=crt_Hwdata;
      Slave_intf.Hwaddr<=crt_Hwaddr;
      end


endtask 



*/
