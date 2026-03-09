----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2026 11:17:46 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is
    signal counter_state : STD_LOGIC_VECTOR (2 downto 0);
begin

process(clk_i, rst_i) is
begin
    if rst_i = '1' then
        counter_state <= "000";
    else
        if rising_edge(clk_i) then
            case counter_state is
                when "000" => counter_state <= "001";
                when "001" => counter_state <= "011";
                when "011" => counter_state <= "010";
                when "010" => counter_state <= "110";
                when "110" => counter_state <= "111";
                when "111" => counter_state <= "101";
                when "101" => counter_state <= "100";
                when "100" => counter_state <= "000";
                when others => counter_state <= "000";
            end case;
        end if;
    end if;
end process;

led_o <= counter_state;

end Behavioral;
