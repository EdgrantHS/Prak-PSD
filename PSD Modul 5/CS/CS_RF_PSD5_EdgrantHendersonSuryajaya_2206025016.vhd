library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016 is
    port (
        -- input
        reg_write_dest : IN std_logic_vector (1 downto 0);
        reg_read_addrA, reg_read_addrB : IN std_logic_vector (1 downto 0);
        datain : IN std_logic_vector (7 downto 0);
        alu_ctrl : IN std_logic_vector (2 downto 0);

        -- other input
        reg_write_en : IN std_logic;
        clk, reset : IN std_logic;
        controlA, controlB : IN std_logic;
        zeroflag : OUT std_logic
    );
end entity CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016;

architecture rtl of CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016 is
    component register_ED is
        port (
            clk, reset      : IN std_logic;
            reg_write_en    : IN std_logic := '0';
            reg_write_dest  : IN std_logic_vector (1 downto 0) := (others => '0');
            reg_write_data  : IN std_logic_vector (7 downto 0) := (others => '0');
            reg_read_addrA  : IN std_logic_vector (1 downto 0) := (others => '0');
            reg_read_addrB  : IN std_logic_vector (1 downto 0) := (others => '0');
    
            reg_read_dataA  : OUT std_logic_vector (7 downto 0);
            reg_read_dataB  : OUT std_logic_vector (7 downto 0)
        );
    end component register_ED;
    
    component mux2to1 is
        port (
            A, B : IN std_logic_vector (7 downto 0);
            control : IN std_logic;
            O : OUT std_logic_vector (7 downto 0)
        );
    end component mux2to1;

    component alu_ED is
        port (
            a, b        : IN std_logic_vector (7 downto 0); 
            alu_control : IN std_logic_vector (2 downto 0); 
            alu_result  : OUT std_logic_vector (7 downto 0); 
            zeroflag    : OUT std_logic
        );
    end component alu_ED;

    signal reg_outA, reg_outB : std_logic_vector (7 downto 0);
    signal mux_outA, mux_outB : std_logic_vector (7 downto 0);
    signal alu_out : std_logic_vector (7 downto 0);
begin
    REG: register_ED port map (
        clk => clk, 
        reset => '0', 
        reg_write_en => reg_write_en, 
        reg_write_dest => reg_write_dest, 
        reg_write_data => alu_out, 
        reg_read_addrA => reg_read_addrA, 
        reg_read_addrB => reg_read_addrB, 
        
        reg_read_dataA => reg_outA, 
        reg_read_dataB => reg_outB
    );

    MUXA: mux2to1 port map (
        A => reg_outA, 
        B => datain, 
        control => controlA, 
        O => mux_outA
    );
    MUXB: mux2to1 port map (
        A => reg_outB, 
        B => "00000000", 
        control => controlB, 
        O => mux_outB
    );
    ALU: alu_ED port map (
        mux_outA, 
        mux_outB, 
        alu_ctrl, 

        alu_out, 
        zeroflag
    );
    
    -- initialize register jadi 0
    initialize: process(clk, reset)
    begin
        if reset = '1' then
            reg_outA <= "00000000";
            reg_outB <= "00000000";
        elsif falling_edge(clk) then
            if (reg_outA = "UUUUUUUU") then
                reg_outA <= "00000000";
            end if;
            if (reg_outB = "UUUUUUUU") then
                reg_outB <= "00000000";
            end if;
        end if;
    end process initialize;
end architecture rtl;