`include "../sve/interface.sv"
`include "../sve/test.sv"

module testbench;
  bit HRESETn,Hclk;
  AHB_Interface Slave_intf(.Hclk(Hclk),.HRESETn(HRESETn));
  test t1(Slave_intf);
  always #5 Hclk=~Hclk;
  initial begin
    $dumpfile("mb.vcd");
    $dumpvars(0,testbench);
    #50 $finish;
  end
endmodule
