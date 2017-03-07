library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Top level implementation
entity disdp_lab1 is
   port(
      sw:         in  STD_LOGIC_VECTOR(7 downto 0); -- 8 switches
      hex0, hex1: out STD_LOGIC_VECTOR(6 downto 0)  -- 2 seven-segment displays
   );
end disdp_lab1;

architecture sa of disdp_lab1 is -- Structural architecture (sa)
begin
   -- instantiate 2 seven-segment display
   ssdd0: entity work.ssdd(tt)
      port map(d => sw(3 downto 0), ds => hex0);
   ssdd1: entity work.ssdd(tt)
      port map(d => sw(7 downto 4), ds => hex1);
end sa;