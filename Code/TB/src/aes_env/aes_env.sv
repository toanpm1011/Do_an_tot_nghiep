class aes_env extends uvm_env;
	`uvm_component_utils(aes_env)

	virtual aes_intf vif;
	aes_decrypt_agent decrypt_agent;
	aes_encrypt_agent encrypt_agent;
	aes_scoreboard scb;
//-----------------------------------------------------------------------------
// function : new
//-----------------------------------------------------------------------------
	function new (string name = "aes_env", uvm_component parent = null);
		super.new(name, parent);
	endfunction 
//-----------------------------------------------------------------------------
// function : build_phase
//-----------------------------------------------------------------------------
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if (!uvm_config_db #(virtual aes_intf)::get (this, "", "vif", vif)) begin
       `uvm_error (get_type_name (), "DUT interface not found");
    end
    scb = dti_uart_scoreboard::type_id::create("scb",this);
  	tx_agent = dti_uart_tx_agent::type_id::create("tx_agent",this);
  	rx_agent = dti_uart_rx_agent::type_id::create("rx_agent",this);
  endfunction
//-----------------------------------------------------------------------------
// function : connect_phase
//-----------------------------------------------------------------------------
  function void connect_phase(uvm_phase phase);
  	super.connect_phase(phase);
  	tx_agent.monitor.tx_ap_port.connect(scb.tx_ap_imp);
  	rx_agent.monitor.rx_ap_port.connect(scb.rx_ap_imp);
	endfunction 

endclass