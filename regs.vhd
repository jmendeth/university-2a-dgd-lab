library ieee;
use ieee.std_logic_1164.all;

entity regs is
  port ( keycode : in std_logic_vector(3 downto 0);
         clk, nrst, intro : in std_logic;
         opA, opB : out std_logic_vector(3 downto 0) );
end;

architecture gates of regs is
  component DFFE is
    port ( D : in std_logic_vector(3 downto 0);
           clk, CLRN, PRN, ENA : in std_logic;
           Q : out std_logic_vector(3 downto 0) );
  end component;
begin
  -- TODO: PRN deixat flotant??
  REG_1: DFFE port map(ENA => intro, CLRN => nrst, D => keycode, Q => opA);
  REG_2: DFFE port map(ENA => intro, CLRN => nrst, D => opA, Q => opB);
end gates;
