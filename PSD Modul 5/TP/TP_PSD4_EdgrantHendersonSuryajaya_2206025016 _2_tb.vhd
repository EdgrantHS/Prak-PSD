library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TP_PSD5_EdgrantHendersonSuryajaya_2206025016_2_tb is
end TP_PSD5_EdgrantHendersonSuryajaya_2206025016_2_tb;

architecture behavior of TP_PSD5_EdgrantHendersonSuryajaya_2206025016_2_tb is 

   -- Component Declaration for the Unit Under Test (UUT)
   component TP_PSD5_EdgrantHendersonSuryajaya_2206025016_2
   port(
        clk : in  std_logic;
        reset : in  std_logic;
        reg_write_en : in  std_logic;
        reg_write_dest : in  std_logic_vector(1 downto 0);
        reg_write_data : in  std_logic_vector(7 downto 0);
        reg_read_addrA : in  std_logic_vector(1 downto 0);
        reg_read_addrB : in  std_logic_vector(1 downto 0);
        reg_read_dataA : out  std_logic_vector(7 downto 0);
        reg_read_dataB : out  std_logic_vector(7 downto 0)
      );
   end component;

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal reg_write_en : std_logic := '0';
   signal reg_write_dest : std_logic_vector(1 downto 0) := (others => '0');
   signal reg_write_data : std_logic_vector(7 downto 0) := (others => '0');
   signal reg_read_addrA : std_logic_vector(1 downto 0) := (others => '0');
   signal reg_read_addrB : std_logic_vector(1 downto 0) := (others => '0');

    --Outputs
   signal reg_read_dataA : std_logic_vector(7 downto 0);
   signal reg_read_dataB : std_logic_vector(7 downto 0);

begin

	uut: TP_PSD5_EdgrantHendersonSuryajaya_2206025016_2 port map (
      clk => clk,
      reset => reset,
      reg_write_en => reg_write_en,
      reg_write_dest => reg_write_dest,
      reg_write_data => reg_write_data,
      reg_read_addrA => reg_read_addrA,
      reg_read_addrB => reg_read_addrB,
      reg_read_dataA => reg_read_dataA,
      reg_read_dataB => reg_read_dataB
    );

	-- Clock process definitions
	clk_process :process
	begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process;

	-- Stimulus process
	stim_proc: process
	begin		
		wait for 20 ns;  
		reset <= '1'; 
		wait for 40 ns;
		reset <= '0';  
		wait for 60 ns;
		reg_write_en <= '1'; 
		reg_write_dest <= "00"; 
		reg_write_data <= "00000001"; 
		wait for 20 ns;
		reg_write_dest <= "01"; 
		reg_write_data <= "00000010"; 
		wait for 20 ns;
		reg_write_dest <= "10"; 
		reg_write_data <= "00000011"; 
		wait for 20 ns;
		reg_write_dest <= "11"; 
		reg_write_data <= "00000100"; 
		wait for 20 ns;
		reg_write_en <= '0'; 
		reg_read_addrA <= "00"; 
		reg_read_addrB <= "01"; 
		wait for 20 ns;
		reg_read_addrA <= "10"; 
		reg_read_addrB <= "11"; 
      
      wait;
	end process;

end behavior;
