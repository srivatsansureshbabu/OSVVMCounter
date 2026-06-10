----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2026 09:56:36 PM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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
library osvvm;
context osvvm.OsvvmContext;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is
signal clock_TB : STD_LOGIC := '0';
signal reset_TB : STD_LOGIC := '0';
signal enable_TB : STD_LOGIC := '0';
signal count_TB : unsigned(7 downto 0);

begin


DUT: entity work.counter
port map (
clock => clock_TB,
reset => reset_TB,
enable => enable_TB,
count => count_TB
);

-- clock

clock_TB <= not clock_TB after 5 ns;

process
procedure Reset_Procedure is
variable Reset_Test : AlertLogIDType;
	begin
	Reset_Test := GetAlertLogID("Reset_Test");

	log("Starting Reset Verification Piece",ALWAYS);
	reset_TB <= '1';
	enable_TB <= '0';
	wait for 20 ns;
	AffirmIfEqual(Reset_Test, unsigned(count_TB),"00000000","Counter failed to clear on reset!");
	reset_TB <= '0';
	enable_TB <= '1';

end procedure Reset_Procedure;

procedure Count_Procedure is
    
    variable expected : unsigned(7 downto 0) := (others => '0');
    variable Count_Test : AlertLogIDType;
    begin
         Count_Test := GetAlertLogID("Count_Test");

        log("Starting Counter Verification Piece",ALWAYS);
        for i in 0 to 50 loop
    
            wait until rising_edge(clock_TB);
        
            expected := expected +1;
        
            wait for 5 ns;
            AffirmIfEqual(Count_Test, unsigned(count_TB), expected, "Counter failed while counting val");
       end loop;
end procedure Count_Procedure;

procedure Overflow_Procedure is
	
    variable expectedValOverflow : unsigned(7 downto 0) := (others => '0');
    variable Overflow_Test : AlertLogIDType;
	
    begin
	Overflow_Test := GetAlertLogID("Overflow_Test");
	log("Starting Overflow Verification Piece");
	enable_TB <= '0';
	reset_TB <= '1';
	wait until rising_edge(clock_TB);
	reset_TB <= '0';
	enable_TB <= '1';

	for i in 0 to 255 loop
    		wait until rising_edge(clock_TB);
	end loop;
	
	
	wait for 5 ns;
	AffirmIfEqual(Overflow_Test, unsigned(count_TB), expectedValOverflow, "Overflow Failed to Reset" );
	

end procedure Overflow_Procedure;

    begin
    SetTestName("counter_tb");

    Reset_Procedure;
    
    Count_Procedure;
    
    Overflow_Procedure;

   EndOfTestSummary;
   std.env.stop;
   wait;
   end process;
end Behavioral;
