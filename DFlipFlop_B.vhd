----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2025 08:04:16 PM
-- Design Name: 
-- Module Name: DFlipFlop_B - Behavioral
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

 entity D_FlipFlop is 
 Port ( 

       clk : in STD_LOGIC;       

       D   : in STD_LOGIC;       

       Q   : out STD_LOGIC;      

       Qn  : out STD_LOGIC        

       ); 
end D_FlipFlop; 


architecture Behavioral of D_FlipFlop is 
 
begin 

 process(clk) 

   begin 

        if rising_edge(clk) then 

            Q <= D;  -- Capture the D input on the rising edge of the clock 

       end if; 

    end process; 

  end Behavioral; 
