library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TP_PSD7_EdgrantHendersonSuryajaya_2206025016_b is
    port (
        N : in integer range 0 to 16 := 0;
        factorial : out integer := 0
    );
end TP_PSD7_EdgrantHendersonSuryajaya_2206025016_b;

architecture rtl of TP_PSD7_EdgrantHendersonSuryajaya_2206025016_b is
    function faktorial (n : integer) return integer is
    begin
        if n < 2 then return 1;
        else return n*faktorial(n - 1); 
        end if;
    end function;
begin
    factorial <= faktorial(N);
end rtl;
