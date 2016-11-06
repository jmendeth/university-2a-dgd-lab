library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity CA2_BCD_8B is
  port ( CA2 : in std_logic_vector(7 downto 0);
         BCD : out std_logic_vector(7 downto 0) );
end;

architecture truth_table of CA2_BCD_8B is
begin
  with CA2 select
    BCD <= x"00" when 0,
           x"01" when 1,
           x"02" when 2,
           x"03" when 3,
           x"04" when 4,
           x"05" when 5,
           x"06" when 6,
           x"07" when 7,
           x"08" when 8,
           x"09" when 9,
           x"10" when 10,
           x"12" when 12,
           x"14" when 14,
           x"15" when 15,
           x"16" when 16,
           x"18" when 18,
           x"20" when 20,
           x"21" when 21,
           x"24" when 24,
           x"25" when 25,
           x"27" when 27,
           x"28" when 28,
           x"30" when 30,
           x"32" when 32,
           x"35" when 35,
           x"36" when 36,
           x"40" when 40,
           x"42" when 42,
           x"45" when 45,
           x"48" when 48,
           x"49" when 49,
           x"54" when 54,
           x"56" when 56,
           x"63" when 63,
           x"64" when 64,
           x"72" when 72,
           x"81" when 81,
           "--------" when others;
end truth_table;
