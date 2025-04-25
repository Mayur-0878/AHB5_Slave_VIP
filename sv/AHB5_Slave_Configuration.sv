class AHB5_Slave_configure;
 
//Below parameter are for configuration of length of address and data bus
 //parameter Haddr_size=32;
 //parameter Hdata_size=32;
  logic [31:0]mem[bit];
  logic [31:0]configaddr; 
  logic [31:0]configdata;
  task configmem;
    for(int i=0;i<11;i++)begin
       mem[i]=i+8;
    $display($time,mem[i]);
      end
  endtask

endclass
