library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Binary (6 bits) to BCD
entity bin2bcd6 is
   port(
      binary: in  STD_LOGIC_VECTOR(5 downto 0);
      bcd:    out STD_LOGIC_VECTOR(7 downto 0)
   );
end bin2bcd6;

architecture ba of bin2bcd6 is -- Behavioral architecture
begin
   gen_bcd: process(binary)
      variable z: STD_LOGIC_VECTOR(16 downto 0);
   begin
      -- Initialization
      z := (others => '0');
      -- Three first shifts
      z(8 downto 3) := binary;
      for i in 0 to 5 loop
         -- Units (4 bits)
         if z(12 downto 9) > 4 then
            z(12 downto 9) := z(12 downto 9) + 3;
         end if;
         -- Tens (4 bits)
         if z(16 downto 13) > 4 then
            z(16 downto 13) := z(16 downto 13) + 3;
         end if;
         -- Shift to the left
         z(16 downto 1) := z(15 downto 0);
      end loop;
      -- Output BCD values
      bcd <= z(16 downto 9);
   end process;
end ba;
