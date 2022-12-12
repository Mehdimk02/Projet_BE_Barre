library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity   girouette is

port( 
	clk : in std_logic;
	-- raz_n : in std_logic;
	-- start_stop : in std_logic;
	in_pwm_compas : in std_logic;
	-- data_valid : out std_logic ;
	data_compas : out std_logic_vector(8 downto 0)
);
end girouette;

architecture arch_girouette of girouette is

signal out_cpt : std_logic_vector (12 downto 0);
signal out_comp : std_logic;
signal start : std_logic;
signal stop : std_logic;
signal S0 : std_logic;
signal S1 : std_logic;
signal S2 : std_logic;
signal S3 : std_logic;
signal lim : std_logic_vector (12 downto 0);
signal raz_n : std_logic := '0';
signal start_stop : std_logic :='1';

component front_des is
port( 
	-- Entree & sortie
	clk, signal_1 : in std_logic;
	front_montant : out std_logic;
	front_descendant : out std_logic
	);
end component;

component compteur is
generic
 (
	N : INTEGER:= 16
 );
port( 
	-- Entree & sortie
	clk,raz_n, enable : in std_logic;
	cmp: out std_logic_vector(N-1 downto 0)
	);
end component;

component comparateur is
generic
	(
	N : INTEGER:= 13
	);
port(   A,B  :      in  std_logic_vector(N-1 downto 0);
    result :      out     std_logic);
	
end component;




begin
lim <= "1001110000111";

S0 <= '1';
S1 <= out_comp or not in_pwm_compas or raz_n;
S2 <= out_comp and in_pwm_compas; 	    
S3 <= raz_n or start; 
-- data_valid <= not in_pwm_compas; 

detecteur :  front_des port map (clk, in_pwm_compas, start, stop);


compteur1:  compteur generic map (N =>13)
			 port map (clk, S1 ,S0, out_cpt);

compa : comparateur port map (out_cpt, lim, out_comp);

compteur2: compteur  generic map (N =>9)
			port map (clk, S3, S2,data_compas);	



end arch_girouette;