-- TOP MODULE: FourbitComp
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity FourbitComp is
   port (a, b : in std_logic_vector (1 downto 0);
         l, g, e : out std_logic);
end entity;

architecture Comparator of FourbitComp is

   component CompE is
      port (a, b : in std_logic_vector (1 downto 0);
            z : out std_logic);
   end component;

   component CompL is
      port (a, b : in std_logic_vector (1 downto 0);
            z : out std_logic);
   end component;

   component CompG is
      port (a, b : in std_logic_vector (1 downto 0);
            z : out std_logic);
   end component;

begin

   comp_e: CompE
      port map (a => a, b => b, z => e);

   comp_l: CompL
      port map (a => a, b => b, z => l);

   comp_g: CompG
      port map (a => a, b => b, z => g);

end architecture;