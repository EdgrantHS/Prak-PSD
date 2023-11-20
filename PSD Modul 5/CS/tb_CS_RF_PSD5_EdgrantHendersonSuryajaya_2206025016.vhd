library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016 is
end entity tb_CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016;

architecture rtl of tb_CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016 is
    component CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016 is
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
    end component CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016;

        
    -- input
    signal reg_write_dest : std_logic_vector (1 downto 0);
    signal reg_read_addrA, reg_read_addrB : std_logic_vector (1 downto 0);
    signal datain : std_logic_vector (7 downto 0);
    signal alu_ctrl : std_logic_vector (2 downto 0);

    -- other input
    signal reg_write_en : std_logic;
    signal clk, reset : std_logic;
    signal controlA, controlB : std_logic;
    signal zeroflag :  std_logic;
begin
    UUT : CS_RF_PSD5_EdgrantHendersonSuryajaya_2206025016 port map(
        reg_write_dest => reg_write_dest, 
        reg_read_addrA => reg_read_addrA, 
        reg_read_addrB => reg_read_addrB, 
        datain => datain, --h
        alu_ctrl => alu_ctrl,
        reg_write_en => reg_write_en,
        clk => clk, --h
        reset => reset, --h
        controlA => controlA,
        controlB => controlB,
        zeroflag => zeroflag --h
    );
    
    process
    begin
        clk <= '0';

        alu_ctrl <= "000";
        controlA <= '1';
        controlB <= '1';
        reg_write_dest <= "00";
        reg_read_addrA <= "00";
        reg_read_addrB <= "00";
        reg_write_en <= '1';
        
        datain <= "00100100";
        reset <= '0';
        
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;

        alu_ctrl <= "111";
        controlA <= '1';
        controlB <= '0';
        reg_write_dest <= "01";
        reg_read_addrA <= "00";
        reg_read_addrB <= "01";
        reg_write_en <= '0';
        
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
        

        alu_ctrl <= "001";
        controlA <= '0';
        controlB <= '0';
        reg_write_dest <= "10";
        reg_read_addrA <= "00";
        reg_read_addrB <= "00";
        reg_write_en <= '1';
        
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;


        alu_ctrl <= "011";
        controlA <= '1';
        controlB <= '1';
        reg_write_dest <= "10";
        reg_read_addrA <= "00";
        reg_read_addrB <= "00";
        reg_write_en <= '1';
        
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture rtl;