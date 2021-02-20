-- TOP MODULE: FourbitFullAdd
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity FourbitFullAdd is
   port(
      -- Inputs:
      a, b  : in std_logic_vector (3 downto 0);
      cin   : in std_logic;
      -- Outputs:
      sum   : out std_logic_vector (3 downto 0);
      carry : out std_logic
   );
end entity;

architecture FourbitFullAdder of FourbitFullAdd is

   signal carries: std_logic_vector (2 downto 0); -- Stores the three intermediate carries

   component OnebitFullAdd is
      port(
         a, b, cin : in std_logic;
         sum, carry: out std_logic
      );
   end component;

begin

   add1: OnebitFullAdd
      port map(a => a(0), b => b(0), cin => cin, sum => sum(0), carry => carries(0));

   add2: OnebitFullAdd
      port map(a => a(1), b => b(1), cin => carries(0), sum => sum(1), carry => carries(1));

   add3: OnebitFullAdd
      port map(a => a(2), b => b(2), cin => carries(1), sum => sum(2), carry => carries(2));

   add4: OnebitFullAdd
      port map(a => a(3), b => b(3), cin => carries(2), sum => sum(3), carry => carry);

end architecture;