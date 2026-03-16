----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2026 13:31:57
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
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
    type led_array is array (3 downto 0) of STD_LOGIC_VECTOR (7 downto 0);

    signal clock_count : integer := 0;
    signal clk_1khz : STD_LOGIC := '0';
    signal led7_an_active : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal led7_seg_active_i : led_array := ("11111111","11111111","11111111","11111111");
    signal led7_seg_current : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    signal number_set : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal number_set_num : integer := -1;
begin
    process(clk_i, btn_i, sw_i)
    begin
        -- Main 1 kHz refresh clock
        if(rising_edge(clk_i)) then
            clock_count <= clock_count + 1;
            if(clock_count = 49999) then
                clk_1khz <= not clk_1khz;
                clock_count <= 0;
                
                --switching digit
                case led7_an_active is
                    when "0111" =>
                        led7_an_active <= "1011";
                        --led7_seg_active_i(1)(0) <= not sw_i(5);
                        led7_seg_current <= led7_seg_active_i(1);
                    when "1011" =>
                        led7_an_active <= "1101";
                        --led7_seg_active_i(2)(0) <= not sw_i(6);
                        led7_seg_current <= led7_seg_active_i(2);
                    when "1101" =>
                        led7_an_active <= "1110";
                        --led7_seg_active_i(3)(0) <= not sw_i(7);
                        led7_seg_current <= led7_seg_active_i(3);
                    when "1110" =>
                        led7_an_active <= "0111";
                        --led7_seg_active_i(0)(0) <= not sw_i(4);
                        led7_seg_current <= led7_seg_active_i(0);
                    when others =>
                        led7_an_active <= "0111";
                        --led7_seg_active_i(0)(0) <= not sw_i(4);
                        led7_seg_current <= led7_seg_active_i(0);
                end case;

            end if;
            
            --Setting number from BTNL
            if(btn_i(3) = '1') then
                number_set(0) <= sw_i(0);
                number_set(1) <= sw_i(1);
                number_set(2) <= sw_i(2);
                number_set(3) <= sw_i(3);
                number_set_num <= 3;
            end if;
            
            --Setting number from BTNC
            if(btn_i(2) = '1') then
                number_set(0) <= sw_i(0);
                number_set(1) <= sw_i(1);
                number_set(2) <= sw_i(2);
                number_set(3) <= sw_i(3);
                number_set_num <= 2;
            end if;
            
            --Setting number from BTNR
            if(btn_i(1) = '1') then
                number_set(0) <= sw_i(0);
                number_set(1) <= sw_i(1);
                number_set(2) <= sw_i(2);
                number_set(3) <= sw_i(3);
                number_set_num <= 1;
            end if;
            
            --Setting number from BTND
            if(btn_i(0) = '1') then
                number_set(0) <= sw_i(0);
                number_set(1) <= sw_i(1);
                number_set(2) <= sw_i(2);
                number_set(3) <= sw_i(3);
                number_set_num <= 0;
            end if;
        end if;
        
        --Setting segments from number
        if(number_set_num >= 0) then
            case number_set is
                when "0000" => led7_seg_active_i(number_set_num) <= "0000001-"; --0
                when "0001" => led7_seg_active_i(number_set_num) <= "1001111-"; --1
                when "0010" => led7_seg_active_i(number_set_num) <= "0010010-"; --2
                when "0011" => led7_seg_active_i(number_set_num) <= "0000110-"; --3
                when "0100" => led7_seg_active_i(number_set_num) <= "1001100-"; --4
                when "0101" => led7_seg_active_i(number_set_num) <= "0100100-"; --5
                when "0110" => led7_seg_active_i(number_set_num) <= "0100000-"; --6
                when "0111" => led7_seg_active_i(number_set_num) <= "0001111-"; --7
                when "1000" => led7_seg_active_i(number_set_num) <= "0000000-"; --8
                when "1001" => led7_seg_active_i(number_set_num) <= "0000100-"; --9
                when "1010" => led7_seg_active_i(number_set_num) <= "0001000-"; --A
                when "1011" => led7_seg_active_i(number_set_num) <= "1100000-"; --B (b)
                when "1100" => led7_seg_active_i(number_set_num) <= "0110001-"; --C
                when "1101" => led7_seg_active_i(number_set_num) <= "1000010-"; --D (d)
                when "1110" => led7_seg_active_i(number_set_num) <= "0110000-"; --E
                when "1111" => led7_seg_active_i(number_set_num) <= "0111000-"; --F
                when others => led7_seg_active_i(number_set_num) <= "0000001-"; --0 when other
            end case;
            number_set_num <= -1;
        end if;
        
        --Setting DP
        led7_seg_active_i(0)(0) <= not sw_i(4);
        led7_seg_active_i(1)(0) <= not sw_i(5);
        led7_seg_active_i(2)(0) <= not sw_i(6);
        led7_seg_active_i(3)(0) <= not sw_i(7);
        
    end process;

    led7_an_o <= led7_an_active;
    led7_seg_o <= led7_seg_current;
    
end Behavioral;
