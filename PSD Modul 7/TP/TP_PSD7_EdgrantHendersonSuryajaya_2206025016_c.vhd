library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity TP_PSD7_EdgrantHendersonSuryajaya_2206025016_c is
    port (
        CLK : in std_logic;
        Suhu : out integer := 0
    );
end TP_PSD7_EdgrantHendersonSuryajaya_2206025016_c;

architecture rtl of TP_PSD7_EdgrantHendersonSuryajaya_2206025016_c is

begin
    process(CLK)
        variable temp : integer;
        variable seed1, seed2: integer := 999;
        impure function suhuRandom(min_val: integer; max_val : integer) return integer is
            variable r : real;
          begin
            uniform(seed1, seed2, r);
            return integer(
              round(r * real(max_val - min_val + 1) + real(min_val) - 0.5));
          end function;
    begin
        if rising_edge(CLK) then
            temp := suhuRandom(-56, 81);
            Suhu <= temp;
        end if;
    end process;
end rtl;