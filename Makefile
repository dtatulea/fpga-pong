
build:
	ghdl -a vga_sync.vhd
	ghdl -a vga_sync_tb.vhd
	ghdl -e vga_sync_tb

clean:
	rm *.o
	rm vga_sync_tb
	rm *.cf
