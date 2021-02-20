-- MODULE CompG
library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity CompG is
   port (a, b : in std_logic_vector (1 downto 0);
         z : out std_logic);
end entity;

architecture g_arc of CompG is

   signal b1_1, b0_1, b0_2, a1_1, a1_2: std_logic;

   component TwoByOneMux is
      port (i : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            z : out std_logic);
   end component;

begin

   mux_b1_1: TwoByOneMux
      port map (i(0) => '1', i(1) => '0', sel => b(1), z => b1_1);

   mux_b0_1: TwoByOneMux
      port map (i(0) => '1', i(1) => b1_1, sel => b(0), z => b0_1);
   mux_b0_2: TwoByOneMux
      port map (i(0) => b1_1, i(1) => '0', sel => b(0), z => b0_2);

   mux_a1_1: TwoByOneMux
      port map (i(0) => '0', i(1) => b1_1, sel => a(1), z => a1_1);
   mux_a1_2: TwoByOneMux
      port map (i(0) => b0_2, i(1) => b0_1, sel => a(1), z => a1_2);

   mux_a0_1: TwoByOneMux
      port map (i(0) => a1_1, i(1) => a1_2, sel => a(0), z => z);

end architecture;