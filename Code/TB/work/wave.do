onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /aes_tb_top/DUT/clk
add wave -noupdate /aes_tb_top/DUT/reset_n
add wave -noupdate -divider ENCRYPT
add wave -noupdate /aes_tb_top/DUT/plain_text_in
add wave -noupdate /aes_tb_top/DUT/cipher_key_in
add wave -noupdate /aes_tb_top/DUT/cipher_new_en
add wave -noupdate /aes_tb_top/DUT/cipher_text_out
add wave -noupdate /aes_tb_top/DUT/round_key_10_out
add wave -noupdate /aes_tb_top/DUT/cipher_ready
add wave -noupdate -divider DECRYPT
add wave -noupdate /aes_tb_top/DUT/cipher_text_in
add wave -noupdate /aes_tb_top/DUT/round_key_10
add wave -noupdate /aes_tb_top/DUT/decipher_new_en
add wave -noupdate /aes_tb_top/DUT/plain_text_out
add wave -noupdate /aes_tb_top/DUT/decipher_ready
add wave -noupdate -divider CONTROL
add wave -noupdate /aes_tb_top/DUT/en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1449 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
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
WaveRestoreZoom {0 ns} {1577 ns}
