`include "../sv/AHB5_Slave_interface.sv"
`include "../sve/AHB5_Slave_test.sv"
//import AHB5_Slave_package :: *;
module AHB5_Slave_Top;
  bit HRESETn,Hclk;
  AHB5_Slave_Interface Slave_intf(.Hclk(Hclk),.HRESETn(HRESETn));
  test t1(Slave_intf);
  always #5 Hclk=~Hclk;
  initial begin
//    $dumpfile("mb.vcd");
  //  $dumpvars(0,AHB5_Slave_Top);
    #200 $finish;
  end
endmodule
