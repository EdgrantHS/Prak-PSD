library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016 is
    port (
        clk : in std_logic;
        keluar : out std_logic_vector (3 downto 0) 
    );
end entity CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016;

architecture rtl of CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016 is
begin
    npm_counter: process(clk)
        variable current_num : std_logic_vector (3 downto 0) := "1001"; --npm = 2306475819
    begin
        if falling_edge(clk) then
            keluar <= current_num;
            if (current_num = "1001") then
                current_num := "0001";
            elsif (current_num = "0001") then
                current_num := "1000";
            elsif (current_num = "1000") then
                current_num := "0101";
            elsif (current_num = "0101") then
                current_num := "0111";
            elsif (current_num = "0111") then
                current_num := "0100";
            elsif (current_num = "0100") then
                current_num := "0110";
            elsif (current_num = "0110") then
                current_num := "0000";
            elsif (current_num = "0000") then
                current_num := "0011";
            elsif (current_num = "0011") then
                current_num := "0010";
            elsif (current_num = "0010") then
                current_num := "1001";
            end if;
        end if;
    end process npm_counter;

end architecture rtl;