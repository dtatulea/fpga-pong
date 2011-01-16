library ieee;
use ieee.std_logic_1164.all;
entity vga_sync_tb is
    port (
        hsync, vsync: out  std_logic;
        rgb: out std_logic_vector(2 downto 0)
    );
end vga_sync_tb;

architecture arch of vga_sync_tb is
    signal rgb_reg: std_logic_vector(2 downto 0);
    signal video_on: std_logic;
    signal clk: std_logic;
    signal reset: std_logic;
    signal sw: std_logic_vector(2 downto 0);

begin
    -- instantiate VGA sync circuit
    vga_sync_unit: entity work.vga_sync
    port map(clk=>clk, reset=>reset, hsync=>hsync,
             vsync=>vsync, video_on=>video_on,
             pixel_x=>open, pixel_y=>open);
    reset <= '0';
    sw <= "010";
    process
    begin
        for i in 65535 downto 0 loop
            --  Check each pattern.
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
        end loop;
    end process;

    -- rgb buffer
    process (clk,reset)
    begin
        if reset='1' then
            rgb_reg <= (others=>'0');
        elsif (clk'event and clk='1') then
            rgb_reg <= sw;
        end if;
    end process;

    rgb <= rgb_reg when video_on='1' else "000";
    -- simulate clock

end arch;
