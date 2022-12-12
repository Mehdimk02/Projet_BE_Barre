library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity registre is
 generic
	(
	N : INTEGER:= 8
	);
	port( 
		-- Entree & sortie
		clk, enable,raz_n : in std_logic;
		entree : in  std_logic_vector(N-1 downto 0);
		sortie : out std_logic_vector(N-1 downto 0)
		);
	end registre;

architecture arch_registre of registre is
--Variables
--signal sortie_reg : unsigned(N-1 downto 0) := (others => '0');
begin


-- mise en oeuvre de l'architecture

  PROCESS(clk) BEGIN
    IF clk'event and clk='1' THEN
		IF raz_n = '1' THEN
        sortie <= (OTHERS=>'0');
		elsif enable = '1' then
		sortie <= entree;
			
		end if;
	end if;
        
      
  END PROCESS;
  

end arch_registre;
	