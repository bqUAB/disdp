library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top level implementation
entity lab1 is
   port(
      clk, rst: in STD_LOGIC;
      en, up:     in STD_LOGIC;
      hex0, hex1: out STD_LOGIC_VECTOR(6 downto 0)  -- 2 seven-segment displays
   );
end lab1;

architecture sa of lab1 is   -- Structural architecture (sa)
   constant NUMBER: integer := 6;  -- Bits used by the counter
   signal clk_2Hz: STD_LOGIC;
   signal bin: STD_LOGIC_VECTOR(5 downto 0);
   signal bcd: STD_LOGIC_VECTOR(7 downto 0);
begin
   -- Scale the oscillator
   clock: entity work.so(ba)
   port map(clk_50MHz=>clk, reset=>rst, clk_2Hz=>clk_2Hz);
   
   -- Instantiate the counter
   counter: entity work.ubc(arch)
   generic map(N=>NUMBER)
   port map(clock=>clk_2Hz, reset=>rst, en=>en, up=>up, q=>bin);
   
   -- Instantiate the BCD block
   bin2bcd: entity work.bin2bcd6(ba)
   port map(binary=>bin, bcd=>bcd);
   
   -- instantiate 2 seven-segment displays
   bcd2seven0: entity work.ssdd(tt)
      port map(d => bcd(3 downto 0), ds => hex0);
   bcd2seven1: entity work.ssdd(tt)
      port map(d => bcd(7 downto 4), ds => hex1);
end sa;