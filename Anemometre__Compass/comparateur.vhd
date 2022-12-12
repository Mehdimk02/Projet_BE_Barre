library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comparateur is
 generic
	(
	N : INTEGER:= 8
	);
port(   A,B  :      in  std_logic_vector(N-1 downto 0);
    result :      out     std_logic);
end comparateur;
 
architecture arch_comparateur of comparateur is
begin
    result <= '1' when A>B else '0';
     
end arch_comparateur;