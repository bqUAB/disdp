library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Seven-segment display decoder (ssdd) from 0 to 9.
-- Common anode, or ON when LOW (0)
entity ssdd is
   port(
      d: in  STD_LOGIC_VECTOR(3 downto 0);  -- Data input (d)
      ds:out STD_LOGIC_VECTOR(6 downto 0)   -- Display segments output (ds)
   );
end;

architecture tt of ssdd is -- Truth table (tt)
begin
   process(all)begin
      case d is
         -- When the hexadecimal (X) input is "?" the display segments output is
         --   segments names:  gfedcba
         when X"0" =>   ds <= "1000000";
         when X"1" =>   ds <= "1111001";
         when X"2" =>   ds <= "0100100";
         when X"3" =>   ds <= "0110000";
         when X"4" =>   ds <= "0011001";
         when X"5" =>   ds <= "0010010";
         when X"6" =>   ds <= "0000010";
         when X"7" =>   ds <= "1011000";
         when X"8" =>   ds <= "0000000";
         when X"9" =>   ds <= "0010000";
         when others => ds <= "1111111";
      end case;
   end process;
end;
