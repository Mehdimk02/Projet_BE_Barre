library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity compteur is
 generic
	(
	N : INTEGER:= 8
	);
	port( 
		-- Entree & sortie
		clk, raz_n, enable : in std_logic;
		cmp: out std_logic_vector(N-1 downto 0)
		);
	end compteur;

architecture arch_compteur of compteur is
--Variables
signal compteur: std_logic_vector(N-1 downto 0) := (others => '0');
begin
-- mise en oeuvre de l'architecture
-- 
  PROCESS(clk) BEGIN
    IF clk'event and clk='1' THEN
      IF raz_n = '1' THEN
        compteur<=(OTHERS=>'0');
      elsif enable = '1' then
        compteur <= compteur + 1;
      END IF;
    END IF;
 
  END PROCESS;
-- 
   cmp <= compteur;
end arch_compteur;
	