class AHB5_Slave_Scoreboard;
  mailbox Montr_to_Scorbd;
  AHB5_Slave_Transaction Tran1;
  AHB5_Slave_configure configr;
  bit [31:0]Mem[bit];

  function new(mailbox Montr_to_Scorbd,AHB5_Slave_configure configr);
    this.configr=configr;
    this.Montr_to_Scorbd=Montr_to_Scorbd;
  endfunction

  task check;
    forever begin
      
      Montr_to_Scorbd.get(Tran1);
      Mem[Tran1.Haddr]=Tran1.Hwdata;

  //    $display("[%0t] Hreadyout=%0d  Hresp=%0d in Scoreboard",$time,Tran1.Hreadyout,Tran1.Hresp);
    end
  endtask 
  
endclass
