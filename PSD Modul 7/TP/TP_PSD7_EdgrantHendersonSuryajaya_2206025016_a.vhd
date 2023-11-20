library ieee;
use ieee.std_logic_1164.all;

entity TP_PSD7_EdgrantHendersonSuryajaya_2206025016_a is
    port (
        clk : in std_logic;
        aktifkanLampu : in std_logic;
        RedLight : out std_logic;
        YellowLight : out std_logic;
        GreenLight : out std_logic
    );
end TP_PSD7_EdgrantHendersonSuryajaya_2206025016_a;

architecture rtl of TP_PSD7_EdgrantHendersonSuryajaya_2206025016_a is
    procedure ChangeLightStatus(signal light : out std_logic; status : in std_logic) is
    begin
        light <= status;
    end procedure ChangeLightStatus;

    signal state : integer range 0 to 2;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if aktifkanLampu = '1' then
                if state = 0 then
                    ChangeLightStatus(RedLight, '0');
                    ChangeLightStatus(YellowLight, '1');
                    state <= 1;
                elsif state = 1 then
                    ChangeLightStatus(YellowLight, '0');
                    ChangeLightStatus(GreenLight, '1');
                    state <= 2;
                elsif state = 2 then
                    ChangeLightStatus(GreenLight, '0');
                    ChangeLightStatus(RedLight, '1');
                    state <= 0;
                end if;
            end if;
        end if;
    end process;
end rtl;