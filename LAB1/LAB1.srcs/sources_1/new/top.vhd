----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2026 17:23:14
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
    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

signal parity : STD_LOGIC := '0';

begin

led7_an_o <= "0111";
--these segmesnt will always be active
--A,D,E,F, DP(inactive)
led7_seg_o(7) <= '0';
led7_seg_o(4) <= '0';
led7_seg_o(3) <= '0';
led7_seg_o(2) <= '0';
led7_seg_o(0) <= '1';

parity <= sw_i(0) xor sw_i(1) xor sw_i(2) xor sw_i(3) xor sw_i(4) xor sw_i(5) xor sw_i(6) xor sw_i(7);

-- Case for EVEN numbers (letter 'E') (segment G)
led7_seg_o(1) <= parity;

-- Case for ODD numbers (letter 'E') (segments B, C)
led7_seg_o(6) <= not parity;
led7_seg_o(5) <= not parity;

end Behavioral;
