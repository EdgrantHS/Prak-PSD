library ieee;
use ieee.std_logic_1164.all;


entity tes is
    port(
        -- Input
        A, B, C : IN STD_LOGIC;

        --output
        Y : OUT STD_LOGIC
    );
end tes;

architecture tes2 of tes is 
    signal out_var : STD_LOGIC;
begin
    out_var <= A AND B;
    Y <= out_var OR C;
end tes2;