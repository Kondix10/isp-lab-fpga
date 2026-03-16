----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 13:50:05
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

--display
entity display is
    Port (
        clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        digit_i : in STD_LOGIC_VECTOR (31 downto 0);
        led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
    );
end display;

architecture Behavioral of display is
    signal clock_count : integer := 0;
    signal clk_1khz : STD_LOGIC := '0';
    signal led7_seg_active : STD_LOGIC_VECTOR := "00";
begin
    process(clk_i, rst_i)
    begin
        if(rising_edge(clk_i)) then
            clock_count <= clock_count + 1;
            if(clock_count = 99999) then
                clk_1khz <= not clk_1khz;
                clock_count <= 0;
            end if;
        end if;
        if(rising_edge(clk_1khz)) then
            case led7_seg_active is
                when "00" => led7_seg_active <= "01";
                when "01" => led7_seg_active <= "10";
                when "10" => led7_seg_active <= "11";
                when "11" => led7_seg_active <= "00";
                when others => led7_seg_active <= "00";
            end case;
            led7_seg_o <= led7_seg_active;
        end if;
    end process;

end Behavioral;
