library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Frequency divider to obtain o 2 Hz clock signal
-- based on a 50 MHz oscillator.
entity so is -- Scale oscillator (so)
   port(
      clk_50MHz: in  STD_LOGIC;
      reset    : in  STD_LOGIC;
      clk_2Hz  : out STD_LOGIC
   );
end so;

architecture ba of so is -- Behavioral architecture (ba)
   signal prescaler: UNSIGNED(23 downto 0);
   signal clk_2Hz_i: STD_LOGIC; -- Counter
begin
   gen_clk: process(clk_50MHz, reset)
   begin -- process gen_clk
      if reset = '0' then -- Push button
         clk_2Hz_i <= '0';
         prescaler <= (others => '0');
      elsif rising_edge(clk_50MHz) then    -- rising clock edge
         if prescaler = X"BEBC20" then     -- 12 500 000 in HEX
            prescaler <= (others => '0');  -- Reinitialize
            clk_2Hz_i <= not clk_2Hz_i;
         else
            prescaler <= prescaler + "1";
         end if;
      end if;
   end process gen_clk;
   clk_2Hz <= clk_2Hz_i;
end ba;
