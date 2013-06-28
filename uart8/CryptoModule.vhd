----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:07:06 06/28/2013 
-- Design Name: 
-- Module Name:    CryptoModule - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CryptoModule is
	PORT(
		CLK : in std_logic;
		RD : in std_logic;
		DATA_READ : in std_logic_vector(7 downto 0);
		WT : out std_logic := '0';
		DATA_WRITE : out std_logic_vector(7 downto 0)
		);
end CryptoModule;

architecture Behavioral of CryptoModule is
begin
	main : process(RD, CLK)
	variable wt_set : boolean := false;
	begin
		if rising_edge(CLK) then 
			if wt_set then
				WT <= '0';
				wt_set := false;
			end if;
		end if;
		if rising_edge(RD) then
			DATA_WRITE <= conv_std_logic_vector(conv_integer(DATA_READ) + 1, 8);
			WT <= '1';
			wt_set := true;
		end if;
	end process main;
end Behavioral;

