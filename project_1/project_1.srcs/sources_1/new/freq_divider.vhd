----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2026 12:58:48 PM
-- Design Name: 
-- Module Name: freq_divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_divider is
    generic (cycle_count: natural := 100_000; initial_state: STD_LOGIC := '0');
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           clk_o : out STD_LOGIC);
end freq_divider;

architecture Behavioral of freq_divider is
signal clk_out: STD_LOGIC := initial_state;
begin

    process(clk_i, rst_i)
    variable counter: natural := 0;
    begin
        if rst_i = '1' then
            counter := 0;
            clk_out <= initial_state;
        elsif rising_edge(clk_i) then
            counter := counter + 1;
            if (counter >= cycle_count) then
                counter := 0;
                clk_out <= not clk_out;
            end if;
        end if;
        
    end process;

    clk_o <= clk_out;

end Behavioral;
