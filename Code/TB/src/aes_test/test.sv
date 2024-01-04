class aes_test extends  uvm_test;
  `uvm_component_utils(aes_test)

  aes_decrypt_sequence decrypt_seq;
  aes_encrypt_sequence encrypt_seq;
  aes_env              env;
//-----------------------------------------------------------------------------
// function : new
//-----------------------------------------------------------------------------
  function new (string name = "aes_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
//-----------------------------------------------------------------------------
// function : build_phase
//-----------------------------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env    = aes_env::type_id::create("env",this);
  endfunction
//-----------------------------------------------------------------------------
// task: run_phase
//-----------------------------------------------------------------------------
  task run_phase(uvm_phase phase);
      decrypt_seq = new("decrypt_seq");
      encrypt_seq = new("encrypt_seq");
    super.run_phase(phase);
    phase.raise_objection(this);

    fork
      //decrypt_seq.start(env.decrypt_agent.sequencer);
      encrypt_seq.start(env.encrypt_agent.sequencer);
    join

    phase.drop_objection(this);
  endtask


endclass : aes_test