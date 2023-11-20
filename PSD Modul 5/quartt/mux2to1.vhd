library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2to1 is
    port (
        A, B : IN std_logic_vector (7 downto 0);
        control : IN std_logic;
        O : OUT std_logic_vector (7 downto 0)
    );
end entity mux2to1;

architecture rtl of mux2to1 is
    
begin
    
    mux: process(A, B, control)
    begin
        if control = '0' then
            O <= A;
        else
            O <= B;
        end if;
    end process mux;
    
end architecture rtl;