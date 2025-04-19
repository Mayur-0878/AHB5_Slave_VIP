class Generator;
  int count;
  rand AHB5_Slave_Transaction Trans;
  mailbox Gen_to_drive;

  function new(mailbox Gen_to_drive,int count);
    this.Gen_to_drive=Gen_to_drive;
    this.count=count;
  endfunction

  task Generate;
    repeat(count)begin
    Trans=new();
    void'(Trans.randomize());
    Trans.display;
    Gen_to_drive.put(Trans);
    #7;
    end
  endtask

endclass
