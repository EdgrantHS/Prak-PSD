library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.ALL;

entity CS_unsigned is
    port(
        -- Input
        input : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --ini 4 bit, karena bit pertama dipake utk sign
        
        --output
        output : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) --sama kayak input
    );
end entity;

architecture adder_3_archi of CS_unsigned is 
	signal in_num : SIGNED (3 DOWNTO 0);
	signal out_num: SIGNED (3 DOWNTO 0);
begin
	in_num <= signed(input);
	out_num <= in_num + 3;
	output <= std_logic_vector(out_num);
end architecture;