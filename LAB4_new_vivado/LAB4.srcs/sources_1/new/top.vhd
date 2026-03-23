----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2026 04:37:58 PM
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
        RXD_i : in STD_LOGIC;
        led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

signal clock_count : integer := 0;

component display is
    Port (
        clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        digit_i : in STD_LOGIC_VECTOR(31 downto 0);
        led7_an_o : out STD_LOGIC_VECTOR(3 downto 0);
        led7_seg_o : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal byte_val: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal read_bit: integer := 8;
signal disp_digit_i : STD_LOGIC_VECTOR(31 downto 0) := "11111111111111111111111111111111";
signal is_reading: STD_LOGIC := '0';

begin
    disp: display port map (
        clk_i => clk_i,
        rst_i => rst_i,
        digit_i => disp_digit_i,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o
    );
    
process(clk_i, RXD_i)
begin
    if(falling_edge(RXD_i)) then
        if(is_reading = '0') then
            is_reading <= '1';
        end if;
    end if;
    if(rising_edge(clk_i)) then
        if(is_reading = '1') then
            clock_count <= clock_count + 1;
            -- count at 9600Hz
            if(clock_count = 10000) then
                clock_count <= -417;
                read_bit <= read_bit - 1;
                case read_bit is
                    when 0 => byte_val(0) <= RXD_i;
                    when 1 => byte_val(1) <= RXD_i;
                    when 2 => byte_val(2) <= RXD_i;
                    when 3 => byte_val(3) <= RXD_i;
                    when 4 => byte_val(4) <= RXD_i;
                    when 5 => byte_val(5) <= RXD_i;
                    when 6 => byte_val(6) <= RXD_i;
                    when 7 => byte_val(7) <= RXD_i;
                    when others => byte_val(0) <= RXD_i;
                end case;
               
                
                -- if done reading
                if(read_bit = 0) then
                    is_reading <= '0';
                    read_bit <= 8;
                    clock_count <= 0;
                    --disp_digit_ = "00001111000011110000111100001111";
                    
                    -- display digit less significant
                    case byte_val(3 downto 0) is
                        when "0000" => disp_digit_i(7 downto 0) <= "00000011"; --0
                        when "0001" => disp_digit_i(7 downto 0) <= "10011111"; --1
                        when "0010" => disp_digit_i(7 downto 0) <= "00100101"; --2
                        when "0011" => disp_digit_i(7 downto 0) <= "00001101"; --3
                        when "0100" => disp_digit_i(7 downto 0) <= "10011001"; --4
                        when "0101" => disp_digit_i(7 downto 0) <= "01001001"; --5
                        when "0110" => disp_digit_i(7 downto 0) <= "01000001"; --6
                        when "0111" => disp_digit_i(7 downto 0) <= "00011111"; --7
                        when "1000" => disp_digit_i(7 downto 0) <= "00000001"; --8
                        when "1001" => disp_digit_i(7 downto 0) <= "00001001"; --9
                        when "1010" => disp_digit_i(7 downto 0) <= "00010001"; --A
                        when "1011" => disp_digit_i(7 downto 0) <= "11000001"; --B (b)
                        when "1100" => disp_digit_i(7 downto 0) <= "01100011"; --C
                        when "1101" => disp_digit_i(7 downto 0) <= "10000101"; --D (d)
                        when "1110" => disp_digit_i(7 downto 0) <= "01100001"; --E
                        when "1111" => disp_digit_i(7 downto 0) <= "01110001"; --F
                        when others => disp_digit_i(7 downto 0) <= "00000011"; --0 when other
                    end case;
                    
                    -- display digit most significant
                    case byte_val(7 downto 4) is
                        when "0000" => disp_digit_i(15 downto 8) <= "00000011"; --0
                        when "0001" => disp_digit_i(15 downto 8) <= "10011111"; --1
                        when "0010" => disp_digit_i(15 downto 8) <= "00100101"; --2
                        when "0011" => disp_digit_i(15 downto 8) <= "00001101"; --3
                        when "0100" => disp_digit_i(15 downto 8) <= "10011001"; --4
                        when "0101" => disp_digit_i(15 downto 8) <= "01001001"; --5
                        when "0110" => disp_digit_i(15 downto 8) <= "01000001"; --6
                        when "0111" => disp_digit_i(15 downto 8) <= "00011111"; --7
                        when "1000" => disp_digit_i(15 downto 8) <= "00000001"; --8
                        when "1001" => disp_digit_i(15 downto 8) <= "00001001"; --9
                        when "1010" => disp_digit_i(15 downto 8) <= "00010001"; --A
                        when "1011" => disp_digit_i(15 downto 8) <= "11000001"; --B (b)
                        when "1100" => disp_digit_i(15 downto 8) <= "01100011"; --C
                        when "1101" => disp_digit_i(15 downto 8) <= "10000101"; --D (d)
                        when "1110" => disp_digit_i(15 downto 8) <= "01100001"; --E
                        when "1111" => disp_digit_i(15 downto 8) <= "01110001"; --F
                        when others => disp_digit_i(15 downto 8) <= "00000011"; --0 when other
                    end case;
                end if;
                
            end if;
        else
            clock_count <= 0;
        end if;
    end if;
end process;

end Behavioral;
