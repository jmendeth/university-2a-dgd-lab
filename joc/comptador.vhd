library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comptador_single is
  port ( ecnt : in std_logic;
         nrst, clk : in std_logic;
         numx : out std_logic_vector(3 downto 0);
         tc : out std_logic );
end;

architecture logic of comptador is
  signal n : unsigned(3 downto 0);
begin
  process (clk, nrst)
  begin
    if nrst = '0' then
      n <= x"0";
    elsif (clk'event and clk = '1') then
      if ecnt = '1' then
        n <= x"0" when n = 9 else n + 1;
      end if;
    end if;
  end process;

  numx <= std_logic_vector(n);
  tc <= '1' when (ecnt = '1' and n = 9) else '0';
end logic;

entity comptador is
  port ( ecnt : in std_logic;
         nrst, clk : in std_logic;
         numx : out std_logic_vector(7 downto 0) );
end;

architecture components of comptador is
  component comptador_single is
    port ( ecnt : in std_logic;
           nrst, clk : in std_logic;
           num : out std_logic_vector(3 downto 0);
           tc : out std_logic );
  end;

  signal tc : std_logic_vector(3 downto 0);
begin
  tc(0) <= ecnt;
  comptador_0 : comptador port map(clk => clk, nrst => nrst, ecnt => tc(0), tc => tc(1), numx => numx(3 downto 0));
  comptador_1 : comptador port map(clk => clk, nrst => nrst, ecnt => tc(1), tc => tc(2), numx => numx(7 downto 4));
  comptador_2 : comptador port map(clk => clk, nrst => nrst, ecnt => tc(2), tc => tc(3), numx => numx(11 downto 8));
end components;
