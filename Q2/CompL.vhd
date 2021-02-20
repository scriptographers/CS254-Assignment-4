-- Module - CompL
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity CompL is
   port (a, b : in std_logic_vector (1 downto 0);
         z : out std_logic);
end entity;

architecture l_arc of CompL is

   signal sig: std_logic_vector(4 downto 0);

   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin

   mux_b1_0: TwoByOneMux
      port map (i(0) => '0', i(1) => '1', sel => b(1), z => sig(0));
   mux_b1_1: TwoByOneMux
      port map (i(0) => '1', i(1) => '0', sel => b(1), z => sig(1));
   mux_a1: TwoByOneMux
      port map (i(0) => sig(1), i(1) => sig(0), sel => a(1), z => sig(2));
   mux_b0_0: TwoByOneMux
      port map (i(0) => '0', i(1) => sig(2), sel => b(0), z => sig(3));
   mux_b0_1: TwoByOneMux
      port map (i(0) => sig(2), i(1) => '0', sel => b(0), z => sig(4));
   mux_a0: TwoByOneMux
      port map (i(0) => sig(4), i(1) => sig(3), sel => a(0), z => z);

end architecture;