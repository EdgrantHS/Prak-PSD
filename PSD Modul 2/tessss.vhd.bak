library ieee;
use ieee.std_logic_1164.all;


entity mux is
    port(
        -- Input
        I : IN STD_LOGIC_VECTOR (3 downto 0);
        S : IN STD_LOGIC_VECTOR (1 downto 0);
        
        --output
        Y : OUT STD_LOGIC
    );
end mux;

architecture tes2 of mux is 
begin
    Y <=    I(3) when (S(1) = '1' AND S(0) = '1') else
            I(2) when (S(1) = '1' AND S(0) = '0') else
            I(1) when (S(1) = '0' AND S(0) = '1') else
            I(0); --catch all 
end tes2;