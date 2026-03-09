----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2026 11:44:09 PM
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
component top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end component top;

component bounce is
    Generic ( min_time : TIME := 100 ps;
              max_time : TIME := 1 ns;
              max_cnt : INTEGER := 2;
              seed : INTEGER := 777);
    Port ( in_i : in STD_LOGIC;
           out_o : out STD_LOGIC);
end component bounce;

signal clk_i : STD_LOGIC := '0';
signal rst_i : STD_LOGIC := '0';
signal led_o : STD_LOGIC_VECTOR (2 downto 0);

signal clk_dirty : std_logic := '0';


begin

bounce_model: bounce port map (
    in_i => clk_i,
    out_o => clk_dirty);

dut: top port map (
    clk_i => clk_dirty,
    rst_i => rst_i,
    led_o => led_o);
    
clk_i <= not clk_i after 50 ns;

stin: process
    begin
        rst_i <= '1';
        wait for 40 ns;
        rst_i <= '0';
        wait for 100 ns;
        rst_i <= '1';
        wait for 100 ns;
        rst_i <= '0';
        wait;
    end process;

end Behavioral;
