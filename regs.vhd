library ieee;
use ieee.std_logic_1164.all;

entity regs is
  port ( clk, nrst, intro : in std_logic;
         keycode : in std_logic_vector(3 downto 0);
         opA, opB : out std_logic_vector(3 downto 0) );
end;

architecture gates of regs is
  component DFFE is
    port ( d : in std_logic_vector(3 downto 0);
           clk, clrn, prn, ena : in std_logic;
           q : out std_logic_vector(3 downto 0) );
  end component;
  
  signal q1, q2 : std_logic_vector(3 downto 0);
begin
  REG_1: DFFE port map(clk => clk, ena => intro, clrn => nrst, prn => '1', d => keycode, q => q1);
  REG_2: DFFE port map(clk => clk, ena => intro, clrn => nrst, prn => '1', d => q1, q => q2);
  opA <= q1;
  opA <= q2;
end gates;
