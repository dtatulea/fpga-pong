
vga_sync:
	ghdl -a vga_sync.vhd

tb:
	ghdl -a vga_sync_tb.vhd
	ghdl -e vga_sync_tb

checkers:
	ghdl -a vga_rgb_checkers
	ghdl -e vga_rgb_checkers
clean:
	rm *.o
	rm vga_sync_tb
	rm *.cf
