library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tp8 is
    port (
        clk, inn : in std_logic;
        outt : out std_logic
    );
end entity tp8;

architecture rtl of tp8 is
    type state is (s0, s1, s2);
    signal currentState, nextState : state := s0;
begin
    clock_upadte: process(clk)
    begin
        if rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process clock_upadte;
    
    state_update: process(inn)
    begin
        case currentState is
            when s0 =>
                if inn = '1' then
                    nextState <= s1;
                    outt <= '0';
                end if;
            
            when s1 =>
                if inn = '0' then
                    nextState <= s0;
                    outt <= '1';
                else 
                    nextState <= s2;
                    outt <= '0';
                end if;
            
            when s2 =>
                if inn = '0' then
                    nextState <= s0;
                    outt <= '1';
                else 
                    nextState <= s2;
                    outt <= '0';
                end if;    
        end case;
    end process state_update;

end architecture rtl;