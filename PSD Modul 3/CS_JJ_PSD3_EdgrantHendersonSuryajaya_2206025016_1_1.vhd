library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016_1_1 is
    port (
        masuk : in std_logic_vector (2 downto 0);
        a, b, c, d, e, f, g : out std_logic
    );
end entity CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016_1_1;

architecture rtl of CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016_1_1 is
    signal varA, varB, varC: std_logic;
begin
    varA <= masuk(0);
    varB <= masuk(1);
    varC <= masuk(2);

    g <= '1';
    f <= (not varA) or (varB and not varC);
    e <= varA or varB or not varC;
    d <= varA or varC;
    c <= (varA xnor varB) or (varA and not varC);
    b <= (varB and varC) or (not varA and varC) or (varA and not varB and not varC);
    a <= (not varA and varC) or (not varA and varB) or (varB and varC);
end architecture rtl;