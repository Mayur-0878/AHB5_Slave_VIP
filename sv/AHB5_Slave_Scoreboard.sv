class AHB5_Slave_Scoreboard;
  mailbox Montr_to_Scorbd;
  AHB5_Slave_Transaction Tran1;
  
  reg [31:0]Mem[logic];

  function new(mailbox Montr_to_Scorbd);
    this.Montr_to_Scorbd=Montr_to_Scorbd;
  endfunction

  task check;
    forever begin
      Montr_to_Scorbd.get(Tran1);
      Mem[Tran1.Haddr]=Tran1.Hwdata;
    end
  endtask 
  
endclass
