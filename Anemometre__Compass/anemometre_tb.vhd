library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity anemometre_tb is

end anemometre_tb;

architecture arch_anemometre of anemometre_tb is
type STATES_ST is (ST_A, ST_B);
signal CurrentST, NextST    : STATES_ST;
signal start : std_logic := '0';
signal stop : std_logic := '0';
signal enable2 : std_logic := '1';
signal raz : std_logic;
signal S2 : std_logic;
signal out_cpt1 : std_logic_vector(25 downto 0);
signal out_cpt2 : std_logic_vector (7 downto 0);
signal out_comp : std_logic;
signal lim : std_logic_vector (25 downto 0);
signal clk : std_logic := '0';
signal raz_n : std_logic := '1';
signal start_stop : std_logic := '1';
signal continu : std_logic := '1';
signal in_freq_anemometre : std_logic := '0';
signal data_valid : std_logic; 
signal data_anemometre : std_logic_vector(7 downto 0) := (others => '0');
signal n_raz : std_logic;


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
	N : INTEGER:= 26
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
	N : INTEGER:= 26
	);
port(   A,B  :      in  std_logic_vector(N-1 downto 0);
    result :      out     std_logic);
	
end component;

component registre is
	
generic
	(
	N : INTEGER:= 8
	);
	port( 
		-- Entree & sortie
		clk, enable, raz_n : in std_logic;
		entree : in  std_logic_vector(N-1 downto 0);
		sortie : out std_logic_vector(N-1 downto 0)
		);
		
end component;

begin




s2 <= start and enable2;
 
raz <= (not raz_n) or out_comp;

--lim <= "10111110101111000001111111"; 
lim <= "00000000000001001110001000";  -- N = 5000 (T = 100 us)

n_raz <= not raz_n;

 
compteur1:  compteur generic map (N =>26)
			 port map (clk =>clk,raz_n => raz  ,enable => enable2 ,cmp => out_cpt1);

compa : comparateur port map (A => out_cpt1 , B => lim , result => out_comp);

detecteur :  front_des port map (clk => clk ,signal_1 => in_freq_anemometre ,front_montant => start ,front_descendant => stop);

compteur2:  compteur generic map (N =>8)
			 port map (clk => clk, raz_n => raz ,enable => s2, cmp => out_cpt2);
			 
registre1 : registre port map (clk => clk, enable => out_comp ,raz_n => n_raz ,entree => out_cpt2, sortie =>data_anemometre); 


pblocF : process  (CurrentST, continu, start_stop, out_comp)
begin
case CurrentST is
when ST_A =>
					if (continu = '1' or start_stop = '0') then NextST <= ST_B;
					else NextST <= CurrentST;
					end if;
when ST_B =>    
					if (continu = '0' and out_comp = '1') then NextST <= ST_A;
					else NextST <= CurrentST;
					end if;
when others =>
end case;

end process pblocF; 

pblocM : process (clk)
begin

if clk'event and clk = '1' then
        
            CurrentST <= NextST;
            
        end if;
end process pBlocM;

	enable2 <= '1' when CurrentST = ST_B else '0';           
	data_valid <= '1' when CurrentST = ST_A;	

clk_stimulus : process
begin
	wait for 10 ns;
	clk <= not clk;
end process clk_stimulus;

in_freq_anemometre_stimulus : process
begin
	wait for 5 us;
	in_freq_anemometre <= not in_freq_anemometre;
end process in_freq_anemometre_stimulus;

	
end arch_anemometre;



