-- TOP MODULE: FourbitFullAdd
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity FourbitFullAdd is
   port (a, b : in std_logic_vector (3 downto 0);
         cin: in std_logic;
         sum : out std_logic_vector (3 downto 0);
         carry: out std_logic);
end entity;

architecture FourbitFullAdder of FourbitFullAdd is
   
   component OnebitFullAdd is
      port (a, b, cin : in std_logic;
            sum, carry: out std_logic);
   end component;

begin

end architecture;