library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016_1_3 is
    port (
        masuk : in std_logic_vector (2 downto 0);
        keluar : out  std_logic_vector (6 downto 0)
    );
end entity CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016_1_3;

architecture rtl of CS_JJ_PSD3_EdgrantHendersonSuryajaya_2206025016_1_3 is
begin
    process(masuk)
    begin
        REPORT "Nomor 4, Edgrant Henderson Suryajaya";
        case masuk is
            when "000" => keluar <= "1110100";
            when "001" => keluar <= "1101111";
            when "010" => keluar <= "1110001";
            when "011" => keluar <= "1111011";
            when "100" => keluar <= "1011110";
            when "101" => keluar <= "1011000";
            when "110" => keluar <= "1111100";
            when "111" => keluar <= "1011111";
        
            when others => keluar <= "0000000";      
        end case;
    end process;

end architecture rtl;