library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top level implementation
entity disdp_lab1 is
   port(
      clk, rst: in STD_LOGIC;
      en, up:     in STD_LOGIC;
      hex0: out STD_LOGIC_VECTOR(6 downto 0)  -- 2 seven-segment displays
   );
end disdp_lab1;

architecture sa of disdp_lab1 is   -- Structural architecture (sa)
   constant NUMBER: integer := 6;  -- Bits used by the counter
   signal clk_2Hz: STD_LOGIC;
   signal p0: STD_LOGIC_VECTOR(3 downto 0);
   signal p1: STD_LOGIC_VECTOR(1 downto 0);
begin
   -- Scale the oscillator
   clock: entity work.so(ba)
   port map(clk_50MHz=>clk, reset=>rst, clk_2Hz=>clk_2Hz);
   
   -- Instantiate the counter
   counter: entity work.ubc(arch)
   generic map(N=>NUMBER)
   port map(clock=>clk_2Hz, reset=>rst, en=>en,
            up=>up, q(3 downto 0)=>p0--, q(5 downto 4)=>p1
   );
   -- instantiate 2 seven-segment displays
   ssdd0: entity work.ssdd(tt)
      port map(d => p0, ds => hex0);
   -- ssdd1: entity work.ssdd(tt)
      -- port map(d => p1, ds => hex1);
end sa;