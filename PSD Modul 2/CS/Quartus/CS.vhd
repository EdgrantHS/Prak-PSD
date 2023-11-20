library ieee;
use ieee.std_logic_1164.all;

entity CS is
    port(
        -- Input
        a : IN STD_LOGIC; --MSB
        b : IN STD_LOGIC;
        c : IN STD_LOGIC;
        d : IN STD_LOGIC; --LSB
        
        --output
        out_a : OUT STD_LOGIC;
        out_b : OUT STD_LOGIC;
        out_c : OUT STD_LOGIC;
        out_d : OUT STD_LOGIC
    );
end entity;

architecture adder_3_archi of CS is 
begin
	out_a <= a OR (b AND c) OR (b AND d);
	out_b <= (NOT b AND c) OR (NOT b AND d) OR (b AND NOT c AND NOT d);
	out_c <= (b AND NOT d) OR (c AND d) OR (NOT a AND NOT c AND NOT d);
	out_d <= (c AND NOT d) OR (NOT c AND NOT d);
end architecture;