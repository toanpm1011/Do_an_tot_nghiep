class aes_encrypt_agent extends uvm_agent;

	`uvm_component_utils(aes_encrypt_agent)

	aes_encrypt_driver driver;
	aes_encrypt_monitor monitor;
	aes_encrypt_sequencer sequencer;

//-----------------------------------------------------------------------------
// function :new
//-----------------------------------------------------------------------------
	function new (string name = "aes_encrypt_agent", uvm_component parent = null);
		super.new (name, parent);
	endfunction : new 
//-----------------------------------------------------------------------------
// function : build_phase
//-----------------------------------------------------------------------------
	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		driver = aes_encrypt_driver::type_id::create("driver",this);
		monitor = aes_encrypt_monitor::type_id::create("monitor",this);
		sequencer = aes_encrypt_sequencer::type_id::create("sequencer",this);
	endfunction :build_phase
//-----------------------------------------------------------------------------
// function : connect_phase
//-----------------------------------------------------------------------------
	function void connect_phase (uvm_phase phase);
		super.connect_phase(phase);
		driver.seq_item_port.connect(sequencer.seq_item_export);
	endfunction : connect_phase

endclass : aes_encrypt_agent