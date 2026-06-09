----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2026 09:48:11 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity counter is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           count : out unsigned(7 downto 0));
end counter;

architecture Behavioral of counter is
    signal tempCount : unsigned(7 downto 0) := (others => '0');
begin

process(clock)
    begin
        if(rising_edge(clock)) then
            if reset = '1' then
                tempCount <= "00000000";
            elsif enable = '1' then
                tempCount <= tempCount +1 ;
            end if;
        end if;
        end process;
        
        count <= tempCount;

end Behavioral;
