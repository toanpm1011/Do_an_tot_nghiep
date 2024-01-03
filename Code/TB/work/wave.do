onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dti_uart_tb_top/vif/SYS_FREQ
add wave -noupdate /dti_uart_tb_top/vif/BAUD_RATE
add wave -noupdate /dti_uart_tb_top/vif/DATA_SIZE
add wave -noupdate /dti_uart_tb_top/vif/clk
add wave -noupdate /dti_uart_tb_top/vif/reset_n
add wave -noupdate /dti_uart_tb_top/vif/din
add wave -noupdate /dti_uart_tb_top/vif/send_req
add wave -noupdate /dti_uart_tb_top/vif/tx
add wave -noupdate /dti_uart_tb_top/vif/send_ack
add wave -noupdate /dti_uart_tb_top/vif/rx
add wave -noupdate /dti_uart_tb_top/vif/recv_ack
add wave -noupdate /dti_uart_tb_top/vif/dout
add wave -noupdate /dti_uart_tb_top/vif/recv_req
add wave -noupdate /dti_uart_tb_top/vif/frame_tx
add wave -noupdate /dti_uart_tb_top/vif/rx_frame
add wave -noupdate /dti_uart_tb_top/vif/bit_time
add wave -noupdate -divider TRANS
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/SYS_FREQ
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/BAUD_RATE
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/SAMPLE
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/CLOCK
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/BAUD_DV
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/DATA_SIZE
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/BIT_COUNT_SIZE
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/IDLE
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/SENDING
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/clk
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/reset_n
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/din
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/tx
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/send_req
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/send_ack
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/tx_shift_reg
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/bit_count
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/bit_count_done
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/load_tx_shift_reg
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/shift
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/clear
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/state
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/next_state
add wave -noupdate /dti_uart_tb_top/DUT/uart_transmitter/count_clk
add wave -noupdate -divider RECV
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/SYS_FREQ
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/BAUD_RATE
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/SAMPLE
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/CLOCK
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/BAUD_DV
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/DATA_SIZE
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/BIT_COUNT_SIZE
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/IDLE
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/RECEIVING
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/WAIT_ACK
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/clk
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/reset_n
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/rx
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/dout
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/recv_req
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/recv_ack
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/check_start
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/bit_count
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/bit_count_done
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/load_rx_shift_reg
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/clear
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/start
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/count_clk
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/count_sample_clk
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/state
add wave -noupdate /dti_uart_tb_top/DUT/uart_receiver/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1673 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {29469 ps}
