library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2to1_tb is
end entity mux2to1_tb;

architecture rtl of mux2to1_tb is
    component mux2to1 is
        port (
            A, B : IN std_logic_vector (7 downto 0);
            control : IN std_logic;
            O : OUT std_logic_vector (7 downto 0)
        );
    end component mux2to1;
    
    signal A, B, O: std_logic_vector (7 downto 0);
    signal ctrl: std_logic;

begin
    UUT : mux2to1 port map(A => A, B => B, control => ctrl, O => O);
    
    process
    begin
        A <= "00100010";
        B <= "00010010";
        ctrl <= '0';
        wait for 10 ns;
        ctrl <= '1';
        wait for 10 ns;
        A <= "00101010";
        B <= "10010010";
        wait for 10 ns;
        ctrl <= '0';
        wait for 10 ns;
        ctrl <= '1';
        wait;
    end process;
end architecture rtl;