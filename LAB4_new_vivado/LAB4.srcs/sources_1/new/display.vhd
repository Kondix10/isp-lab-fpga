----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2026 13:20:18
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
    Port (
        clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        digit_i : in STD_LOGIC_VECTOR(31 downto 0);
        led7_an_o : out STD_LOGIC_VECTOR(3 downto 0);
        led7_seg_o : out STD_LOGIC_VECTOR(7 downto 0));
end display;

architecture Behavioral of display is

    signal clock_count : integer := 0;
    signal led7_an_active : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal led7_seg_current : STD_LOGIC_VECTOR (7 downto 0) := "11111111";

begin
    process(clk_i)
    begin
        -- Main 1 kHz refresh clock
        if(rising_edge(clk_i)) then
            clock_count <= clock_count + 1;
            if(clock_count = 49999) then
                clock_count <= 0;
                
                --switching digit
                case led7_an_active is
                    when "0111" =>
                        led7_an_active <= "1011";
                        led7_seg_current <= digit_i(23 downto 16);
                    when "1011" =>
                        led7_an_active <= "1101";
                        led7_seg_current <= digit_i(15 downto 8);
                    when "1101" =>
                        led7_an_active <= "1110";
                        led7_seg_current <= digit_i(7 downto 0);
                    when "1110" =>
                        led7_an_active <= "0111";
                        led7_seg_current <= digit_i(31 downto 24);
                    when others =>
                        led7_an_active <= "0111";
                        led7_seg_current <= digit_i(31 downto 24);
                end case;
            end if;
        end if;  
    end process;

    led7_an_o <= led7_an_active;
    led7_seg_o <= led7_seg_current;

end Behavioral;
