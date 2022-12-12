library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity front_des is 



port( 
	-- Entree & sortie
	clk, signal_1 : in std_logic;
	front_montant : out std_logic;
	front_descendant : out std_logic
	);
end front_des;

architecture arch_front_montant of front_des is 
signal A,B,C,D : std_logic;

begin
process (clk)

 begin
 
 if (clk'event AND clk = '1') then
 A <= signal_1;
 B <= not A;
end if; 

if (clk'event AND clk = '0') then
	C <= signal_1;
	D <= not C;
   end if;

end process;

front_montant <= (B and A);
front_descendant <= (D and C);

end arch_front_montant;