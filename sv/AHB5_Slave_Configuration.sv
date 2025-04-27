class AHB5_Slave_configure;
 
//Below parameter are for configuration of length of address and data bus
 //parameter Haddr_size=32;
 //parameter Hdata_size=32;
  logic [31:0]mem[bit[31:0]];
  bit [31:0]configaddr; 
  bit [31:0]configdata;

endclass
